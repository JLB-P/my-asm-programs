; programa que despliega un texto en pantalla
; author: jlb
;
; programa principal
	org 0000h
	ld a, 10001010b
	out (cw),a ; programa el puerto A como salida

end
;subrutinas

;contantes
stack 	equ 37FFh	; direcci�n del final de la RAM
lcd 	equ 00h	; direcci�n el puerto A
cw	equ 03h ; direcci�n de la palabra de control del 8255

;declaraci�n de variables
	org 3000h
text	db "Estefan�a est� reprobada..."


