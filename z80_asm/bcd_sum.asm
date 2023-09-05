	.ORG 0000H
	LD B,99H	;digit 1 on B register
	LD C,99H	;digit 2 on C
	LD A,B
	ADD A,C
	DAA
	LD D,A
	LD A,0
	RLA 		;backup carry
	LD H,A
	LD A,D
	AND 00001111b
	LD E,A		;load digit 1 of the result
	SRL D		;shift 4 digits to right
	SRL D
	SRL D
	SRL D
	LD A,D
	AND 00001111b
	LD D,A		;load digit 2 of the result
	LD A,H		;load carry status
	halt
	.END