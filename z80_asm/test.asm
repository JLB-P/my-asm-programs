;Inicia programa principal
	ld a,0ffh
	ld b,0ah
	ld h,0ffh
	ld l,a
	ld de,1234h
	add hl,de
;termina progrma principal
	end