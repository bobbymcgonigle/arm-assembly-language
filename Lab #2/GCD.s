	AREA	GCD, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R1, = 0xFFFFFFFF
	LDR R2, = 0x55555555
	EOR R3, R1, R2 ; R3 = 12
	
	
stop	B	stop

	END	