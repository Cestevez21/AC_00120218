        org 100h


section .text

        XOR SI, SI ;Limpiamos variables
        XOR AX, AX

        mov     byte [200h],0d ;Asignacion de carnet 00120218
        mov     byte [201h],0d
        mov     byte [202h],1d
        mov     byte [203h],2d
        mov     byte [204h],0d
        mov     byte [205h],2d
        mov     byte [206h],1d
        mov     byte [207h],8d
;iteracion
        jmp iterar

iterar:
        CMP SI, 8d
        JE prom
        ADD AL, [200h + SI]
        ADD SI, 1d
        jmp iterar

prom:
        DIV SI
        MOV [20Ah], AL
        
        int     20h
section .data