	AREA	Countdown, CODE, READONLY

	IMPORT	main

	EXPORT	start



start
	LDR	R1, =cdWord		; R1 = memory address at cdWord
	LDR	R2, =cdLetters	; R2 = letters = memory address at cdLetters
while					;while( Loop == false)
	LDRB R3, [R1]		; tempWordChar = load.word
	LDRB R4, [R2]		; tempLetterChar = load.letters
	CMP R3, R4			
	BEQ found		;	quitLoop = true, letterFound = true
						; else
	ADD R2, R2, #1	
	LDRB R4, [R2]		
	CMP R4, #0			
	BEQ notfound	;	 quitLoop = true, letterFound = false
	B while				;}
found				; if(letterFound = true)
	LDR R4, =1			; 	 tempLetterChar = 1	 
	STRB R4, [R2]		;	 tempLetterChar = store.letters
	LDR R2, =cdLetters	;	 letters = memory.adr[cdLetters
	ADD R1, R1, #1		;	 word += 1	
	LDRB R3, [R1]		;	 tempWordChar = load.word
	CMP R3, #0			;	 if(tempWordChar == 0)
	BEQ wordComplete	;	 	wordComplete = true
	B while				;
notfound			; else if (NotFound = true)
	LDR R0, = 0			;	wordPossible = 0
	B stop				;	
wordComplete			; if(wordComplete == true)
	LDR R0, = 1			; 	wordPossible = 1
stop	B	stop

	AREA	TestData, DATA, READWRITE

	

cdWord
	DCB	"beets",0
cdLetters
	DCB	"daetebzsb",0
	END	

