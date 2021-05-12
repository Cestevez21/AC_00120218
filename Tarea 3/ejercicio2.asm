        org 100h


section .text

        XOR SI, SI ;Limpiamos variables
        XOR AX, AX
        mov AL, 5d
        mov SI, 4d
        jmp factorial

factorial:
        CMP SI, 0d
        JE asignar

        MUL SI
        DEC SI
        jmp factorial

asignar:
        mov [20Bh], AL

        int     20h