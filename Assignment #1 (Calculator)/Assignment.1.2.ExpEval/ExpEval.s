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
	ADD R7, R5, R4
	B	stop
	
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
	SUB R7, R4, R5
	B	stop
	
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
	MUL R7, R5, R4
	B	stop
	
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
	B	stop
	
	 

stop	B	stop

	END	