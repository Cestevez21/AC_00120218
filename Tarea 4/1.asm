        org 100h


section .text

        XOR SI, SI ;Limpiamos variables
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        MOV DI, 0d
        MOV BP, 0d
        MOV CX, tamaño
        CALL    Verificar
        int     20h

section .data

arrNum  db  20d,43d,12d,06d,11d,57d,19d,07d,39d,50d
tamaño  equ $-arrNum

Par:
        mov [0300h+DI], DL
        INC DI
        DEC CX
        jmp Verificar

Impar:
        mov [0320h+BP], DL
        INC BP
        DEC CX
        jmp Verificar

Verificar:
    
        MOV AL, [arrNum+SI]
        MOV DL, [arrNum+SI]
        MOV BL, 2d
        DIV BL
        INC SI
        CMP CX, 0d
        je retFin
        CMP AH, 0d
        JP Par
        JNP Impar

        loop Verificar

retFin:
        ret

        