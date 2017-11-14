	AREA	ShiftAndAdd, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =9 ; A
	LDR	R2, =10 ; B
	LDR R4, =0
	LDR R5, =0
	LDR R0,=0
	 ; 
	
loop
	CMP R2, #0
	BEQ endLoop
	MOVS R2, R2, LSR #1
	BCC AddLoop
	MOV R5, R1, LSL R4
	ADD R4, R4, #1
	ADD R0, R0, R5
	B loop
AddLoop
	ADD R4, R4, #1
	B loop
endLoop	
stop	B	stop


	END	
	