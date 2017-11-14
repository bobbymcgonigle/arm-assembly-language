	AREA	Flags, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
1 LDR R0 , =0xC0001000
2 LDR R1 , =0x51004000
3 ADDS R2 , R0 , R1 ; C=1, preditction was correct
4 LDR R3 , =0x92004000
5 SUBS R4 , R3 , R3 ; C=1, Z=1 preditcion was correct
6 LDR R5 , =0x74000100
7 LDR R6 , =0x40004000
8 ADDS R7 , R5 , R6 ; N=1, V=1 preditcion was correct
9 LDR R1 , =0x6E0074F2
10 LDR R2 , =0x211D6000
11 ADDS R0 , R1 , R2 ; N=1, V=1 preditcion was correct
12 LDR R1 , =0xBF2FDD1E
13 LDR R2 , =0x40D022E2
14 ADDS R0 , R1 , R2 ; Z=1, C=1 preditcion was correct


	
stop	B	stop

	END	