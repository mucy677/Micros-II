list p=16F84A

#include <p16F84A.inc>

__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; ****************** PROGRAM ************************* 

ORG 0000

RESET
CLRW
MOVWF 0C
NOP
NOP
NOP

COUNT
INCF 0C,1

MOVF 0C,0
SUBLW 0A
BTFSS 03,2
GOTO COUNT
GOTO RESET

END