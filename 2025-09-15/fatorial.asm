;
; 3. construa um programa para calcular o fatorial de um número informado;
;

section .data
    format: db "%d", 0x0
    message: db "informe o valor de X: ", 0x0

section .bss
    x resd 1
    r resd 1

section .text
    extern _printf, _scanf
    global _main

    _main:
        ; printf("informe o valor de X: ")
        push message
        call _printf
        add esp, 4

        ; scanf("%d")
        push x
        push format
        call _scanf
        add esp, 8

        ; loop

        mov dword[r], 1
        mov ecx, dword[x]

        .repita:
            mov eax, dword[r]
            mul ecx
            mov dword[r], eax

        loop .repita

        ; printf("%d")
        push dword[r]
        push format
        call _printf
        add esp, 8
        ret