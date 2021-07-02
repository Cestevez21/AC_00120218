; Carlos Francisco Estévez Lemus 00120218
; Gracias por los laboratorios y su ayuda con este lenguaje
; éxitos en sus estudios!!

    org 	100h

	section	.text

        call    Modotexto
	; imprime la cadena "Contraseña: "
	mov 	DX, msgPass
	call  	EscribirCadena

	; lee la contraseña
	mov 	BP, pass
	call  	LeerCadena

	; verifica la contraseña
        ;Limpio el contador DI
        xor     DI, DI
	jmp 	Verificar

	section	.data
currentPass    db  "qwert"
msgPass db	"Contrasenia: ", "$"
correcto db "BIENVENIDO", "$"
incorrecto   db "INCORRECTO", "$"
pass 	times 	20  	db	" " 	

; FUNCIONES
Modotexto:
        mov     AH, 00h         
        mov     AL, 03h
        int     10h 
        ret
        
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              
        jmp     while           
exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret

EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret

;Compara caracter por caracter, lo que lo hace mas rapido
;ya que si los primeros caracteres no son iguales el loop
;se termina con el salto a False
Verificar:
        mov AX, [currentPass+DI]
        mov BX, [pass+DI]
        cmp AX,BX
        JNE False
        inc SI 
        loop Verificar
        call True
True:
        xor BX,BX
        xor AX,AX
        xor DX,DX
        mov DX, correcto
        call EscribirCadena
        int 	20h

False:
        xor BX,BX
        xor AX,AX
        xor DX,DX
        mov DX, incorrecto
        call EscribirCadena
        int 	20h

    