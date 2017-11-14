	AREA	Sets, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
SetA	
	CMP R4, #0
	BEQ endSetA
	LDR R6, [R1]
	ADD R1, R1, #4
	SUB R4, R4, #1
	LDR R2, =BElems
	LDR R5, =BSize
	LDR R5, [R5]
	
SetB
	CMP R5, #0
	BEQ endSetB
	LDR R7, [R2]
	ADD R2, R2, #4
	SUB R5, R5, #1
	CMP R6, R7
	BEQ SetA
	b SetB
SetC

endSetB
	STR R6, [R3]
	ADD R3, R3, #4
	b SetA
endSetA

stop	B	stop


	AREA	TestData, DATA, READWRITE
	
ASize	DCD	8			; Number of elements in A
AElems	DCD	4,6,2,13,19,7,1,3	; Elements of A

BSize	DCD	6			; Number of elements in B
BElems	DCD	13,9,1,9,5,8		; Elements of B

CSize	DCD	0			; Number of elements in C
CElems	SPACE	56			; Elements of C

	END	
