        AREA    Sets, CODE, READONLY
        IMPORT  main
        EXPORT  start
 
start
        LDR R1 , =AElems
        LDR R2 , =BElems
        LDR R3 , =CElems
		LDR R4 , =ASize 
		LDRB R4, [R4]
		LDR R5, =BSize
		LDRB R5, [R5]
		LDRB R7, [R1]
		LDR R10, = 0
		LDR R11, = 0
WhileA
	LDRB R8, [R2]                                                         
	CMP R8, R7
	BEQ numbersEqual
	ADD R2, R2, #4
	ADD R10, R10, #4
	SUB R5, R5, #1
	CMP R5, #0
	BEQ addSetC
	b WhileA
endWhileA
numbersEqual
	SUB R2, R2, R10
	LDR R10, =0
	LDR R5, =BSize
	LDRB R5, [R5]
	ADD R1, R1 , #4
	LDRB R7, [R1]
	SUB R4, R4, #1
	CMP R4, #0
	BEQ stop
	b WhileA
endNumbersEqual
addSetC
	STRB R7, [R3]
	ADD R3, R3, #4
	SUB R2, R2, R10
	LDR R10, =0
	LDR R5, =BSize
	LDRB R5, [R5]
	ADD R1, R1 ,#4
	LDRB R7, [R1]
	SUB R4, R4, #1
	CMP R4, #0
	BEQ stop
	LDR R11, =ASize
	LDRB R11, [R11]
	b WhileA
endSetC
WhileB
	LDRB R9, [R1]
	LDRB R7, [R2]  	
	CMP R9, R7
	BEQ numbersEqual2
	ADD R1, R1, #4
	ADD R10, R10, #4
	SUB R4, R4, #1
	CMP R5, #0
	BEQ addSetC
	b WhileB
endWhileB
numbersEqual2
	SUB R2, R2, R10
	LDR R10, =0
	LDR R5, =ASize
	LDRB R5, [R5]
	ADD R1, R1 , #4
	LDRB R7, [R2]
	SUB R4, R4, #1
	CMP R4, #0
	BEQ stop
	b WhileB
endNumbersEqual2
addSetC2
	STRB R7, [R3]
	ADD R3, R3, #4
	SUB R1, R1, R10
	LDR R10, =0
	LDR R5, =BSize
	LDRB R5, [R5]
	ADD R2, R2 ,#4
	LDRB R7, [R1]
	SUB R4, R4, #1
	CMP R4, #0
	BEQ stop
	LDR R11, =BSize
	LDRB R11, [R11]
	b WhileB
stop    B       stop
        AREA    TestData, DATA, READWRITE
ASize	DCD	8			; Number of elements in A
AElems	DCD	4,6,2,13,19,7,1,3	; Elements of A

BSize	DCD	6			; Number of elements in B
BElems	DCD	13,9,1,9,5,8		; Elements of B

CSize	DCD	0			; Number of elements in C
CElems	SPACE	56			; Elements of C
        END