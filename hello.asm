$MOD52
x:
;P2.0 A, P2.1 B, P2.2 C, P2.3 D

CALL DELAY
CLR P2.1
CLR P2.2
CLR P2.3
SETB P2.0 ;A
CALL DELAY
SETB P2.1 ;AB
CALL DELAY
CLR P2.0 ;B
CALL DELAY
SETB P2.2 ;BC
CALL DELAY
CLR P2.1; C
CALL DELAY
SETB P2.3; CD
CALL DELAY
CLR P2.2; D
CALL DELAY
SETB P2.0; DA

JMP x

DELAY:					; Delays by ms 10* A
					; 10mSec based on 2.094MHZ 
					; Core Clock 
					; i.e. default ADuC842 Clock

		MOV	R1,#1000		; Acc holds delay variable (1 clock)
 DLY0:		MOV	R2,#10	; Set up delay loop0 (2 clocks)
 DLY1:		MOV	R3,#10	; Set up delay loop1 (2 clocks)
		DJNZ	R3,$		; Dec R3 & Jump here until R3 is 0 (3 clocks)
		DJNZ	R2,DLY1         ; Dec R2 & Jump DLY1 until R2 is 0 (3 clocks)
		DJNZ	R1,DLY0		; Dec R1 & Jump DLY0 until R1 is 0 (3 clocks)
		RET			; Return from subroutine

END