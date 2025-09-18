;
; 2. construa um programa que solicita ao usuário um valor e informa se é par ou impar;
;

section .data
    format: db "%d", 0x0
    message: db "informe o valor a ser verificado: ", 0x0
    output_par: db "o valor é par", 0x0
    output_impar: db "o valor é impar", 0x0

section .bss
    x resd 1
    r resd 1

section .text
    extern _printf, _scanf
    global _main

    _main:
        ; printf("informe o valor a ser verificado: ")
        push message
        call _printf
        add esp, 4

        ; scanf("%d")
        push x
        push format
        call _scanf
        add esp, 8

        ; x / 2

        xor edx, edx
        mov eax, dword[x]
        mov ebx, 2
        div ebx

        ; comparando
        
        cmp edx, 0
        je par
        
        impar:
            push output_impar
            call _printf
            add esp, 4
            ret
        par:
            push output_par
            call _printf
            add esp, 4
            ret
        ret