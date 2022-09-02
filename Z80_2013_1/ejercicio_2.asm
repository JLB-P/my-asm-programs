;Programa que realiza un conteo de 500 -> 0
;Autor: jlb

	;inicia valores en registros
	ld b,250 ; carga valor de conteo
	ld c,2
ciclo:
	djnz ciclo
	ld b,250
	dec c
	jp nz, ciclo
fin:
	halt
end
