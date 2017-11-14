	AREA	Shift64, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R0, =0x13131313;up
	LDR	R1, =0x13131313;lw
	LDR	R2, =2
	
	LDR R3, =0
	LDR R4, =0

	; your program goes here
	CMP R2, #0
	BEQ shiftEnd
	BLT shiftLeftEnd

	; shift right
	RSB R4, R2, #32 ; shift = 32-n
	MOV R3, R1, LSL R4 ; tmp < shift
	MOV R0, R0, LSL R2 ; >n
	
	MOV R1, R1, LSR R2 ;upr = upr > n
	ORR R1, R1, R3 ; lwr = lwr | tmp
	B shiftEnd
shiftLeftEnd
	RSB R2, R2, #0 ; make n =-n
	RSB R4, R2, #32 ; shift  = 32-n
	MOV R3, R0, LSR R4 ; tmp = lwr > shift
	MOV R1, R1, LSL R2 ; upr = upr < n
	
	MOV R0, R0, LSL R2 ; lwr = lwr < n
	ORR R0, R0, R3 ; upr = upr | tmp
shiftEnd
stop	B	stop


	END
		