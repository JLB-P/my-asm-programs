;--------------------------------------------
;Programa que realiza un conteo de 0-65,000
;y deposita el resultado en RAM
;--------------------------------------------
;Programa principal
	.org 0000h
	ld sp,stack	;define inicio de stack
	;------------------
	ld a,82h 	;PuertoA -> salida, PuertoB <- entrada
	out (CW),a	;PuertoC (PC0 y PC1) -> salida
	;------------Para el simulador, no es necesario
	ld ix,tabla_conteo ;apunta ix al inicio de la tabla
	ld hl,0		;inicia el conteo en 0
	ld de,1000		;carga el valor del incremento
	ld b,66 		;inica repeticiones
ciclo:
	ld (ix+0),l
	ld (ix+1),h
	add hl,de
	inc ix
	inc ix
	djnz ciclo
	halt

;subrutinas

;define del inicio para las variables
	.org 0f7ffh
tabla_conteo db 00

;define apuntador a la pila (SP)
stack	equ 0ffffh
CW	equ 03h	;dirección del registro CW de

fin:
	end ;termina el programa
'oshonsoft_bookmarks_and_breakpoints_info:,31
