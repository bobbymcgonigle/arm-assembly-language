	AREA	StringReverse, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =0x70000000
	SUBS R2, R1, R1

stop	B	stop


	AREA	TestData, DATA, READWRITE


strSrc	DCB	"hello",0
strDst	SPACE	128

	END	