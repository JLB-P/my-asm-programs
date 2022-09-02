;
; L_01.asm
/*
	1.I/O registers (Datasheet pag.624)
	2.Stack Pointer (indespensable para uso de subrutinas)
		-Init Stack (stack allways decrements)
		-SRAM memory (pag.22)
	3.Depurar subrutinas
		-Break points (more than one)
		-Subruotine Time measurement
		-Stack
	4.SimulIDE
		-Output Current calculation..
*/
.cseg
.org 0x00	;Origen del código
.def temp = r16
.def counter = r17
.def multiplier = r18

;Programa principal
	;Inicia Stack
	ldi temp,high(RAMEND) ;Obtiene byte alto
	out SPH,Temp
	ldi temp,low(RAMEND) ;Obtiene byte bajo
	out SPL,Temp

	;Configura puertos (pag.85)
	;a)
	;Escribir en un bit particular (usando 1<<PBx)
	ldi temp,0b1111_1010
	out DDRB,Temp
	ldi temp,(1<<PB0)
	out DDRB,Temp

	;b)
	;Escribir en un bit particular (usando sbi)
	ldi temp,0b1111_1010
	out DDRB,Temp
	cbi DDRB,PB3 ;Bit 3 del puertoB como entrada
	sbi DDRB,PB0 ;Bit 0 del puertoB como salida
	;1. ¿Por qué require 2 click's para pasar a la otra instrucción?
	sbi PORTB,PB3 ;Activa Resistencia pullup (pag.84)
	;2. Explique la diferencia entre escribir un bit de la manera hecha en el inciso a) y el b)
	;3. ¿Cómo quedaron configurados los pines del puerto B?
start:
	ldi counter,20  ;Frecuencia 1
	rcall on_off	;Salta a la rutina on/off con valor para frecuencia 1

;ciclo que verifica si un botón conectado en el pin de está cerrado o abierto.
verify_push:
	in temp,PINB
	andi temp,0b00001000
	cpi temp,0x08
	breq start		;Si botón abierto, repite

	;Si botón oprimido, salta a rutina on/off a frecuencia 2
	ldi counter,255 ;Frecuencia 2
	rcall on_off	;salta a rutina on/off con valor para frecuencia 2
    rjmp verify_push
	;4. usando el debug, explique el uso del stack para el salto a subrutinas y regreso de una subrutina,
	;	mostrando las direcciones del PC, SP y las alamcenadas en la pila (en RAM), antes y después de
	;	ejecutar las subrutinas.
	;5. con ayuda del debug, determine el valor de la frecuencia 1
	;6. mediante el debug, determine el valor de la frecuencia 2

;Subrutinas
/****************************************
* Rutina para encender y apagar el bit0.
* Entrada: ninguna
* Salida: ninguna
*****************************************/
on_off:
	sbi PORTB,PB0 ;Enciende bit
	rcall delay ;Espera
	cbi PORTB,PB0 ;Apaga bit
	rcall delay ;Espera
	ret

/****************************************
* Rutina de retardo, dado por counter y
* el valor definido en temp.
* Entrada: counter, temp
* Salida: retardo= counter x temp
*****************************************/
delay:
c2:		ldi temp,167
c1:		dec temp
		brne c1
		dec counter 
		brne c2
		ret