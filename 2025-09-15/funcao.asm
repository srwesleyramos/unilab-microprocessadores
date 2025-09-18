;
; 1. escreva um programa que encontre o valor da função f(x), a partir do valor de x fornecido;
;    considere: f(x) = 2x² - 3x + 1
;

section .data
    format: db "%d", 0x0
    message: db "informe o valor para X: ", 0x0

section .bss
    x resd 1
    p1 resd 1
    p2 resd 1
    r resd 1

section .text
    extern _printf, _scanf
    global _main

    _main:
        ; printf("informe o valor para X: ")

        push message
        call _printf
        add esp, 4

        ; scanf("%d")

        push x
        push format
        call _scanf
        add esp, 8

        ; x * x * 2 = p1
        
        mov eax, dword[x]
        mov ebx, dword[x]
        mul ebx
        mov ebx, 2
        mul ebx
        mov dword[p1], eax

        ; 3 * x = p2

        mov eax, dword[x]
        mov ebx, 3
        mul ebx
        mov dword[p2], eax

        ; p1 - p2 + 1

        mov eax, dword[p1]
        sub eax, dword[p2]
        add eax, 1
        mov dword[r], eax

        ; printf("f(x) = %d")

        push dword[r]
        push format
        call _printf
        add esp, 8
        ret
