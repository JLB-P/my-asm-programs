;--------------------------------------------
;Programa que muestra textos en una
;pantalla puerto A (00h)
;--------------------------------------------
;Programa principal
	.org 0000h
	ld sp,stack	;define inicio de stack
	;------------------
	ld a,82h 	;PuertoA -> salida, PuertoB <- entrada
	out (CW),a	;PuertoC (PC0 y PC1) -> salida
	;------------Para el simulador, no es necesario

	in a,(KEYB)
	out (LCD),a
	halt

;subrutinas

;define del inicio para las variables
	.org 0f7ffh
text db "Recibe INT en Modo 1$"

;define apuntador a la pila (SP)
stack	equ 0ffffh
CW	equ 03h	;dirección del registro CW de
LCD	equ 00h	;dirección de la pantalla LCD
KEYB	equ 01h	;dirección del teclado


fin:
	end ;termina el programa
'oshonsoft_bookmarks_and_breakpoints_info:,31
