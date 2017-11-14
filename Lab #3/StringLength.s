	AREA	StringLength, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =str1
	MOV R0, #0
	LDRB  R2, [R1]
whLen
	CMP R2, #0
	BEQ eWhLen
	ADD R1, R1, #1
	ADD R0, R0, #1
	LDRB R2, [R1]
	B whLen
eWhLen

stop	B	stop



	AREA	TestData, DATA, READWRITE

str1	DCB	"Friday",0

	END	
