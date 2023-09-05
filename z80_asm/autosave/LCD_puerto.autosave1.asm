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
	ld hl,text
ciclo:
	ld a,(hl)
	cp '$'
	jp z,fin
	out (LCD),a
	inc hl
	jr ciclo

;subrutinas

;define del inicio para las variables
	.org 0f7ffh
text db "A programar se aprende...programando$"

;define apuntador a la pila (SP)
stack	equ 0ffffh
CW	equ 03h	;dirección del registro CW de
LCD	equ 00h	;dirección de la pantalla LCD

fin:
	halt
	end ;termina el programa