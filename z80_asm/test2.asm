;Programa de ejemplo:
;demuestra el uso del apuntador al stack(SP)
;cuando existen saltos a subrutinas.
;--------------------------------------------
;Programa principal
	.org 0000h
	ld sp,stack
	ld a,23h
	ld b,7h
	call sumale
	halt ;detiene la simulación

;subrutinas
sumale:
	add a,b
	ld h,a
	ret

;define del inicio para las variables
	.org 0f7ffh
var1 db 55h
text db "Todos estan aprobados"

;define apuntador a la pila (SP)
	ld sp,0200h
stack equ 0ffffh

end ;termina el programa