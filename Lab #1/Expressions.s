	AREA	Expressions, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =5	; x = 5
	LDR	R2, =6	; y = 6
	LDR R3, =3
	LDR R4, =5
	
	; your first program goes here
	MUL R0, R1, R3
	ADD R5, R0, R4
	MUL R0, R5, R1
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	LDR	R1, =5	; x = 5
	LDR	R2, =6	; y = 6
	LDR R3, =2
	LDR R4, =6
	LDR R5, =3
	;reset x and y for the second one
	
	; your second program goes here
	MUL R0, R1, R1
	MUL R6, R3, R0
	MUL R7, R4, R1
	MUL R7, R2, R7
	MUL R8, R2, R2
	MUL R9, R5, R8
	ADD R10, R7, R9
	ADD R0, R10, R6
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	LDR	R1, =5	; x = 5
	LDR	R2, =6	; y = 6
	LDR R3, =4
	LDR R4, =3
	LDR R5, =8
	;reset x and y for the third one
	
	; your third program goes here
	MUL R6, R1, R1
	MUL R6, R1, R6
	MUL R7, R1, R1
	MUL R7, R3, R7
	MUL R8, R1, R4
	SUB R0, R6, R7
	ADD R0, R8, R0
	ADD R0, R5, R0
stop	B	stop

	END	