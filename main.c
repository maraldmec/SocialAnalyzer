#include <htc.h>
#include <stdio.h>
#include <stdarg.h>

__CONFIG (CPD_OFF & CP_OFF & MCLRE_ON & PWRTE_ON & WDTE_OFF & FOSC_INTOSCIO & BOREN_OFF);

void initPIC();
int ADC(char channel);
bit send(char data);
void sleep();
void measure();
void battery();
void wake();
void putch(unsigned char byte);
void interrupt isr();
unsigned int promilage(unsigned int r[]);
char EERead(char address);
bit EEWrite(char address, char data);

#define	FCY 	2000000 
#define _20MS 	FCY/50
#define _ADDEL  FCY/15
#define _200MS	FCY/5
#define _1000MS FCY

#define LED		RC0
#define HEATER	RC3
#define BT		RA0
#define STAT2	RA5
#define STAT1	RA4
#define SWITCH	RA2
#define BAT_AN		5
#define SENSE_AN	6


#define SAMPLES 	34
#define BAT_LEV		735

#define EE_N	0x00
#define EE_ON	0x04

char sw=0;
bit on=0;
char heat=0, heat_ref=0;




void main()
{
	initPIC();

	while(1)
	{
		if(sw==1)									//We have to make a measurement.
			measure();
		else if(sw==0)								//We want to go to standby
			sleep();
		if(on==0&&sw!=0)							//Check if device was already turned on and didn't want to go to sleep
			wake();									//If not, wake up
	}
}

void initPIC()
{							
	TRISA=0b00110100;								//RA5, RA4 and RA2 are inputs porta.
	TRISC=0b00100110;								//RC5, RC2 and RC1 are inputs.
	PORTA=0b00000001;								//Turn bluetooth module off	
	PORTC=0b00001001;								//Heater is off and LED1 is on		
	OSCCON=0b01110111;								//Internal osc on 4MHz	
	ANSEL=0b01100000;								//AN6 and AN5 are analog
	ADCON1=0b01100000;								//Analog conversion clock FCR			
	TXSTA=0b00000100;								//Serial module in async master 8 bits mode		
	RCSTA=0b00000000;								//Turn off serial module in async master 8 bits mode		
	BAUDCTL=0b00001000;								//Set baud register in 16 bits non inverting	
	SPBRG=207;										//Baudrate is 9600, so 4MHz/9600/16-1=25
	OPTION_REG=0b00000000;							//Pull up can be enabled now, interrupt on pin change from high to low, TMR0 clock is FCY, prescaler on TMR0 with 1:2 1/(2*256/FCY*50)=160Hz
	WPUAbits.WPUA2=1;								//Pull up on switch active
	EECON1=0x00;									//Reset eeprom status
	sw=0;
	on=0;
	heat=0;
	_delay(_1000MS);
	INTCON=0b10110000;								//Set-up interrupt register
	CMCON0=0xFF;									//Comparators are turned off
	INTCONbits.PEIE=1;								//Enable timer interrupts
}

void sleep()
{
	INTCONbits.T0IE=0;								//Timer int is disabled, no heating
	ADCON0bits.ADON=0;								//Turn off the ADC
	RCSTAbits.CREN=0;								//Turn off uart receiver
	TXSTAbits.TXEN=0;								//Turn off uart transmitter
	RCSTAbits.SPEN=0;								//Turn off uart module
	heat=0;
	HEATER=1;										//Turn the heater off
	BT=1;											//Turn bluetooth off
	on=0;											//Device is off
	TRISA=0b00110100;								//RA5, RA4 and RA2 are inputs porta.
	TRISC=0b00000000;								//All outputs to conserve power
	PORTA=0b00001011;								//Turn bluetooth module off	
	PORTC=0b11111110;								//Heater is off and LED1 is on
	INTCONbits.INTF=0;								//Reset switch int flag
	INTCONbits.INTE=1;								//Turn on switch
	SLEEP();
	NOP();
	return;	
}

void wake()
{
	char i;
	TRISA=0b00110100;								//RA5, RA4 and RA2 are inputs porta.
	TRISC=0b00100110;								//RC5, RC2 and RC1 are inputs.
	PORTA=0b00000000;								//Turn bluetooth module on
	PORTC=0b00001001;								//Heater is off and LED1 is on		
	ADCON0bits.ADON=1;								//Turn on the ADC
	RCSTAbits.CREN=1;								//Turn on uart receiver
	TXSTAbits.TXEN=1;								//Turn on uart transmitter
	RCSTAbits.SPEN=1;								//Turn on uart module
	on=1;											//We are on now
	INTCONbits.INTE=0;								//Turn off switch int temp
	INTCONbits.T0IF=0;								//Clear timer int flag
	TMR0=0x00;										//Clear int timer
	INTCONbits.T0IE=1;								//Put heater on with pwm on int
	heat=24;										//Preheat level
	for(i=0;i<12;i++)								//Preheat sensor for 12 seconds
	{
		_delay(_1000MS);
		LED=LED^1;
	}
	heat=8;											//Normal heater level
	INTCONbits.INTF=0;								//Reset switch int
	INTCONbits.INTE=1;								//Turn on switch
}

void interrupt isr()
{
	long unsigned int count;
	INTCONbits.GIE=0;								//Turn off global interrupts
	INTCONbits.PEIE=0;
	if(INTCONbits.T0IF&&INTCONbits.T0IE)
	{
		INTCONbits.T0IF=0;
		TMR0=0x00;
		if(heat_ref<heat)
			HEATER=0;
		else
			HEATER=1;
		heat_ref++;
		if(heat_ref>25)
			heat_ref=0;
	}
	else if(INTCONbits.INTF)
	{
		INTCONbits.INTF=0;								//Clear RA2 int flag
		HEATER=1;										//Turn the heater off
		_delay(_200MS);									//Debounce protection
		for(count=0;RA2==0||count>=40000;count++)							//Check if switch is released within about 1 second
		{
			if(count>=40000){
				sw=0;									//Button was pressed for more then 1 second, so go to sleep
				LED=0;									//Turn led off
				if(RA2==1)
				{
					_delay(_200MS);
					INTCONbits.INTF=0;						//Clear RA2 int flag
					INTCONbits.GIE=1;						//Global ints on
					return;	
				}
			}
			if(400000==count){							//Button was pressed for 10 seconds, enter config mode
				LED=1;
				BT=0;
				INTCON=0x00;							//No interrrupts
				TMR0=0x00;								//Clear timer.
				RCSTAbits.CREN=1;						//Turn on uart receiver
				TXSTAbits.TXEN=1;						//Turn on uart transmitter
				RCSTAbits.SPEN=1;						//Turn on uart module
				_delay(_1000MS);
				printf("Software revision: 0.23\n");
				printf("Resetting device! Please wait...\n");
				printf("AT+RESET");						//Reset bluetooth module
				_delay(_1000MS);						//Wait for it to reboot	
				printf("AT+NAMEsocialanalyzer");		//Set bluetooth name
				_delay(_1000MS);
				sw=0;									//Reset all registers
				on=0;
				heat=0;
				TRISA=0x00;								
				TRISC=0x00;								
				PORTA=0x00;								
				PORTC=0x00;								
				#asm
				GOTO 0x0000								//Reset processor
				#endasm
			}	
		}
		if(on==0)
			sw=2;										//Button was pressed short and device was off, turn device on
		else
			sw=1;										//Button was pressed for a short time and device was already on, make a measurement	
	}
	INTCONbits.GIE=1;								//Turn on global interrupts
	INTCONbits.PEIE=1;
}

void measure()
{
	heat=12;
	unsigned int r[SAMPLES],i,result;
	for(i=0;i<20;i++)
	{
		HEATER=1;
		INTCONbits.T0IE=0;
		ADC(SENSE_AN);
		INTCONbits.T0IE=1;
		_delay(_ADDEL);
		LED=LED^1;
	}
	for(i=0;i<SAMPLES;i++)
	{
		HEATER=1;
		INTCONbits.T0IE=0;
		r[i]=ADC(SENSE_AN);
		INTCONbits.T0IE=1;
		_delay(_ADDEL);
		LED=LED^1;
	}
	result=promilage(r);
	//send((char)((r>>8)|0x30)|)|t<<6;
	//send((char)(r&0xff));
	//printf("A:%u\n",result);
	send('A');
	send((char) ((result&0xf000)>>12)+'0' );
	send((char) ((result&0x0f00)>>8 )+'0' );
	send((char) ((result&0x00f0)>>4 )+'0' );
	send((char) ( result&0x000f     )+'0' );
	heat=8;
	battery();
	sw=2;
	return;
}

unsigned int promilage(unsigned int r[])
{
	unsigned int res1=0, res2=0,i,c=0;
	for(i=0;i<SAMPLES;i++)
	{
		res1+=r[i];	
	}
	res1/=SAMPLES;
	for(i=0;i<SAMPLES;i++)
	{
		if((r[i]<(res1+30))&&(r[i]>(res1-30)))
		{
			c++;
			res2+=r[i];
		}	
	}
	res2/=c;
	return	res2;
}

void battery()
{
	unsigned int r;
	char t=0;
	r=ADC(BAT_AN);
	if((!STAT1)&&STAT2)
		t=1;										//Charging
	else if(STAT1&&(!STAT2))
		t=2;										//Charge complete
	else if(STAT1&&STAT2)
		t=3;										//Standby
	else if(!STAT2&&!STAT1)
		t=4;										//Error

	//send((char)((r>>8)|0x30)|)|t<<6;
	//send((char)(r&0xff));
	//printf("B:%u\n",((r&0x03ff)|(t<<14)));
	send('B');
	send((char)(((t)+'0')));
	send((char)(((r&0x03ff)&0x0f00)>>8 )+'0' );
	send((char)(((r&0x03ff)&0x00f0)>>4 )+'0' );
	send((char)((r&0x03ff)&0x000f     )+'0' );
	if(r<BAT_LEV)
	{
		for(r=0;r<5;r++)
		{
			LED=0;
			_delay(_1000MS);
			LED=1;
			_delay(_200MS);	
		}
	}	
	if(t==4)
	{
		for(r=0;r<5;r++)
		{
			LED=0;
			_delay(_200MS);	
			LED=1;
			_delay(_1000MS);
		}
	}			
}

int ADC(char channel)
{
	ADCON0=(channel<<2)|(0b10000001);				//Shift the channel to the right position in the register and turn on the ADC module, right justified
	_delay(_20MS);									//Delay because of the adc acquisition time
	ADCON0bits.GO=1;								//Start conversion
	while(ADCON0bits.GO)							//Wait for conversion to be done
	{
		;
	}
	return (ADRESH<<8)|ADRESL;							//Return the 10 bits result					
}

bit send(char data)
{	
	int i;
	for(i=0;TXSTAbits.TRMT==0;i++)
	{
		if(i==5000)
			return 0;
	}
	TXREG=data;
	return 1;
}

void putch(unsigned char byte) 
{
	while(!TXIF)	
		continue;
	TXREG = byte;
}

char EERead(char address)
{
	EEADR=address;
	EECON1bits.EEPGD=0;
	EECON1bits.RD=1;
	while(EECON1bits.RD)
	{
		;
	}
	return EEDAT;
}

bit EEWrite(char address, char data)
{
	EECON1bits.WREN=1;
	EEADR=address;
	EEDAT=data;
	EECON1bits.WR=1;
	while(EECON1bits.WR)
	{
		;
	}
	EECON1bits.WREN=0;
	return 1;
}
