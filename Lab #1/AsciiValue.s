	AREA	AsciiValue, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R4, ='2'	; Load '2','0','3','4' into R4...R1
	LDR	R3, ='0'	;
	LDR	R2, ='3'	;
	LDR	R1, ='4'	;
	LDR R8, =1000
	LDR R9, =100
	LDR R10 =10
	
	SUB R5, R1, R3
	SUB R6, R2, R3
	SUB R7, R4, R3
	
	MUL R11, R7, R8
	MUL R12, R6, R10
	
	ADD R0, R11, R12
	ADD R0, R7, R0
	
	; your program goes here
	
stop	B	stop

	END	