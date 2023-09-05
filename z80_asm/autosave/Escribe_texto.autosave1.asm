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
stack 	equ 37FFh	; dirección del final de la RAM
lcd 	equ 00h	; dirección el puerto A
cw	equ 03h ; dirección de la palabra de control del 8255

;declaración de variables
	org 3000h
text	db "Estefanía está reprobada..."


