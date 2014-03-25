opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F688
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 5 "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 5 "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	dw 0xFFFF & 0xFFFF & 0xFFFF & 0xFFEF & 0xFFF7 & 0xFFFC & 0xFCFF ;#
	FNCALL	_main,_initPIC
	FNCALL	_main,_measure
	FNCALL	_main,_sleep
	FNCALL	_main,_wake
	FNCALL	_measure,_ADC
	FNCALL	_measure,_promilage
	FNCALL	_measure,_send
	FNCALL	_measure,_battery
	FNCALL	_battery,_ADC
	FNCALL	_battery,_send
	FNCALL	_promilage,___lwdiv
	FNROOT	_main
	FNCALL	_isr,_printf
	FNCALL	_printf,_putch
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_heat
	global	_heat_ref
	global	_on
	global	_sw
	global	_ADCON0
psect	text337,local,class=CODE,delta=2
global __ptext337
__ptext337:
_ADCON0	set	31
	global	_ADCON0bits
_ADCON0bits	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_BAUDCTL
_BAUDCTL	set	17
	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_INTCONbits
_INTCONbits	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_RCSTA
_RCSTA	set	23
	global	_RCSTAbits
_RCSTAbits	set	23
	global	_SPBRG
_SPBRG	set	19
	global	_TMR0
_TMR0	set	1
	global	_TXREG
_TXREG	set	21
	global	_TXSTA
_TXSTA	set	22
	global	_TXSTAbits
_TXSTAbits	set	22
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA0
_RA0	set	40
	global	_RA2
_RA2	set	42
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RC0
_RC0	set	56
	global	_RC3
_RC3	set	59
	global	_TXIF
_TXIF	set	97
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_ANSEL
_ANSEL	set	145
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EECON1bits
_EECON1bits	set	156
	global	_EECON2
_EECON2	set	157
	global	_EEDAT
_EEDAT	set	154
	global	_EEDATA
_EEDATA	set	154
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUAbits
_WPUAbits	set	149
	global	_RD
_RD	set	1248
	global	_WR
_WR	set	1249
	global	_WREN
_WREN	set	1250
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	82	;'R'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	116	;'t'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	118	;'v'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	101	;'e'
	retlw	33	;'!'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	119	;'w'
	retlw	97	;'a'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	10
	retlw	0
psect	strings
	
STR_1:	
	retlw	83	;'S'
	retlw	111	;'o'
	retlw	102	;'f'
	retlw	116	;'t'
	retlw	119	;'w'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	118	;'v'
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	105	;'i'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	58	;':'
	retlw	32	;' '
	retlw	48	;'0'
	retlw	46	;'.'
	retlw	50	;'2'
	retlw	51	;'3'
	retlw	10
	retlw	0
psect	strings
	
STR_4:	
	retlw	65	;'A'
	retlw	84	;'T'
	retlw	43	;'+'
	retlw	78	;'N'
	retlw	65	;'A'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	115	;'s'
	retlw	111	;'o'
	retlw	99	;'c'
	retlw	105	;'i'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	121	;'y'
	retlw	122	;'z'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	0
psect	strings
	
STR_3:	
	retlw	65	;'A'
	retlw	84	;'T'
	retlw	43	;'+'
	retlw	82	;'R'
	retlw	69	;'E'
	retlw	83	;'S'
	retlw	69	;'E'
	retlw	84	;'T'
	retlw	0
psect	strings
	file	"socialAnalizer.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_on:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_heat:
       ds      1

_heat_ref:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_sw:
       ds      1

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	((__pbssBANK1)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	measure@r
measure@r:	; 68 bytes @ 0x0
	ds	68
	global	measure@result
measure@result:	; 2 bytes @ 0x44
	ds	2
	global	measure@i
measure@i:	; 2 bytes @ 0x46
	ds	2
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_initPIC
?_initPIC:	; 0 bytes @ 0x0
	global	?_measure
?_measure:	; 0 bytes @ 0x0
	global	?_sleep
?_sleep:	; 0 bytes @ 0x0
	global	?_wake
?_wake:	; 0 bytes @ 0x0
	global	?_send
?_send:	; 1 bit 
	global	?_battery
?_battery:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	??_putch
??_putch:	; 0 bytes @ 0x0
	global	?_printf
?_printf:	; 2 bytes @ 0x0
	global	putch@byte
putch@byte:	; 1 bytes @ 0x0
	ds	1
	global	??_printf
??_printf:	; 0 bytes @ 0x1
	ds	1
	global	printf@ap
printf@ap:	; 1 bytes @ 0x2
	ds	1
	global	printf@f
printf@f:	; 1 bytes @ 0x3
	ds	1
	global	printf@c
printf@c:	; 1 bytes @ 0x4
	ds	1
	global	??_isr
??_isr:	; 0 bytes @ 0x5
	ds	7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	isr@count
isr@count:	; 4 bytes @ 0x0
	ds	4
	global	??_initPIC
??_initPIC:	; 0 bytes @ 0x4
	global	??_sleep
??_sleep:	; 0 bytes @ 0x4
	global	??_wake
??_wake:	; 0 bytes @ 0x4
	global	??_send
??_send:	; 0 bytes @ 0x4
	global	?_ADC
?_ADC:	; 2 bytes @ 0x4
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x4
	global	send@data
send@data:	; 1 bytes @ 0x4
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x4
	ds	1
	global	send@i
send@i:	; 2 bytes @ 0x5
	ds	1
	global	??_ADC
??_ADC:	; 0 bytes @ 0x6
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x6
	ds	1
	global	wake@i
wake@i:	; 1 bytes @ 0x7
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x8
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x9
	ds	1
	global	ADC@channel
ADC@channel:	; 1 bytes @ 0xA
	ds	1
	global	??_battery
??_battery:	; 0 bytes @ 0xB
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xB
	ds	1
	global	?_promilage
?_promilage:	; 2 bytes @ 0xC
	ds	2
	global	??_promilage
??_promilage:	; 0 bytes @ 0xE
	global	battery@t
battery@t:	; 1 bytes @ 0xE
	ds	1
	global	battery@r
battery@r:	; 2 bytes @ 0xF
	ds	5
	global	promilage@c
promilage@c:	; 2 bytes @ 0x14
	ds	2
	global	promilage@res2
promilage@res2:	; 2 bytes @ 0x16
	ds	2
	global	promilage@res1
promilage@res1:	; 2 bytes @ 0x18
	ds	2
	global	promilage@r
promilage@r:	; 1 bytes @ 0x1A
	ds	1
	global	promilage@i
promilage@i:	; 2 bytes @ 0x1B
	ds	2
	global	??_measure
??_measure:	; 0 bytes @ 0x1D
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x1F
;;Data sizes: Strings 90, constant 0, data 0, bss 3, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      13
;; BANK0           80     31      33
;; BANK1           80     72      73
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?_ADC	int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_promilage	unsigned int  size(1) Largest target is 0
;;
;; printf@f	PTR const unsigned char  size(1) Largest target is 34
;;		 -> STR_4(CODE[22]), STR_3(CODE[9]), STR_2(CODE[34]), STR_1(CODE[25]), 
;;
;; printf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_printf(COMMON[2]), 
;;
;; S1047$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; promilage@r	PTR unsigned int  size(1) Largest target is 68
;;		 -> measure@r(BANK1[68]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _isr->_printf
;;   _printf->_putch
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_measure
;;   _measure->_promilage
;;   _battery->_ADC
;;   _promilage->___lwdiv
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_measure
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    1235
;;                            _initPIC
;;                            _measure
;;                              _sleep
;;                               _wake
;; ---------------------------------------------------------------------------------
;; (1) _measure                                             74    74      0    1189
;;                                             29 BANK0      2     2      0
;;                                              0 BANK1     72    72      0
;;                                _ADC
;;                          _promilage
;;                               _send
;;                            _battery
;; ---------------------------------------------------------------------------------
;; (2) _battery                                              6     6      0     298
;;                                             11 BANK0      6     6      0
;;                                _ADC
;;                               _send
;; ---------------------------------------------------------------------------------
;; (2) _promilage                                           17    15      2     570
;;                                             12 BANK0     17    15      2
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (3) _ADC                                                  7     5      2      22
;;                                              4 BANK0      7     5      2
;; ---------------------------------------------------------------------------------
;; (1) _wake                                                 4     4      0      46
;;                                              4 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _sleep                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _initPIC                                              3     3      0       0
;;                                              4 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (3) ___lwdiv                                              8     4      4     162
;;                                              4 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; (3) _send                                                 3     3      0      46
;;                                              4 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr                                                 11    11      0     136
;;                                              5 COMMON     7     7      0
;;                                              0 BANK0      4     4      0
;;                             _printf
;; ---------------------------------------------------------------------------------
;; (5) _printf                                              10    10      0      68
;;                                              1 COMMON     4     4      0
;;                              _putch
;; ---------------------------------------------------------------------------------
;; (6) _putch                                                1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _initPIC
;;   _measure
;;     _ADC
;;     _promilage
;;       ___lwdiv
;;     _send
;;     _battery
;;       _ADC
;;       _send
;;   _sleep
;;   _wake
;;
;; _isr (ROOT)
;;   _printf
;;     _putch
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       9       2        0.0%
;;BANK0               50     1F      21       3       41.3%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50     48      49       5       91.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0      77       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0      80      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 50 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_initPIC
;;		_measure
;;		_sleep
;;		_wake
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	50
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	51
	
l3245:	
;main.c: 51: initPIC();
	fcall	_initPIC
	goto	l3247
	line	53
;main.c: 53: while(1)
	
l555:	
	line	55
	
l3247:	
;main.c: 54: {
;main.c: 55: if(sw==1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_sw)^080h,w
	xorlw	01h
	skipz
	goto	u3271
	goto	u3270
u3271:
	goto	l3251
u3270:
	line	56
	
l3249:	
;main.c: 56: measure();
	fcall	_measure
	goto	l3255
	line	57
	
l556:	
	
l3251:	
;main.c: 57: else if(sw==0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_sw)^080h,f
	skipz
	goto	u3281
	goto	u3280
u3281:
	goto	l3255
u3280:
	line	58
	
l3253:	
;main.c: 58: sleep();
	fcall	_sleep
	goto	l3255
	
l558:	
	goto	l3255
	line	59
	
l557:	
	
l3255:	
;main.c: 59: if(on==0&&sw!=0)
	btfsc	(_on/8),(_on)&7
	goto	u3291
	goto	u3290
u3291:
	goto	l3247
u3290:
	
l3257:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_sw)^080h,w
	skipz
	goto	u3300
	goto	l3247
u3300:
	line	60
	
l3259:	
;main.c: 60: wake();
	fcall	_wake
	goto	l3247
	
l559:	
	goto	l3247
	line	61
	
l560:	
	line	53
	goto	l3247
	
l561:	
	line	62
	
l562:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_measure
psect	text338,local,class=CODE,delta=2
global __ptext338
__ptext338:

;; *************** function _measure *****************
;; Defined at:
;;		line 210 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  r              68    0[BANK1 ] unsigned int [34]
;;  i               2   70[BANK1 ] unsigned int 
;;  result          2   68[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0      72       0
;;      Temps:          0       2       0       0
;;      Totals:         0       2      72       0
;;Total ram usage:       74 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ADC
;;		_promilage
;;		_send
;;		_battery
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text338
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	210
	global	__size_of_measure
	__size_of_measure	equ	__end_of_measure-_measure
	
_measure:	
	opt	stack 2
; Regs used in _measure: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	211
	
l3187:	
;main.c: 211: heat=12;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0
	movf	(??_measure+0)+0,w
	movwf	(_heat)
	line	213
	
l3189:	
;main.c: 212: unsigned int r[34],i,result;
;main.c: 213: for(i=0;i<20;i++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(measure@i)^080h
	clrf	(measure@i+1)^080h
	
l3191:	
	movlw	high(014h)
	subwf	(measure@i+1)^080h,w
	movlw	low(014h)
	skipnz
	subwf	(measure@i)^080h,w
	skipc
	goto	u3211
	goto	u3210
u3211:
	goto	l593
u3210:
	goto	l3207
	
l3193:	
	goto	l3207
	line	214
	
l593:	
	line	215
;main.c: 214: {
;main.c: 215: RC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	216
;main.c: 216: INTCONbits.T0IE=0;
	bcf	(11),5	;volatile
	line	217
	
l3195:	
;main.c: 217: ADC(6);
	movlw	(06h)
	fcall	_ADC
	line	218
	
l3197:	
;main.c: 218: INTCONbits.T0IE=1;
	bsf	(11),5	;volatile
	line	219
	
l3199:	
;main.c: 219: _delay(2000000/15);
	opt asmopt_off
movlw	174
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_measure+0)+0+1),f
	movlw	39
movwf	((??_measure+0)+0),f
u3317:
	decfsz	((??_measure+0)+0),f
	goto	u3317
	decfsz	((??_measure+0)+0+1),f
	goto	u3317
	clrwdt
opt asmopt_on

	line	220
	
l3201:	
;main.c: 220: RC0=RC0^1;
	movlw	1<<((56)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((56)/8),f
	line	213
	
l3203:	
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(measure@i)^080h,f
	skipnc
	incf	(measure@i+1)^080h,f
	movlw	high(01h)
	addwf	(measure@i+1)^080h,f
	
l3205:	
	movlw	high(014h)
	subwf	(measure@i+1)^080h,w
	movlw	low(014h)
	skipnz
	subwf	(measure@i)^080h,w
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l593
u3220:
	goto	l3207
	
l594:	
	line	222
	
l3207:	
;main.c: 221: }
;main.c: 222: for(i=0;i<34;i++)
	clrf	(measure@i)^080h
	clrf	(measure@i+1)^080h
	
l3209:	
	movlw	high(022h)
	subwf	(measure@i+1)^080h,w
	movlw	low(022h)
	skipnz
	subwf	(measure@i)^080h,w
	skipc
	goto	u3231
	goto	u3230
u3231:
	goto	l595
u3230:
	goto	l3225
	
l3211:	
	goto	l3225
	line	223
	
l595:	
	line	224
;main.c: 223: {
;main.c: 224: RC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	225
;main.c: 225: INTCONbits.T0IE=0;
	bcf	(11),5	;volatile
	line	226
	
l3213:	
;main.c: 226: r[i]=ADC(6);
	movlw	(06h)
	fcall	_ADC
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(measure@i)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0
	addwf	(??_measure+0)+0,w
	addlw	measure@r&0ffh
	movwf	fsr0
	movf	(0+(?_ADC)),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_ADC)),w
	movwf	indf
	line	227
	
l3215:	
;main.c: 227: INTCONbits.T0IE=1;
	bsf	(11),5	;volatile
	line	228
	
l3217:	
;main.c: 228: _delay(2000000/15);
	opt asmopt_off
movlw	174
movwf	((??_measure+0)+0+1),f
	movlw	39
movwf	((??_measure+0)+0),f
u3327:
	decfsz	((??_measure+0)+0),f
	goto	u3327
	decfsz	((??_measure+0)+0+1),f
	goto	u3327
	clrwdt
opt asmopt_on

	line	229
	
l3219:	
;main.c: 229: RC0=RC0^1;
	movlw	1<<((56)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((56)/8),f
	line	222
	
l3221:	
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(measure@i)^080h,f
	skipnc
	incf	(measure@i+1)^080h,f
	movlw	high(01h)
	addwf	(measure@i+1)^080h,f
	
l3223:	
	movlw	high(022h)
	subwf	(measure@i+1)^080h,w
	movlw	low(022h)
	skipnz
	subwf	(measure@i)^080h,w
	skipc
	goto	u3241
	goto	u3240
u3241:
	goto	l595
u3240:
	goto	l3225
	
l596:	
	line	231
	
l3225:	
;main.c: 230: }
;main.c: 231: result=promilage(r);
	movlw	(measure@r)&0ffh
	fcall	_promilage
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_promilage)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(measure@result+1)^080h
	addwf	(measure@result+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_promilage)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(measure@result)^080h
	addwf	(measure@result)^080h

	line	235
	
l3227:	
;main.c: 235: send('A');
	movlw	(041h)
	fcall	_send
	line	236
	
l3229:	
;main.c: 236: send((char) ((result&0xf000)>>12)+'0' );
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(measure@result+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(measure@result)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0
	movlw	0Ch
u3255:
	clrc
	rrf	(??_measure+0)+1,f
	rrf	(??_measure+0)+0,f
	addlw	-1
	skipz
	goto	u3255
	movf	0+(??_measure+0)+0,w
	andlw	0Fh
	addlw	030h
	fcall	_send
	line	237
	
l3231:	
;main.c: 237: send((char) ((result&0x0f00)>>8 )+'0' );
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(measure@result+1)^080h,w
	andlw	0Fh
	addlw	030h
	fcall	_send
	line	238
	
l3233:	
;main.c: 238: send((char) ((result&0x00f0)>>4 )+'0' );
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(measure@result+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(measure@result)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0
	movlw	04h
u3265:
	clrc
	rrf	(??_measure+0)+1,f
	rrf	(??_measure+0)+0,f
	addlw	-1
	skipz
	goto	u3265
	movf	0+(??_measure+0)+0,w
	andlw	0Fh
	addlw	030h
	fcall	_send
	line	239
	
l3235:	
;main.c: 239: send((char) ( result&0x000f )+'0' );
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(measure@result)^080h,w
	andlw	0Fh
	addlw	030h
	fcall	_send
	line	240
	
l3237:	
;main.c: 240: heat=8;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0
	movf	(??_measure+0)+0,w
	movwf	(_heat)
	line	241
	
l3239:	
;main.c: 241: battery();
	fcall	_battery
	line	242
	
l3241:	
;main.c: 242: sw=2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_measure+0)+0
	movf	(??_measure+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_sw)^080h
	goto	l597
	line	243
	
l3243:	
	line	244
;main.c: 243: return;
	
l597:	
	return
	opt stack 0
GLOBAL	__end_of_measure
	__end_of_measure:
;; =============== function _measure ends ============

	signat	_measure,88
	global	_battery
psect	text339,local,class=CODE,delta=2
global __ptext339
__ptext339:

;; *************** function _battery *****************
;; Defined at:
;;		line 267 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  r               2   15[BANK0 ] unsigned int 
;;  t               1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ADC
;;		_send
;; This function is called by:
;;		_measure
;; This function uses a non-reentrant model
;;
psect	text339
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	267
	global	__size_of_battery
	__size_of_battery	equ	__end_of_battery-_battery
	
_battery:	
	opt	stack 2
; Regs used in _battery: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	269
	
l3131:	
;main.c: 268: unsigned int r;
;main.c: 269: char t=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(battery@t)
	line	270
	
l3133:	
;main.c: 270: r=ADC(5);
	movlw	(05h)
	fcall	_ADC
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_ADC)),w
	clrf	(battery@r+1)
	addwf	(battery@r+1)
	movf	(0+(?_ADC)),w
	clrf	(battery@r)
	addwf	(battery@r)

	line	271
	
l3135:	
;main.c: 271: if((!RA4)&&RA5)
	btfsc	(44/8),(44)&7
	goto	u3061
	goto	u3060
u3061:
	goto	l608
u3060:
	
l3137:	
	btfss	(45/8),(45)&7
	goto	u3071
	goto	u3070
u3071:
	goto	l608
u3070:
	line	272
	
l3139:	
;main.c: 272: t=1;
	clrf	(battery@t)
	bsf	status,0
	rlf	(battery@t),f
	goto	l3153
	line	273
	
l608:	
;main.c: 273: else if(RA4&&(!RA5))
	btfss	(44/8),(44)&7
	goto	u3081
	goto	u3080
u3081:
	goto	l610
u3080:
	
l3141:	
	btfsc	(45/8),(45)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l610
u3090:
	line	274
	
l3143:	
;main.c: 274: t=2;
	movlw	(02h)
	movwf	(??_battery+0)+0
	movf	(??_battery+0)+0,w
	movwf	(battery@t)
	goto	l3153
	line	275
	
l610:	
;main.c: 275: else if(RA4&&RA5)
	btfss	(44/8),(44)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l612
u3100:
	
l3145:	
	btfss	(45/8),(45)&7
	goto	u3111
	goto	u3110
u3111:
	goto	l612
u3110:
	line	276
	
l3147:	
;main.c: 276: t=3;
	movlw	(03h)
	movwf	(??_battery+0)+0
	movf	(??_battery+0)+0,w
	movwf	(battery@t)
	goto	l3153
	line	277
	
l612:	
;main.c: 277: else if(!RA5&&!RA4)
	btfsc	(45/8),(45)&7
	goto	u3121
	goto	u3120
u3121:
	goto	l3153
u3120:
	
l3149:	
	btfsc	(44/8),(44)&7
	goto	u3131
	goto	u3130
u3131:
	goto	l3153
u3130:
	line	278
	
l3151:	
;main.c: 278: t=4;
	movlw	(04h)
	movwf	(??_battery+0)+0
	movf	(??_battery+0)+0,w
	movwf	(battery@t)
	goto	l3153
	
l614:	
	goto	l3153
	line	283
	
l613:	
	goto	l3153
	
l611:	
	goto	l3153
	
l609:	
	
l3153:	
;main.c: 283: send('B');
	movlw	(042h)
	fcall	_send
	line	284
	
l3155:	
;main.c: 284: send((char)(((t)+'0')));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(battery@t),w
	addlw	030h
	fcall	_send
	line	285
	
l3157:	
;main.c: 285: send((char)(((r&0x03ff)&0x0f00)>>8 )+'0' );
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(battery@r+1),w
	andlw	03h
	addlw	030h
	fcall	_send
	line	286
	
l3159:	
;main.c: 286: send((char)(((r&0x03ff)&0x00f0)>>4 )+'0' );
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(battery@r+1),w
	movwf	(??_battery+0)+0+1
	movf	(battery@r),w
	movwf	(??_battery+0)+0
	movlw	04h
u3145:
	clrc
	rrf	(??_battery+0)+1,f
	rrf	(??_battery+0)+0,f
	addlw	-1
	skipz
	goto	u3145
	movf	0+(??_battery+0)+0,w
	andlw	0Fh
	addlw	030h
	fcall	_send
	line	287
	
l3161:	
;main.c: 287: send((char)((r&0x03ff)&0x000f )+'0' );
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(battery@r),w
	andlw	0Fh
	addlw	030h
	fcall	_send
	line	288
	
l3163:	
;main.c: 288: if(r<735)
	movlw	high(02DFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(battery@r+1),w
	movlw	low(02DFh)
	skipnz
	subwf	(battery@r),w
	skipnc
	goto	u3151
	goto	u3150
u3151:
	goto	l3175
u3150:
	line	290
	
l3165:	
;main.c: 289: {
;main.c: 290: for(r=0;r<5;r++)
	clrf	(battery@r)
	clrf	(battery@r+1)
	
l3167:	
	movlw	high(05h)
	subwf	(battery@r+1),w
	movlw	low(05h)
	skipnz
	subwf	(battery@r),w
	skipc
	goto	u3161
	goto	u3160
u3161:
	goto	l616
u3160:
	goto	l3175
	
l3169:	
	goto	l3175
	line	291
	
l616:	
	line	292
;main.c: 291: {
;main.c: 292: RC0=0;
	bcf	(56/8),(56)&7
	line	293
	
l3171:	
;main.c: 293: _delay(2000000);
	opt asmopt_off
movlw  11
movwf	((??_battery+0)+0+2),f
movlw	38
movwf	((??_battery+0)+0+1),f
	movlw	102
movwf	((??_battery+0)+0),f
u3337:
	decfsz	((??_battery+0)+0),f
	goto	u3337
	decfsz	((??_battery+0)+0+1),f
	goto	u3337
	decfsz	((??_battery+0)+0+2),f
	goto	u3337
	nop2
opt asmopt_on

	line	294
	
l3173:	
;main.c: 294: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	295
;main.c: 295: _delay(2000000/5);
	opt asmopt_off
movlw  3
movwf	((??_battery+0)+0+2),f
movlw	8
movwf	((??_battery+0)+0+1),f
	movlw	120
movwf	((??_battery+0)+0),f
u3347:
	decfsz	((??_battery+0)+0),f
	goto	u3347
	decfsz	((??_battery+0)+0+1),f
	goto	u3347
	decfsz	((??_battery+0)+0+2),f
	goto	u3347
opt asmopt_on

	line	290
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(battery@r),f
	skipnc
	incf	(battery@r+1),f
	movlw	high(01h)
	addwf	(battery@r+1),f
	movlw	high(05h)
	subwf	(battery@r+1),w
	movlw	low(05h)
	skipnz
	subwf	(battery@r),w
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l616
u3170:
	goto	l3175
	
l617:	
	goto	l3175
	line	297
	
l615:	
	line	298
	
l3175:	
;main.c: 296: }
;main.c: 297: }
;main.c: 298: if(t==4)
	movf	(battery@t),w
	xorlw	04h
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l621
u3180:
	line	300
	
l3177:	
;main.c: 299: {
;main.c: 300: for(r=0;r<5;r++)
	clrf	(battery@r)
	clrf	(battery@r+1)
	
l3179:	
	movlw	high(05h)
	subwf	(battery@r+1),w
	movlw	low(05h)
	skipnz
	subwf	(battery@r),w
	skipc
	goto	u3191
	goto	u3190
u3191:
	goto	l619
u3190:
	goto	l621
	
l3181:	
	goto	l621
	line	301
	
l619:	
	line	302
;main.c: 301: {
;main.c: 302: RC0=0;
	bcf	(56/8),(56)&7
	line	303
	
l3183:	
;main.c: 303: _delay(2000000/5);
	opt asmopt_off
movlw  3
movwf	((??_battery+0)+0+2),f
movlw	8
movwf	((??_battery+0)+0+1),f
	movlw	120
movwf	((??_battery+0)+0),f
u3357:
	decfsz	((??_battery+0)+0),f
	goto	u3357
	decfsz	((??_battery+0)+0+1),f
	goto	u3357
	decfsz	((??_battery+0)+0+2),f
	goto	u3357
opt asmopt_on

	line	304
	
l3185:	
;main.c: 304: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	305
;main.c: 305: _delay(2000000);
	opt asmopt_off
movlw  11
movwf	((??_battery+0)+0+2),f
movlw	38
movwf	((??_battery+0)+0+1),f
	movlw	102
movwf	((??_battery+0)+0),f
u3367:
	decfsz	((??_battery+0)+0),f
	goto	u3367
	decfsz	((??_battery+0)+0+1),f
	goto	u3367
	decfsz	((??_battery+0)+0+2),f
	goto	u3367
	nop2
opt asmopt_on

	line	300
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(battery@r),f
	skipnc
	incf	(battery@r+1),f
	movlw	high(01h)
	addwf	(battery@r+1),f
	movlw	high(05h)
	subwf	(battery@r+1),w
	movlw	low(05h)
	skipnz
	subwf	(battery@r),w
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l619
u3200:
	goto	l621
	
l620:	
	goto	l621
	line	307
	
l618:	
	line	308
	
l621:	
	return
	opt stack 0
GLOBAL	__end_of_battery
	__end_of_battery:
;; =============== function _battery ends ============

	signat	_battery,88
	global	_promilage
psect	text340,local,class=CODE,delta=2
global __ptext340
__ptext340:

;; *************** function _promilage *****************
;; Defined at:
;;		line 247 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;  r               1    wreg     PTR unsigned int 
;;		 -> measure@r(68), 
;; Auto vars:     Size  Location     Type
;;  r               1   26[BANK0 ] PTR unsigned int 
;;		 -> measure@r(68), 
;;  i               2   27[BANK0 ] unsigned int 
;;  res1            2   24[BANK0 ] unsigned int 
;;  res2            2   22[BANK0 ] unsigned int 
;;  c               2   20[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   12[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       9       0       0
;;      Temps:          0       6       0       0
;;      Totals:         0      17       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___lwdiv
;; This function is called by:
;;		_measure
;; This function uses a non-reentrant model
;;
psect	text340
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	247
	global	__size_of_promilage
	__size_of_promilage	equ	__end_of_promilage-_promilage
	
_promilage:	
	opt	stack 2
; Regs used in _promilage: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;promilage@r stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(promilage@r)
	line	248
	
l3093:	
;main.c: 248: unsigned int res1=0, res2=0,i,c=0;
	clrf	(promilage@res1)
	clrf	(promilage@res1+1)
	clrf	(promilage@res2)
	clrf	(promilage@res2+1)
	clrf	(promilage@c)
	clrf	(promilage@c+1)
	line	249
;main.c: 249: for(i=0;i<34;i++)
	clrf	(promilage@i)
	clrf	(promilage@i+1)
	
l3095:	
	movlw	high(022h)
	subwf	(promilage@i+1),w
	movlw	low(022h)
	skipnz
	subwf	(promilage@i),w
	skipc
	goto	u3001
	goto	u3000
u3001:
	goto	l3099
u3000:
	goto	l3105
	
l3097:	
	goto	l3105
	line	250
	
l600:	
	line	251
	
l3099:	
;main.c: 250: {
;main.c: 251: res1+=r[i];
	movf	(promilage@i),w
	movwf	(??_promilage+0)+0
	addwf	(??_promilage+0)+0,w
	addwf	(promilage@r),w
	movwf	(??_promilage+1)+0
	movf	0+(??_promilage+1)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_promilage+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_promilage+2)+0+1
	movf	0+(??_promilage+2)+0,w
	addwf	(promilage@res1),f
	skipnc
	incf	(promilage@res1+1),f
	movf	1+(??_promilage+2)+0,w
	addwf	(promilage@res1+1),f
	line	249
	
l3101:	
	movlw	low(01h)
	addwf	(promilage@i),f
	skipnc
	incf	(promilage@i+1),f
	movlw	high(01h)
	addwf	(promilage@i+1),f
	
l3103:	
	movlw	high(022h)
	subwf	(promilage@i+1),w
	movlw	low(022h)
	skipnz
	subwf	(promilage@i),w
	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l3099
u3010:
	goto	l3105
	
l601:	
	line	253
	
l3105:	
;main.c: 252: }
;main.c: 253: res1/=34;
	movlw	low(022h)
	movwf	(?___lwdiv)
	movlw	high(022h)
	movwf	((?___lwdiv))+1
	movf	(promilage@res1+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(promilage@res1),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(promilage@res1+1)
	addwf	(promilage@res1+1)
	movf	(0+(?___lwdiv)),w
	clrf	(promilage@res1)
	addwf	(promilage@res1)

	line	254
	
l3107:	
;main.c: 254: for(i=0;i<34;i++)
	clrf	(promilage@i)
	clrf	(promilage@i+1)
	
l3109:	
	movlw	high(022h)
	subwf	(promilage@i+1),w
	movlw	low(022h)
	skipnz
	subwf	(promilage@i),w
	skipc
	goto	u3021
	goto	u3020
u3021:
	goto	l3113
u3020:
	goto	l3125
	
l3111:	
	goto	l3125
	line	255
	
l602:	
	line	256
	
l3113:	
;main.c: 255: {
;main.c: 256: if((r[i]<(res1+30))&&(r[i]>(res1-30)))
	movf	(promilage@res1),w
	addlw	low(01Eh)
	movwf	(??_promilage+0)+0
	movf	(promilage@res1+1),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(??_promilage+0)+0
	movf	(promilage@i),w
	movwf	(??_promilage+2)+0
	addwf	(??_promilage+2)+0,w
	addwf	(promilage@r),w
	movwf	(??_promilage+3)+0
	movf	0+(??_promilage+3)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_promilage+4)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_promilage+4)+0+1
	movf	1+(??_promilage+0)+0,w
	subwf	1+(??_promilage+4)+0,w
	skipz
	goto	u3035
	movf	0+(??_promilage+0)+0,w
	subwf	0+(??_promilage+4)+0,w
u3035:
	skipnc
	goto	u3031
	goto	u3030
u3031:
	goto	l3121
u3030:
	
l3115:	
	movf	(promilage@i),w
	movwf	(??_promilage+0)+0
	addwf	(??_promilage+0)+0,w
	addwf	(promilage@r),w
	movwf	(??_promilage+1)+0
	movf	0+(??_promilage+1)+0,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_promilage+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_promilage+2)+0+1
	movf	(promilage@res1),w
	addlw	low(0FFE2h)
	movwf	(??_promilage+4)+0
	movf	(promilage@res1+1),w
	skipnc
	addlw	1
	addlw	high(0FFE2h)
	movwf	1+(??_promilage+4)+0
	movf	1+(??_promilage+2)+0,w
	subwf	1+(??_promilage+4)+0,w
	skipz
	goto	u3045
	movf	0+(??_promilage+2)+0,w
	subwf	0+(??_promilage+4)+0,w
u3045:
	skipnc
	goto	u3041
	goto	u3040
u3041:
	goto	l3121
u3040:
	line	258
	
l3117:	
;main.c: 257: {
;main.c: 258: c++;
	movlw	low(01h)
	addwf	(promilage@c),f
	skipnc
	incf	(promilage@c+1),f
	movlw	high(01h)
	addwf	(promilage@c+1),f
	line	259
	
l3119:	
;main.c: 259: res2+=r[i];
	movf	(promilage@i),w
	movwf	(??_promilage+0)+0
	addwf	(??_promilage+0)+0,w
	addwf	(promilage@r),w
	movwf	(??_promilage+1)+0
	movf	0+(??_promilage+1)+0,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_promilage+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_promilage+2)+0+1
	movf	0+(??_promilage+2)+0,w
	addwf	(promilage@res2),f
	skipnc
	incf	(promilage@res2+1),f
	movf	1+(??_promilage+2)+0,w
	addwf	(promilage@res2+1),f
	goto	l3121
	line	260
	
l604:	
	line	254
	
l3121:	
	movlw	low(01h)
	addwf	(promilage@i),f
	skipnc
	incf	(promilage@i+1),f
	movlw	high(01h)
	addwf	(promilage@i+1),f
	
l3123:	
	movlw	high(022h)
	subwf	(promilage@i+1),w
	movlw	low(022h)
	skipnz
	subwf	(promilage@i),w
	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l3113
u3050:
	goto	l3125
	
l603:	
	line	262
	
l3125:	
;main.c: 260: }
;main.c: 261: }
;main.c: 262: res2/=c;
	movf	(promilage@c+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(promilage@c),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movf	(promilage@res2+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(promilage@res2),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(promilage@res2+1)
	addwf	(promilage@res2+1)
	movf	(0+(?___lwdiv)),w
	clrf	(promilage@res2)
	addwf	(promilage@res2)

	line	263
	
l3127:	
;main.c: 263: return res2;
	movf	(promilage@res2+1),w
	clrf	(?_promilage+1)
	addwf	(?_promilage+1)
	movf	(promilage@res2),w
	clrf	(?_promilage)
	addwf	(?_promilage)

	goto	l605
	
l3129:	
	line	264
	
l605:	
	return
	opt stack 0
GLOBAL	__end_of_promilage
	__end_of_promilage:
;; =============== function _promilage ends ============

	signat	_promilage,4218
	global	_ADC
psect	text341,local,class=CODE,delta=2
global __ptext341
__ptext341:

;; *************** function _ADC *****************
;; Defined at:
;;		line 311 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    4[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_measure
;;		_battery
;; This function uses a non-reentrant model
;;
psect	text341
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	311
	global	__size_of_ADC
	__size_of_ADC	equ	__end_of_ADC-_ADC
	
_ADC:	
	opt	stack 2
; Regs used in _ADC: [wreg+status,2+status,0+btemp+1]
;ADC@channel stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADC@channel)
	line	312
	
l3083:	
;main.c: 312: ADCON0=(channel<<2)|(0b10000001);
	movf	(ADC@channel),w
	movwf	(??_ADC+0)+0
	movlw	(02h)-1
u2985:
	clrc
	rlf	(??_ADC+0)+0,f
	addlw	-1
	skipz
	goto	u2985
	clrc
	rlf	(??_ADC+0)+0,w
	iorlw	081h
	movwf	(31)	;volatile
	line	313
	
l3085:	
;main.c: 313: _delay(2000000/50);
	opt asmopt_off
movlw	52
movwf	((??_ADC+0)+0+1),f
	movlw	241
movwf	((??_ADC+0)+0),f
u3377:
	decfsz	((??_ADC+0)+0),f
	goto	u3377
	decfsz	((??_ADC+0)+0+1),f
	goto	u3377
	nop2
opt asmopt_on

	line	314
	
l3087:	
;main.c: 314: ADCON0bits.GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(31),1	;volatile
	line	315
;main.c: 315: while(ADCON0bits.GO)
	goto	l624
	
l625:	
	line	318
;main.c: 316: {
;main.c: 317: ;
	
l624:	
	line	315
	btfsc	(31),1	;volatile
	goto	u2991
	goto	u2990
u2991:
	goto	l624
u2990:
	goto	l3089
	
l626:	
	line	319
	
l3089:	
;main.c: 318: }
;main.c: 319: return (ADRESH<<8)|ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADC+0)+0
	clrf	(??_ADC+0)+0+1
	movf	(30),w	;volatile
	movwf	(??_ADC+2)+0
	clrf	(??_ADC+2)+0+1
	movf	(??_ADC+2)+0,w
	movwf	(??_ADC+2)+1
	clrf	(??_ADC+2)+0
	movf	0+(??_ADC+0)+0,w
	iorwf	0+(??_ADC+2)+0,w
	movwf	(?_ADC)
	movf	1+(??_ADC+0)+0,w
	iorwf	1+(??_ADC+2)+0,w
	movwf	1+(?_ADC)
	goto	l627
	
l3091:	
	line	320
	
l627:	
	return
	opt stack 0
GLOBAL	__end_of_ADC
	__end_of_ADC:
;; =============== function _ADC ends ============

	signat	_ADC,4218
	global	_wake
psect	text342,local,class=CODE,delta=2
global __ptext342
__ptext342:

;; *************** function _wake *****************
;; Defined at:
;;		line 112 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text342
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	112
	global	__size_of_wake
	__size_of_wake	equ	__end_of_wake-_wake
	
_wake:	
	opt	stack 4
; Regs used in _wake: [wreg+status,2+status,0]
	line	114
	
l3041:	
;main.c: 113: char i;
;main.c: 114: TRISA=0b00110100;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	115
;main.c: 115: TRISC=0b00100110;
	movlw	(026h)
	movwf	(135)^080h	;volatile
	line	116
	
l3043:	
;main.c: 116: PORTA=0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	117
	
l3045:	
;main.c: 117: PORTC=0b00001001;
	movlw	(09h)
	movwf	(7)	;volatile
	line	118
	
l3047:	
;main.c: 118: ADCON0bits.ADON=1;
	bsf	(31),0	;volatile
	line	119
	
l3049:	
;main.c: 119: RCSTAbits.CREN=1;
	bsf	(23),4	;volatile
	line	120
	
l3051:	
;main.c: 120: TXSTAbits.TXEN=1;
	bsf	(22),5	;volatile
	line	121
	
l3053:	
;main.c: 121: RCSTAbits.SPEN=1;
	bsf	(23),7	;volatile
	line	122
	
l3055:	
;main.c: 122: on=1;
	bsf	(_on/8),(_on)&7
	line	123
	
l3057:	
;main.c: 123: INTCONbits.INTE=0;
	bcf	(11),4	;volatile
	line	124
	
l3059:	
;main.c: 124: INTCONbits.T0IF=0;
	bcf	(11),2	;volatile
	line	125
;main.c: 125: TMR0=0x00;
	clrf	(1)	;volatile
	line	126
	
l3061:	
;main.c: 126: INTCONbits.T0IE=1;
	bsf	(11),5	;volatile
	line	127
	
l3063:	
;main.c: 127: heat=24;
	movlw	(018h)
	movwf	(??_wake+0)+0
	movf	(??_wake+0)+0,w
	movwf	(_heat)
	line	128
	
l3065:	
;main.c: 128: for(i=0;i<12;i++)
	clrf	(wake@i)
	
l3067:	
	movlw	(0Ch)
	subwf	(wake@i),w
	skipc
	goto	u2961
	goto	u2960
u2961:
	goto	l3071
u2960:
	goto	l3077
	
l3069:	
	goto	l3077
	line	129
	
l571:	
	line	130
	
l3071:	
;main.c: 129: {
;main.c: 130: _delay(2000000);
	opt asmopt_off
movlw  11
movwf	((??_wake+0)+0+2),f
movlw	38
movwf	((??_wake+0)+0+1),f
	movlw	102
movwf	((??_wake+0)+0),f
u3387:
	decfsz	((??_wake+0)+0),f
	goto	u3387
	decfsz	((??_wake+0)+0+1),f
	goto	u3387
	decfsz	((??_wake+0)+0+2),f
	goto	u3387
	nop2
opt asmopt_on

	line	131
;main.c: 131: RC0=RC0^1;
	movlw	1<<((56)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((56)/8),f
	line	128
	
l3073:	
	movlw	(01h)
	movwf	(??_wake+0)+0
	movf	(??_wake+0)+0,w
	addwf	(wake@i),f
	
l3075:	
	movlw	(0Ch)
	subwf	(wake@i),w
	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l3071
u2970:
	goto	l3077
	
l572:	
	line	133
	
l3077:	
;main.c: 132: }
;main.c: 133: heat=8;
	movlw	(08h)
	movwf	(??_wake+0)+0
	movf	(??_wake+0)+0,w
	movwf	(_heat)
	line	134
	
l3079:	
;main.c: 134: INTCONbits.INTF=0;
	bcf	(11),1	;volatile
	line	135
	
l3081:	
;main.c: 135: INTCONbits.INTE=1;
	bsf	(11),4	;volatile
	line	136
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_wake
	__end_of_wake:
;; =============== function _wake ends ============

	signat	_wake,88
	global	_sleep
psect	text343,local,class=CODE,delta=2
global __ptext343
__ptext343:

;; *************** function _sleep *****************
;; Defined at:
;;		line 90 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text343
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	90
	global	__size_of_sleep
	__size_of_sleep	equ	__end_of_sleep-_sleep
	
_sleep:	
	opt	stack 4
; Regs used in _sleep: [wreg+status,2]
	line	91
	
l3021:	
;main.c: 91: INTCONbits.T0IE=0;
	bcf	(11),5	;volatile
	line	92
;main.c: 92: ADCON0bits.ADON=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(31),0	;volatile
	line	93
;main.c: 93: RCSTAbits.CREN=0;
	bcf	(23),4	;volatile
	line	94
;main.c: 94: TXSTAbits.TXEN=0;
	bcf	(22),5	;volatile
	line	95
;main.c: 95: RCSTAbits.SPEN=0;
	bcf	(23),7	;volatile
	line	96
;main.c: 96: heat=0;
	clrf	(_heat)
	line	97
;main.c: 97: RC3=1;
	bsf	(59/8),(59)&7
	line	98
;main.c: 98: RA0=1;
	bsf	(40/8),(40)&7
	line	99
;main.c: 99: on=0;
	bcf	(_on/8),(_on)&7
	line	100
	
l3023:	
;main.c: 100: TRISA=0b00110100;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	101
	
l3025:	
;main.c: 101: TRISC=0b00000000;
	clrf	(135)^080h	;volatile
	line	102
	
l3027:	
;main.c: 102: PORTA=0b00001011;
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	103
	
l3029:	
;main.c: 103: PORTC=0b11111110;
	movlw	(0FEh)
	movwf	(7)	;volatile
	line	104
	
l3031:	
;main.c: 104: INTCONbits.INTF=0;
	bcf	(11),1	;volatile
	line	105
	
l3033:	
;main.c: 105: INTCONbits.INTE=1;
	bsf	(11),4	;volatile
	line	106
	
l3035:	
# 106 "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
sleep ;#
psect	text343
	line	107
	
l3037:	
;main.c: 107: _nop();
	nop
	goto	l568
	line	108
	
l3039:	
	line	109
;main.c: 108: return;
	
l568:	
	return
	opt stack 0
GLOBAL	__end_of_sleep
	__end_of_sleep:
;; =============== function _sleep ends ============

	signat	_sleep,88
	global	_initPIC
psect	text344,local,class=CODE,delta=2
global __ptext344
__ptext344:

;; *************** function _initPIC *****************
;; Defined at:
;;		line 65 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text344
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	65
	global	__size_of_initPIC
	__size_of_initPIC	equ	__end_of_initPIC-_initPIC
	
_initPIC:	
	opt	stack 4
; Regs used in _initPIC: [wreg+status,2]
	line	66
	
l2993:	
;main.c: 66: TRISA=0b00110100;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	67
;main.c: 67: TRISC=0b00100110;
	movlw	(026h)
	movwf	(135)^080h	;volatile
	line	68
;main.c: 68: PORTA=0b00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	69
;main.c: 69: PORTC=0b00001001;
	movlw	(09h)
	movwf	(7)	;volatile
	line	70
;main.c: 70: OSCCON=0b01110111;
	movlw	(077h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	71
;main.c: 71: ANSEL=0b01100000;
	movlw	(060h)
	movwf	(145)^080h	;volatile
	line	72
;main.c: 72: ADCON1=0b01100000;
	movlw	(060h)
	movwf	(159)^080h	;volatile
	line	73
;main.c: 73: TXSTA=0b00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(22)	;volatile
	line	74
	
l2995:	
;main.c: 74: RCSTA=0b00000000;
	clrf	(23)	;volatile
	line	75
	
l2997:	
;main.c: 75: BAUDCTL=0b00001000;
	movlw	(08h)
	movwf	(17)	;volatile
	line	76
	
l2999:	
;main.c: 76: SPBRG=207;
	movlw	(0CFh)
	movwf	(19)	;volatile
	line	77
	
l3001:	
;main.c: 77: OPTION_REG=0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(129)^080h	;volatile
	line	78
	
l3003:	
;main.c: 78: WPUAbits.WPUA2=1;
	bsf	(149)^080h,2	;volatile
	line	79
	
l3005:	
;main.c: 79: EECON1=0x00;
	clrf	(156)^080h	;volatile
	line	80
	
l3007:	
;main.c: 80: sw=0;
	clrf	(_sw)^080h
	line	81
	
l3009:	
;main.c: 81: on=0;
	bcf	(_on/8),(_on)&7
	line	82
	
l3011:	
;main.c: 82: heat=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_heat)
	line	83
	
l3013:	
;main.c: 83: _delay(2000000);
	opt asmopt_off
movlw  11
movwf	((??_initPIC+0)+0+2),f
movlw	38
movwf	((??_initPIC+0)+0+1),f
	movlw	102
movwf	((??_initPIC+0)+0),f
u3397:
	decfsz	((??_initPIC+0)+0),f
	goto	u3397
	decfsz	((??_initPIC+0)+0+1),f
	goto	u3397
	decfsz	((??_initPIC+0)+0+2),f
	goto	u3397
	nop2
opt asmopt_on

	line	84
	
l3015:	
;main.c: 84: INTCON=0b10110000;
	movlw	(0B0h)
	movwf	(11)	;volatile
	line	85
	
l3017:	
;main.c: 85: CMCON0=0xFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	86
	
l3019:	
;main.c: 86: INTCONbits.PEIE=1;
	bsf	(11),6	;volatile
	line	87
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_initPIC
	__end_of_initPIC:
;; =============== function _initPIC ends ============

	signat	_initPIC,88
	global	___lwdiv
psect	text345,local,class=CODE,delta=2
global __ptext345
__ptext345:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    4[BANK0 ] unsigned int 
;;  dividend        2    6[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    9[BANK0 ] unsigned int 
;;  counter         1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    4[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_promilage
;; This function uses a non-reentrant model
;;
psect	text345
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2967:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l2969:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2891
	goto	u2890
u2891:
	goto	l2989
u2890:
	line	11
	
l2971:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2977
	
l1205:	
	line	13
	
l2973:	
	movlw	01h
	
u2905:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2905
	line	14
	
l2975:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l2977
	line	15
	
l1204:	
	line	12
	
l2977:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l2973
u2910:
	goto	l2979
	
l1206:	
	goto	l2979
	line	16
	
l1207:	
	line	17
	
l2979:	
	movlw	01h
	
u2925:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2925
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2935
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2935:
	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l2985
u2930:
	line	19
	
l2981:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2983:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l2985
	line	21
	
l1208:	
	line	22
	
l2985:	
	movlw	01h
	
u2945:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2945
	line	23
	
l2987:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2951
	goto	u2950
u2951:
	goto	l2979
u2950:
	goto	l2989
	
l1209:	
	goto	l2989
	line	24
	
l1203:	
	line	25
	
l2989:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l1210
	
l2991:	
	line	26
	
l1210:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_send
psect	text346,local,class=CODE,delta=2
global __ptext346
__ptext346:

;; *************** function _send *****************
;; Defined at:
;;		line 323 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    4[BANK0 ] unsigned char 
;;  i               2    5[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_measure
;;		_battery
;; This function uses a non-reentrant model
;;
psect	text346
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	323
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 2
; Regs used in _send: [wreg+status,2]
;send@data stored from wreg
	line	325
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(send@data)
	
l2949:	
;main.c: 324: int i;
;main.c: 325: for(i=0;TXSTAbits.TRMT==0;i++)
	clrf	(send@i)
	clrf	(send@i+1)
	goto	l2957
	line	326
	
l631:	
	line	327
	
l2951:	
;main.c: 326: {
;main.c: 327: if(i==5000)
	movlw	high(01388h)
	xorwf	(send@i+1),w
	skipz
	goto	u2865
	movlw	low(01388h)
	xorwf	(send@i),w
u2865:

	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l2955
u2860:
	goto	l633
	line	328
	
l2953:	
;main.c: 328: return 0;
;	Return value of _send is never used
	goto	l633
	
l632:	
	line	325
	
l2955:	
	movlw	low(01h)
	addwf	(send@i),f
	skipnc
	incf	(send@i+1),f
	movlw	high(01h)
	addwf	(send@i+1),f
	goto	l2957
	
l630:	
	
l2957:	
	btfss	(22),1	;volatile
	goto	u2871
	goto	u2870
u2871:
	goto	l2951
u2870:
	goto	l2959
	
l634:	
	line	330
	
l2959:	
;main.c: 329: }
;main.c: 330: TXREG=data;
	movf	(send@data),w
	movwf	(21)	;volatile
	goto	l633
	line	331
	
l2961:	
	line	332
;main.c: 331: return 1;
;	Return value of _send is never used
	
l633:	
	return
	opt stack 0
GLOBAL	__end_of_send
	__end_of_send:
;; =============== function _send ends ============

	signat	_send,4216
	global	_isr
psect	text347,local,class=CODE,delta=2
global __ptext347
__ptext347:

;; *************** function _isr *****************
;; Defined at:
;;		line 139 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  count           4    0[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          7       0       0       0
;;      Totals:         7       4       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_printf
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text347
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	139
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 2
; Regs used in _isr: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_isr+3)
	movf	fsr0,w
	movwf	(??_isr+4)
	movf	pclath,w
	movwf	(??_isr+5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+6)
	ljmp	_isr
psect	text347
	line	141
	
i1l2853:	
;main.c: 140: long unsigned int count;
;main.c: 141: INTCONbits.GIE=0;
	bcf	(11),7	;volatile
	line	142
;main.c: 142: INTCONbits.PEIE=0;
	bcf	(11),6	;volatile
	line	143
;main.c: 143: if(INTCONbits.T0IF&&INTCONbits.T0IE)
	btfss	(11),2	;volatile
	goto	u274_21
	goto	u274_20
u274_21:
	goto	i1l576
u274_20:
	
i1l2855:	
	btfss	(11),5	;volatile
	goto	u275_21
	goto	u275_20
u275_21:
	goto	i1l576
u275_20:
	line	145
	
i1l2857:	
;main.c: 144: {
;main.c: 145: INTCONbits.T0IF=0;
	bcf	(11),2	;volatile
	line	146
	
i1l2859:	
;main.c: 146: TMR0=0x00;
	clrf	(1)	;volatile
	line	147
	
i1l2861:	
;main.c: 147: if(heat_ref<heat)
	movf	(_heat),w
	subwf	(_heat_ref),w
	skipnc
	goto	u276_21
	goto	u276_20
u276_21:
	goto	i1l577
u276_20:
	line	148
	
i1l2863:	
;main.c: 148: RC3=0;
	bcf	(59/8),(59)&7
	goto	i1l2865
	line	149
	
i1l577:	
	line	150
;main.c: 149: else
;main.c: 150: RC3=1;
	bsf	(59/8),(59)&7
	goto	i1l2865
	
i1l578:	
	line	151
	
i1l2865:	
;main.c: 151: heat_ref++;
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_heat_ref),f
	line	152
	
i1l2867:	
;main.c: 152: if(heat_ref>25)
	movlw	(01Ah)
	subwf	(_heat_ref),w
	skipc
	goto	u277_21
	goto	u277_20
u277_21:
	goto	i1l2939
u277_20:
	line	153
	
i1l2869:	
;main.c: 153: heat_ref=0;
	clrf	(_heat_ref)
	goto	i1l2939
	
i1l579:	
	line	154
;main.c: 154: }
	goto	i1l2939
	line	155
	
i1l576:	
;main.c: 155: else if(INTCONbits.INTF)
	btfss	(11),1	;volatile
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l2939
u278_20:
	line	157
	
i1l2871:	
;main.c: 156: {
;main.c: 157: INTCONbits.INTF=0;
	bcf	(11),1	;volatile
	line	158
;main.c: 158: RC3=1;
	bsf	(59/8),(59)&7
	line	159
	
i1l2873:	
;main.c: 159: _delay(2000000/5);
	opt asmopt_off
movlw  3
movwf	((??_isr+0)+0+2),f
movlw	8
movwf	((??_isr+0)+0+1),f
	movlw	120
movwf	((??_isr+0)+0),f
u340_27:
	decfsz	((??_isr+0)+0),f
	goto	u340_27
	decfsz	((??_isr+0)+0+1),f
	goto	u340_27
	decfsz	((??_isr+0)+0+2),f
	goto	u340_27
opt asmopt_on

	line	160
;main.c: 160: for(count=0;RA2==0||count>=40000;count++)
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(isr@count+3)
	movlw	0
	movwf	(isr@count+2)
	movlw	0
	movwf	(isr@count+1)
	movlw	0
	movwf	(isr@count)

	goto	i1l2931
	line	161
	
i1l583:	
	line	162
	
i1l2875:	
;main.c: 161: {
;main.c: 162: if(count>=40000){
	movlw	0
	subwf	(isr@count+3),w
	skipz
	goto	u279_25
	movlw	0
	subwf	(isr@count+2),w
	skipz
	goto	u279_25
	movlw	09Ch
	subwf	(isr@count+1),w
	skipz
	goto	u279_25
	movlw	040h
	subwf	(isr@count),w
u279_25:
	skipc
	goto	u279_21
	goto	u279_20
u279_21:
	goto	i1l2887
u279_20:
	line	163
	
i1l2877:	
;main.c: 163: sw=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_sw)^080h
	line	164
;main.c: 164: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	165
;main.c: 165: if(RA2==1)
	btfss	(42/8),(42)&7
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l2887
u280_20:
	line	167
	
i1l2879:	
;main.c: 166: {
;main.c: 167: _delay(2000000/5);
	opt asmopt_off
movlw  3
movwf	((??_isr+0)+0+2),f
movlw	8
movwf	((??_isr+0)+0+1),f
	movlw	120
movwf	((??_isr+0)+0),f
u341_27:
	decfsz	((??_isr+0)+0),f
	goto	u341_27
	decfsz	((??_isr+0)+0+1),f
	goto	u341_27
	decfsz	((??_isr+0)+0+2),f
	goto	u341_27
opt asmopt_on

	line	168
	
i1l2881:	
;main.c: 168: INTCONbits.INTF=0;
	bcf	(11),1	;volatile
	line	169
	
i1l2883:	
;main.c: 169: INTCONbits.GIE=1;
	bsf	(11),7	;volatile
	goto	i1l586
	line	170
	
i1l2885:	
;main.c: 170: return;
	goto	i1l586
	line	171
	
i1l585:	
	goto	i1l2887
	line	172
	
i1l584:	
	line	173
	
i1l2887:	
;main.c: 171: }
;main.c: 172: }
;main.c: 173: if(400000==count){
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(isr@count+3),w
	skipz
	goto	u281_25
	movlw	06h
	xorwf	(isr@count+2),w
	skipz
	goto	u281_25
	movlw	01Ah
	xorwf	(isr@count+1),w
	skipz
	goto	u281_25
	movlw	080h
	xorwf	(isr@count),w
u281_25:
	skipz
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l2929
u281_20:
	line	174
	
i1l2889:	
;main.c: 174: RC0=1;
	bsf	(56/8),(56)&7
	line	175
;main.c: 175: RA0=0;
	bcf	(40/8),(40)&7
	line	176
	
i1l2891:	
;main.c: 176: INTCON=0x00;
	clrf	(11)	;volatile
	line	177
;main.c: 177: TMR0=0x00;
	clrf	(1)	;volatile
	line	178
	
i1l2893:	
;main.c: 178: RCSTAbits.CREN=1;
	bsf	(23),4	;volatile
	line	179
	
i1l2895:	
;main.c: 179: TXSTAbits.TXEN=1;
	bsf	(22),5	;volatile
	line	180
	
i1l2897:	
;main.c: 180: RCSTAbits.SPEN=1;
	bsf	(23),7	;volatile
	line	181
	
i1l2899:	
;main.c: 181: _delay(2000000);
	opt asmopt_off
movlw  11
movwf	((??_isr+0)+0+2),f
movlw	38
movwf	((??_isr+0)+0+1),f
	movlw	102
movwf	((??_isr+0)+0),f
u342_27:
	decfsz	((??_isr+0)+0),f
	goto	u342_27
	decfsz	((??_isr+0)+0+1),f
	goto	u342_27
	decfsz	((??_isr+0)+0+2),f
	goto	u342_27
	nop2
opt asmopt_on

	line	182
	
i1l2901:	
;main.c: 182: printf("Software revision: 0.23\n");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_printf
	line	183
	
i1l2903:	
;main.c: 183: printf("Resetting device! Please wait...\n");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_printf
	line	184
	
i1l2905:	
;main.c: 184: printf("AT+RESET");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_printf
	line	185
	
i1l2907:	
;main.c: 185: _delay(2000000);
	opt asmopt_off
movlw  11
movwf	((??_isr+0)+0+2),f
movlw	38
movwf	((??_isr+0)+0+1),f
	movlw	102
movwf	((??_isr+0)+0),f
u343_27:
	decfsz	((??_isr+0)+0),f
	goto	u343_27
	decfsz	((??_isr+0)+0+1),f
	goto	u343_27
	decfsz	((??_isr+0)+0+2),f
	goto	u343_27
	nop2
opt asmopt_on

	line	186
	
i1l2909:	
;main.c: 186: printf("AT+NAMEsocialanalyzer");
	movlw	((STR_4-__stringbase))&0ffh
	fcall	_printf
	line	187
	
i1l2911:	
;main.c: 187: _delay(2000000);
	opt asmopt_off
movlw  11
movwf	((??_isr+0)+0+2),f
movlw	38
movwf	((??_isr+0)+0+1),f
	movlw	102
movwf	((??_isr+0)+0),f
u344_27:
	decfsz	((??_isr+0)+0),f
	goto	u344_27
	decfsz	((??_isr+0)+0+1),f
	goto	u344_27
	decfsz	((??_isr+0)+0+2),f
	goto	u344_27
	nop2
opt asmopt_on

	line	188
	
i1l2913:	
;main.c: 188: sw=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_sw)^080h
	line	189
	
i1l2915:	
;main.c: 189: on=0;
	bcf	(_on/8),(_on)&7
	line	190
	
i1l2917:	
;main.c: 190: heat=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_heat)
	line	191
	
i1l2919:	
;main.c: 191: TRISA=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	192
	
i1l2921:	
;main.c: 192: TRISC=0x00;
	clrf	(135)^080h	;volatile
	line	193
	
i1l2923:	
;main.c: 193: PORTA=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	194
	
i1l2925:	
;main.c: 194: PORTC=0x00;
	clrf	(7)	;volatile
	line	196
	
i1l2927:	
# 196 "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
    GOTO 0x0000 ;#
psect	text347
	goto	i1l2929
	line	198
	
i1l587:	
	line	160
	
i1l2929:	
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(isr@count),f
	movlw	0
	skipnc
movlw 1
	addwf	(isr@count+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(isr@count+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(isr@count+3),f
	goto	i1l2931
	
i1l582:	
	
i1l2931:	
	btfss	(42/8),(42)&7
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l2875
u282_20:
	
i1l2933:	
	movlw	0
	subwf	(isr@count+3),w
	skipz
	goto	u283_25
	movlw	0
	subwf	(isr@count+2),w
	skipz
	goto	u283_25
	movlw	09Ch
	subwf	(isr@count+1),w
	skipz
	goto	u283_25
	movlw	040h
	subwf	(isr@count),w
u283_25:
	skipnc
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l2875
u283_20:
	
i1l588:	
	line	200
;main.c: 198: }
;main.c: 199: }
;main.c: 200: if(on==0)
	btfsc	(_on/8),(_on)&7
	goto	u284_21
	goto	u284_20
u284_21:
	goto	i1l2937
u284_20:
	line	201
	
i1l2935:	
;main.c: 201: sw=2;
	movlw	(02h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_sw)^080h
	goto	i1l2939
	line	202
	
i1l589:	
	line	203
	
i1l2937:	
;main.c: 202: else
;main.c: 203: sw=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_sw)^080h
	bsf	status,0
	rlf	(_sw)^080h,f
	goto	i1l2939
	
i1l590:	
	goto	i1l2939
	line	204
	
i1l581:	
	goto	i1l2939
	line	205
	
i1l580:	
	
i1l2939:	
;main.c: 204: }
;main.c: 205: INTCONbits.GIE=1;
	bsf	(11),7	;volatile
	line	206
	
i1l2941:	
;main.c: 206: INTCONbits.PEIE=1;
	bsf	(11),6	;volatile
	line	207
	
i1l586:	
	movf	(??_isr+6),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_isr+5),w
	movwf	pclath
	movf	(??_isr+4),w
	movwf	fsr0
	swapf	(??_isr+3)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	_printf
psect	text348,local,class=CODE,delta=2
global __ptext348
__ptext348:

;; *************** function _printf *****************
;; Defined at:
;;		line 461 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               1    wreg     PTR const unsigned char 
;;		 -> STR_4(22), STR_3(9), STR_2(34), STR_1(25), 
;; Auto vars:     Size  Location     Type
;;  f               1    3[COMMON] PTR const unsigned char 
;;		 -> STR_4(22), STR_3(9), STR_2(34), STR_1(25), 
;;  _val            4    0        struct .
;;  c               1    4[COMMON] char 
;;  ap              1    2[COMMON] PTR void [1]
;;		 -> ?_printf(2), 
;;  flag            1    0        unsigned char 
;;  prec            1    0        char 
;; Return value:  Size  Location     Type
;;                  2  544[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_putch
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text348
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\doprnt.c"
	line	461
	global	__size_of_printf
	__size_of_printf	equ	__end_of_printf-_printf
	
_printf:	
	opt	stack 2
; Regs used in _printf: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;printf@f stored from wreg
	line	537
	movwf	(printf@f)
	
i1l2943:	
	movlw	(?_printf)&0ffh
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@ap)
	line	540
	goto	i1l2947
	
i1l660:	
	line	545
	
i1l2945:	
	movf	(printf@c),w
	fcall	_putch
	line	546
	goto	i1l2947
	line	1525
	
i1l659:	
	line	540
	
i1l2947:	
	movlw	01h
	addwf	(printf@f),f
	movlw	-01h
	addwf	(printf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@c)
	movf	((printf@c)),f
	skipz
	goto	u285_21
	goto	u285_20
u285_21:
	goto	i1l2945
u285_20:
	goto	i1l662
	
i1l661:	
	line	1533
;	Return value of _printf is never used
	
i1l662:	
	return
	opt stack 0
GLOBAL	__end_of_printf
	__end_of_printf:
;; =============== function _printf ends ============

	signat	_printf,602
	global	_putch
psect	text349,local,class=CODE,delta=2
global __ptext349
__ptext349:

;; *************** function _putch *****************
;; Defined at:
;;		line 335 in file "E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text349
	file	"E:\Dropbox\socialAnalizer\Firmware\V0.23s\main.c"
	line	335
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 2
; Regs used in _putch: [wreg]
;putch@byte stored from wreg
	movwf	(putch@byte)
	line	336
	
i1l2963:	
;main.c: 336: while(!TXIF)
	goto	i1l637
	
i1l638:	
	line	337
;main.c: 337: continue;
	
i1l637:	
	line	336
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(97/8),(97)&7
	goto	u288_21
	goto	u288_20
u288_21:
	goto	i1l637
u288_20:
	goto	i1l2965
	
i1l639:	
	line	338
	
i1l2965:	
;main.c: 338: TXREG = byte;
	movf	(putch@byte),w
	movwf	(21)	;volatile
	line	339
	
i1l640:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
psect	text350,local,class=CODE,delta=2
global __ptext350
__ptext350:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
