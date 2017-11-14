	AREA	ConsoleInput, CODE, READONLY
	IMPORT	main
	IMPORT	getkey
	IMPORT	sendchar
	EXPORT	start
	PRESERVE8

start
    LDR R4, =0
    LDR R5, =0
    LDR R6, =10
	LDR R7, =0
	LDR R8, =0
	LDR R9, =0
	LDR R10, =0
	LDR R11, =0
	LDR R12, =1

read
	BL  getkey      ; read key from console
    CMP R0, #0x2B   ; 
	BEQ  adding
	
	CMP R0, #0x2D   ; 
	BEQ  subtraction
	
	CMP R0, #0x2A   ; 
	BEQ  multiplication
	
	CMP R0, #0x2F   ; 
	BEQ  division
	
    BL  sendchar    ;   echo key back to console

	SUB R7,R0,#0x30 ; number = number entered - 0x30
	MUL R4,R6,R4 ; total = 10 x total
    ADD R4,R4,R7 ; total = total + number

	;
	B	read		; }
endRead

adding
	BL sendchar
adding1
    BL getkey
    CMP R0, #0x0D
    BEQ endadding
    BL sendchar
	
	SUB R8,R0,#0x30 ; number = number entered - 0x30
	MUL R5,R6,R5 ; total = 10 x total
    ADD R5,R5,R8 ; total = total + number

	B	adding1
endadding
	ADD R10, R5, R4
	B	equalsign
	
subtraction
	BL sendchar
subtraction1
    BL getkey
    CMP R0, #0x0D
    BEQ endsubtraction
    BL sendchar
	
	SUB R8,R0,#0x30 ; number = number entered - 0x30
	MUL R5,R6,R5 ; total = 10 x total
    ADD R5,R5,R8 ; total = total + number

	B	subtraction1
endsubtraction
	SUB R10, R4, R5
	B	equalsign
	
multiplication
	BL sendchar
multiplication1
    BL getkey
    CMP R0, #0x0D
    BEQ endmultiplication
    BL sendchar
	
	SUB R8,R0,#0x30 ; number = number entered - 0x30
	MUL R5,R6,R5 ; total = 10 x total
    ADD R5,R5,R8 ; total = total + number

	B	multiplication1
endmultiplication
	MUL R10, R5, R4
	B	equalsign
	
division
	BL sendchar
division1
    BL getkey
    CMP R0, #0x0D
    BEQ enddivision
    BL sendchar
	
	SUB R8,R0,#0x30 ; number = number entered - 0x30
	MUL R5,R6,R5 ; total = 10 x total
    ADD R5,R5,R8 ; total = total + number
while 
	CMP R4,R5
	BLT endwh
	SUB R4,R4,R5
	ADD R10,R10,#1 ; stores it in r10
	B while
endwh
	MOV r9,r4
enddivision
	B	equalsign


equalsign
	LDR R0, =0
	ADD R0, #0x3D
	BL sendchar

output
	LDR R3, = 10
	LDR R4, = 0
	LDR R5, = 10
	LDR R7,= 0
	LDR R8,=1
	LDR r9,=0
power
	CMP R3, R10 ; R10 < 10
	BGT storeR7
	MUL R3, R5 , R3
	ADD R7, R7, #1 
	B power
endpower
	SUB R7, R7, R8
	
storeR7
	MOV R11,R7
by10	
	CMP R7, #0 ; R7 > 0
	BEQ divide
	MUL R8, R5, R8
	SUB R7, R7, #1
	B by10
endby10
checkR10
	CMP R10,#0
	BEQ endprint
divide
	CMP R10, R8 ; R3 > R8
	BLT print
	SUB R10, R10, R8
	ADD R9, R9, #1
	b divide
enddivide

endoutput

print
	ADD r9, r9, #0x30
	MOV R0,R9
	BL sendchar
	CMP R10,#0
	BEQ stop
	
divide2	
	CMP R8, R6
	BLT mover10
	SUBS R8, R8, R6
	ADD R7, R7, #1
	B divide2
enddivide2

mover10
	MOV R8, R7
	LDR R7,=0
	LDR R9,=0
	B divide
endprint

stop	B	stop

	END	