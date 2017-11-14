	AREA	Lotto, CODE, READONLY

	IMPORT	main

	EXPORT	start



start

	LDR	R1, =TICKETS	; R1 = Numbers = memory.adr[TICKETS]
	LDR R2, =COUNT		; R2 = tickets = memory.adr[COUNT]
	LDRB R2, [R2]		;
	LDR R3, =DRAW  		; R3 = Numbers = memory.adr[DRAW]
	LDR R6, =0			;	matchCount = 0
	LDR R8, =0			;
	LDR R9, =0			;	NumberCount = 0
	LDR R7, =0			;	ticketCounter = 0
	LDR R0, =0			;	4count
	LDR R11, =0			;	5count
	LDR R12, =0			;	6count
	B while				; resetWhile

resetWhile				; while(resetWhile == true){
	LDR R3, =DRAW		; memory.adr[DRAW]
	LDR R9, =0			; NumberCount = 0
						;}
while					; while(quitLoop == false){
	LDRB R4, [R1] 		; tempTicket = memory.load[ticketNumbers]
	LDRB R5, [R3] 		; tempNumber = memory.load[lottoNumbers]
	ADD R9, R9, #1		; NumberCount++
	ADD R3, R3, #4 		; Numbers++
	CMP R4, R5			; if(tempTicketNumber == tempLottoNumber)
	BEQ match			; 	match = true, quitLoop = true
	CMP R9, #6    		; else if(lottoNumberCounter == 6)	
	BEQ noMatch			;	match =  false
	B while				;}
match					; if(match = true)
	ADD R6, R6, #1		; 	matchCount++
noMatch					; else if(match = false)
	ADD R10, R10, #1	; ticketNumber++
	ADD R1, R1, #4		; ticketNumber ++
	CMP R10, #6			;	if(NumberCounter == 6)
	BEQ ticketComplete	;	 ticketComplete = true, quitLoop = true
	B resetWhile		;} 
ticketComplete			; if(ticketComplete == true)
	ADD R7, R7, #1		; 	ticketCounter++
	LDR R10, =0			;	 NumberCounter = 0
	CMP R6, #4			;	 if(matchCount == 4)
	BNE not4			;		
	LDR R8, =MATCH4		; 		ticketAddress = memory.adr[MATCH4]
	ADD R0, R0, #1		;		4Count ++
	STRB R0, [R8]		;		4count = memory.store[ticketAddress]
	B noPrize			;
not4					;	 else if(matchCount == 5)
	CMP R6, #5			;
	BNE not5			;
	LDR R8, =MATCH5		;		ticketAddress = memory.adr[MATCH5]
	ADD R11, R11, #1	;		5Count ++
	STRB R11, [R8]		;		5count = memory.store[ticketAddress]
	B noPrize			;

not5					;	 else if(matchCount == 6)
	CMP R6, #6			;
	BNE noPrize			; 		ticketAddress = memory.adr[MATCH6]
	LDR R8, =MATCH6		;		6Count ++
	ADD R12, R12, #1	;		6count = memory.store[ticketAddress]
	STRB  R12, [R8]		;
noPrize					;	else
	CMP R7, R2			;		if(ticketCounter == ticketCount)
	BEQ done			;			resetWhile = false
	LDR R6, =0			;		else
	B resetWhile		;			resetWhile = true
						; }
done					; 	
	LDR R10, = MATCH4	; memory.adr[MATCH4]
	LDR R11, = MATCH5	; memory.adr[MATCH5]
	LDR R12, = MATCH6	; memory.adr[MATCH6]

	B stop
stop	B	stop 
	AREA	TestData, DATA, READWRITE
COUNT	DCD	3			; Number of Tickets
TICKETS	DCD	3, 8, 11, 21, 22, 31	; Tickets
	DCD	7, 23, 25, 28, 29, 32
	DCD	10, 11, 12, 22, 26, 30
DRAW	DCD	10, 11, 12, 22, 26, 30	; Lottery Draw
MATCH4	DCD	0
MATCH5	DCD	0
MATCH6	DCD	0



	END	

