;
; L_00.asm
/*
	1.DataSheet
		-AVR CPU Core
			-pipelining
	2.View Help (Ayuda en IDE)
		-Assembler syntax **Register restriction (0-15 & 16-31)
		-Assembler directives
		-Expressionsl
			-functions
			-operands
			-operators
	3.Environment
		-Solution explorer
	4.Build
		-Segments and %usage
	5.Debug
		-CPU
		-Flash memory map
		-I/O
		-Register address (pag.309)
*/
; Created: 
; Author : jlb
;

; Replace with your application code
.cseg	//Directiva para inidicar inicio del Seg.Código
.org 0x10 //Directiva para inicio del PC
.def Mi_Registro = r17
.def contador = r16

		ldi Mi_Registro,0b0101_1010 ;0x5A
		ldi r21,0xff ;
		out DDRB,r21 ;Puerto B como salida
		ldi contador,0x00 ;Registro como contador

start:
		out PORTB,contador ;Escribe en Puerto B 
		inc contador ;Incrementa contador
		rjmp start ;Repite al infinito (y más alla)
