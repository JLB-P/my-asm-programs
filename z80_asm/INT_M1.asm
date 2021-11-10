;--------------------------------------------
;Programa que muestra textos en una
;pantalla puerto A (00h)
;--------------------------------------------
;Programa principal
	jp 0100h	;salta al programa principal

	;-------------------------------------------------
	;inicio de la rutina de atencíón a la interrupción
	.org 038h
	DI	;deshabilita las interrupciones
	ld a,1
	ld (flag),a
	EI	;antes de salir, habilita las interrupciones
	reti

	;-------------------------------------------------

	.org 0100h
	ld sp,stack	;define inicio de stack
	;------------------
	ld a,82h 	;PuertoA -> salida, PuertoB <- entrada
	out (CW),a	;PuertoC (PC0 y PC1) -> salida
	;------------Para el simulador, no es necesario

	IM 1	;define modo de interrupciones
	EI	;habilita las interrupciones

ciclo_infinito:
	ld hl,flag
	ld a,(hl)
	cp 1
	jr z,desp_txt
	jp ciclo_infinito

;subrutinas
desp_txt:
	ld hl,text
	ld a,0
	ld (flag),a
ciclo:
	ld a,(hl)
	cp '$'
	jp z,ciclo_infinito
	out (LCD),a
	inc hl
	jr ciclo


;define del inicio para las variables
	.org 0f7ffh
text db "INT recibida$"
flag db 00

;define apuntador a la pila (SP)
stack	equ 0ffffh
CW	equ 03h	;dirección del registro CW de
LCD	equ 00h	;dirección de la pantalla LCD

	end ;termina el programa
'oshonsoft_bookmarks_and_breakpoints_info:,31
