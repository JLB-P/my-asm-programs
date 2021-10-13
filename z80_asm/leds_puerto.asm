;--------------------------------------------
;Programa de ejemplo:
;Programa que muestra una secuencia de encendido
;de los LEDS's en el puerto A (00h)
;--------------------------------------------
;Programa principal
	.org 0000h
	ld sp,stack	;define inicio de stack
	;------------------
	ld a,82h 	;PuertoA -> salida, PuertoB <- entrada
	out (03h),a	;PuertoC (PC0 y PC1) -> salida
	;------------Para el simulador, no es necesario
ciclo:
	ld a,00000001b
	ld b,7		;contador
ciclo1:
	out (00),a
	sla a
	djnz ciclo1
	ld b,8		;contador
ciclo2:
	out (00),a
	srl a
	djnz ciclo2
	jp ciclo
	halt ;detiene la simulación

;subrutinas

;define del inicio para las variables
	.org 0f7ffh
text db "Todos estan aprobados"

;define apuntador a la pila (SP)
stack	equ 0ffffh

end ;termina el programa