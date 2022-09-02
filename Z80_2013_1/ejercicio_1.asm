;Programa que realiza un conteo incremental de 0 -> 500
;Autor: jlb

	;inicia valores en registros
	ld bc,0 ; carga valor de conteo
ciclo:
	inc bc
	ld hl,500
	sbc hl,bc
	jp z,fin
	jp ciclo

fin:
	halt
end
