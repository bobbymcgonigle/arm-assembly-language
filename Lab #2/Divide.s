	AREA	Divide, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
LDR R0 = a
LDR R1 = b 
LDR R4 = 1 

SUB R2, R1, R0 
ADD R3, R2, R4
SUB R5, R1, R3 
ADD R6, R3, R4



	
stop	B	stop

	END	