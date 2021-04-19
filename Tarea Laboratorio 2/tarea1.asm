        org    100h
        section .text

;Asignacion de variables a la memoria
        mov     byte [200h], "C"
        mov     byte [201h], "F"
        mov     byte [202h], "E"
        mov     byte [203h], "L"

;Direccionamiento Directo
        mov     AX, [200h]

;Direccionamiento Directo, para realizar el 
;direccionamiento indirecto por registro
        mov     BX, [201h]
        mov     CX, [BX]

;Direccionamiento indirecto, base mas indice
        mov     BX, [202h]
        mov     DX, [BX+DI]

;Direccionamiento relativo por registro
        mov     DI, [SI+203H]



        int     20h

