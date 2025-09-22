;
; S = (n-0)! / 1 - (n-1)! / 2 + (n-2)! / 3 - (n-3)! / 4
;

section .data
    format: db "%d", 0x0
    message: db "informe o valor de N: ", 0x0

section .bss
    n resd 1
    m resd 1
    r resd 1

section .text
    extern _printf, _scanf
    global _main

    _main:
        ; printf
        push message
        call _printf
        add esp, 4

        ; scanf
        push n
        push format
        call _scanf
        add esp, 8

        ; for 1-N

        mov dword[r], 0
        mov dword[m], 1
        mov ecx, 0

        .repita:
            push ecx

            ; 1. calcular o valor de (n - ecx)

            mov eax, dword[n]
            sub eax, ecx

            ; 2. calcular o fatorial do eax

            push eax
            call _fatorial
            add esp, 4

            ; 3. dividindo pelo ecx

            pop ecx
            inc ecx
            div ecx

            ; 4. calcular o sinal do resultado

            mul dword[m]

            ; 5. somando ao resultado

            add eax, dword[r]
            mov dword[r], eax

            ; 6. calculando o próximo sinal

            mov eax, dword[m]
            mov ebx, -1
            mul ebx
            mov dword[m], eax

            cmp ecx, dword[n]
            jl .repita
        
        push dword[r]
        push format
        call _printf
        add esp, 8
        ret

    _fatorial:
        mov eax, 1
        mov ecx, [esp + 4]

        .repita:
            mul ecx

        loop .repita
        ret
