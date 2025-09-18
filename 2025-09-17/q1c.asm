;
; 1. encontre o valor de S para a quantidade de termos informados em cada sequência:
;
;   c) -1 + 2 - 3 + 4 - 5 + [...]
;

section .data
    format: db "%d", 0x0
    message: db "informe o valor de N: ", 0x0

section .bss
    n resd 1
    m resd 1
    s resd 1

section .text
    extern _printf, _scanf
    global _main

    _main:
        ; printf("informe o valor de N: ")
        push message
        call _printf
        add esp, 4

        ; scanf("%d")
        push n
        push format
        call _scanf
        add esp, 8

        ; loop

        mov dword[s], 0
        mov dword[m], 1
        mov ecx, 0

        .repita:
            inc ecx

            ;;;;;;;;;;;;;;;;;;;;;

            ; alterando o sinal a cada operação
            mov eax, dword[m]
            mov ebx, -1
            mul ebx
            mov dword[m], eax

            ; calculando o sinal de N em i e somando
            mov eax, ecx
            mov ebx, dword[m]
            mul ebx
            add eax, dword[s]
            mov dword[s], eax

            ;;;;;;;;;;;;;;;;;;;;;

            cmp ecx, dword[n]
            jl .repita

        ; printf("%d")
        push dword[s]
        push format
        call _printf
        add esp, 8
        ret
