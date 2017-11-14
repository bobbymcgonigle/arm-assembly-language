	AREA	Unique, CODE, READONLY
	IMPORT	main
	EXPORT	start

start

	LDR	R1, =VALUES
	LDR R2, =COUNT
	LDR R2, [R2]
	LDR R3, =0

while						
	LDR R4, [R1]			; load the first value from R1 into R4
	SUB R2, R2, #1			; decrement the count
	CMP R2, #0				; if the count is 0
	BEQ unique				; branch to 'unigue'
innerWh
	ADD R3, R3, #1			; add 1 to R3 to move to next value to compare to
	LDR R5, [R3]			; load the value in memory in R3 to R5
	CMP R5, #0x00			; continue until R5 is null
	BEQ outsideWh			; if it is null, branch to 'outsideWh'
	CMP R4, R5				; if R5 is equal to R4
	BEQ unique				; branch to 'unique'
	B innerWh				; 
outsideWh
	ADD R1, R1, #1			; increment R1 to move to next value
	MOV R6, R2, LSL #2		; multiply count by 4
	SUB R3, R3, R6			; and subtract that from R3 to find next point to start comparing from
	B while					; 
unique
	MOV R0, #1				; if the list of numbers is unique, 1 is stored in R0
	B end					; 
notUnique
	MOV R0, #0				; if the list of numbers is not unique, 0 is stored in R0
end

stop	B	stop


	AREA	TestData, DATA, READWRITE
	
COUNT	DCD	10
VALUES	DCD	5, 2, 7, 4, 13, 4, 18, 8, 9, 12


	END