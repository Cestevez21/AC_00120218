org 100h

    section .text
        XOR AX, AX
        XOR SI, SI
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX

        MOV SI, 0
        MOV DI, 0d

        MOV DH, 10 
        MOV DL, 20 

        call modotexto

    Nombre1:
            call movercursor 
            MOV CL, [primerNombre+SI]
            call escribircaracter
            INC SI
            INC DL 
            INC DI
            CMP DI, 6d
            JB Nombre1 
            XOR AH, AH
            XOR SI, SI
            XOR AL, AL
            XOR CX, CX
            XOR DL, DL
            XOR DI, DI
            MOV DL, 20
            INC DH 
            jmp Nombre2 

    Nombre2:
            call movercursor 
            MOV CL, [segundoNombre+SI]
            call escribircaracter
            INC SI
            INC DL 
            INC DI
            CMP DI, 9d
            JB Nombre2 
            XOR AH, AH
            XOR SI, SI
            XOR AL, AL
            XOR CX, CX
            XOR DL, DL
            XOR DI, DI
            MOV DL, 20
            INC DH 
            jmp Apellido1 

    Apellido1:
            call movercursor 
            MOV CL, [primerApellido+SI]
            call escribircaracter
            INC SI
            INC DL 
            INC DI
            CMP DI, 7d
            JB Apellido1
            XOR AH, AH
            XOR SI, SI
            XOR AL, AL
            XOR CX, CX
            XOR DL, DL
            XOR DI, DI
            MOV DL, 20
            INC DH 
            jmp Apellido2 

    Apellido2:
            call movercursor 
            MOV CL, [segundoApellido+SI]
            call escribircaracter
            INC SI
            INC DL 
            INC DI
            CMP DI, 5d
            JB Apellido2 
            XOR AH, AH
            XOR SI, SI
            XOR AL, AL
            XOR CX, CX
            XOR DL, DL
            XOR DI, DI
            MOV DL, 20
            INC DH 
            jmp esperartecla 

    modotexto: 
            MOV AH, 0h 
            MOV AL, 03h 
            INT 10h
            RET

    movercursor:
            MOV AH, 02h
            MOV BH, 0h 
            INT 10h
            RET

    escribircaracter:
            MOV AH, 0Ah
            MOV AL, CL 
            MOV BH, 0h
            MOV CX, 1h
            INT 10h
            RET

    esperartecla:
            MOV AH, 00h 
            INT 16h

    exit:
            int 20h



    section .data

        primerNombre DB 'Carlos'
        segundoNombre DB 'Francisco'
        primerApellido DB 'Estevez'
        segundoApellido DB 'Lemus'