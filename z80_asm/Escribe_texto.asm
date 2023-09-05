; programa que despliega un texto en pantalla
; author: jlb
;
; programa principal
	org 0000h
	ld a, 10001010b
	out (cw),a ; programa el puerto A como salida
	ld hl,texto
ciclo:
	ld a,(hl)
	out (lcd),a
	inc hl
	cp '$'
	jp z,fin
	jp ciclo

fin:
	halt
end
;subrutinas

;contantes
stack 	equ 37FFh	; direcci�n del final de la RAM
lcd 	equ 00h	; direcci�n el puerto A
cw	equ 03h ; direcci�n de la palabra de control del 8255

;declaraci�n de variables
	org 3000h
texto	db "Estefan�a est� reprobada...$"


