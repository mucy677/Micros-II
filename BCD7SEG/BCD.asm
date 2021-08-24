list p=16F84A

#include <p16F84A.inc>

__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; ****************** SETUP ************************* 

ORG 0000

;Setup BCD input on Port A
MOVLW 0x0F  
TRIS PORTA

;Setup 7 segment display drive on Port B
CLRW
TRIS PORTB

; ****************** MAIN ************************* 

SCAN

;Check if '0'
MOVF PORTA,0 ;read BCD input, z sensitive 
BTFSC STATUS,2
GOTO DISP0

;Check if '1'
MOVF PORTA,0 ;read BCD input
SUBLW 0x1
BTFSC STATUS,2
GOTO DISP1

;Check if '2'
MOVF PORTA,0 ;read BCD input
SUBLW 0x2
BTFSC STATUS,2
GOTO DISP2

;Check if '3'
MOVF PORTA,0 ;read BCD input
SUBLW 0x3
BTFSC STATUS,2
GOTO DISP3

;Check if '4'
MOVF PORTA,0 ;read BCD input
SUBLW 0x4
BTFSC STATUS,2
GOTO DISP4

;Check if '5'
MOVF PORTA,0 ;read BCD input
SUBLW 0x5
BTFSC STATUS,2
GOTO DISP5

;Check if '6'
MOVF PORTA,0 ;read BCD input
SUBLW 0x6
BTFSC STATUS,2
GOTO DISP6

;Check if '7'
MOVF PORTA,0 ;read BCD input
SUBLW 0x7
BTFSC STATUS,2
GOTO DISP7

;Check if '8'
MOVF PORTA,0 ;read BCD input
SUBLW 0x8
BTFSC STATUS,2
GOTO DISP8

;Check if '9'
MOVF PORTA,0 ;read BCD input
SUBLW 0x9
BTFSC STATUS,2
GOTO DISP9

;Check if decimal point turned on
MOVF PORTA,0 ;read BCD input
SUBLW 0xB
BTFSC STATUS,2
BSF PORTB,7

;Check if decimal point turned off
MOVF PORTA,0 ;read BCD input
SUBLW 0xD
BTFSC STATUS,2
BCF PORTB,7

GOTO SCAN ; Ignore all other unhandled cases, inc invalid BSD sequence, rescan input 

; ****************** DISP '0' ************************* 

DISP0
		   ;    7654 3210
MOVLW 0x77 ; -> 0111 0111
MOVWF PORTB

GOTO SCAN

; ****************** DISP '1' ************************* 

DISP1
		   ;    7654 3210
MOVLW 0x24 ; -> 0010 0100
MOVWF PORTB

GOTO SCAN

; ****************** DISP '2' ************************* 

DISP2
		   ;    7654 3210
MOVLW 0x5D ; -> 0101 1101
MOVWF PORTB

GOTO SCAN

; ****************** DISP '3' ************************* 

DISP3
		   ;    7654 3210
MOVLW 0x6D ; -> 0110 1101
MOVWF PORTB

GOTO SCAN

; ****************** DISP '4' ************************* 

DISP4
		   ;    7654 3210
MOVLW 0x2E ; -> 0010 1110
MOVWF PORTB

GOTO SCAN

; ****************** DISP '5' ************************* 

DISP5
		   ;    7654 3210
MOVLW 0x6B ; -> 0110 1011
MOVWF PORTB

GOTO SCAN

; ****************** DISP '6' ************************* 

DISP6
		   ;    7654 3210
MOVLW 0x7B ; -> 0111 1011
MOVWF PORTB

GOTO SCAN

; ****************** DISP '7' ************************* 

DISP7
		   ;    7654 3210
MOVLW 0x25 ; -> 0010 0101
MOVWF PORTB

GOTO SCAN

; ****************** DISP '8' ************************* 

DISP8
		   ;    7654 3210
MOVLW 0x7F ; -> 0111 1111
MOVWF PORTB

GOTO SCAN

; ****************** DISP '9' ************************* 

DISP9
		   ;    7654 3210
MOVLW 0x6F ; -> 0110 1111
MOVWF PORTB

GOTO SCAN


END