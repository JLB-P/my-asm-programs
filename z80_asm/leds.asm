	.ORG 0000H
	;PORT PROGRAMMING
	LD A,80H	;PORTA COMO Salida
	OUT (03H),A
	;ESCRIBE A PUERTO A (LEDS)
	LD A,00000001B
	CCF
	LD B,8
CICLO:
	OUT (00H),A
	RLCA
	DJNZ CICLO
	HALT
	.END