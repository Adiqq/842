$MOD52
x:
MOV R0,#0
e:
MOV P2,R0
CALL DELAY
INC R0
CJNE R0,#10, e

MOV R4,#16
f:
MOV P2,R4
CALL DELAY
INC R4
CJNE R4,#26, f

MOV R5,#32
g:
MOV P2,R5
CALL DELAY
INC R5
CJNE R5,#42, g

MOV R6,#48
h:
MOV P2,R6
CALL DELAY
INC R6
CJNE R6,#58, h
JMP x
DELAY:					; Delays by ms 10* A
					; 10mSec based on 2.094MHZ 
					; Core Clock 
					; i.e. default ADuC842 Clock

		MOV	R1,#50		; Acc holds delay variable (1 clock)
 DLY0:		MOV	R2,#01Bh	; Set up delay loop0 (2 clocks)
 DLY1:		MOV	R3,#0FFh	; Set up delay loop1 (2 clocks)
		DJNZ	R3,$		; Dec R3 & Jump here until R3 is 0 (3 clocks)
		DJNZ	R2,DLY1         ; Dec R2 & Jump DLY1 until R2 is 0 (3 clocks)
		DJNZ	R1,DLY0		; Dec R1 & Jump DLY0 until R1 is 0 (3 clocks)
		RET			; Return from subroutine

END