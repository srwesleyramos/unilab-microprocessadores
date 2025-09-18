;
; 1. encontre o valor de S para a quantidade de termos informados em cada sequência:
;
;   d) s = 200/(n+1) - 200/(n+2) + 200/(n+3) - 200/(n+4)
;

section .data
    format: db "%d", 0x0
    message: db "informe o valor de N: ", 0x0

section .bss
    n resd 1
    m resd 1
    f resd 1
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

        mov dword[m], -1
        mov dword[s], 0
        mov ecx, 0

        .repita:
            inc ecx
            push ecx

            ;;;;;;;;;;;;;;;;;;;;;

            ; calculando o fatorial de n + 1

            mov eax, dword[n]
            add eax, ecx

            mov dword[f], 1
            mov ecx, eax

            .fat:
                push ecx

                mov eax, dword[f]
                mul ecx
                mov dword[f], eax

                pop ecx
            
            loop .fat

            ; calculando o sinal do elemento

            mov eax, dword[m]
            mov ebx, -1
            mul ebx
            mov dword[m], eax

            ; somando o elemento ao resultado

            mov eax, 200
            mov ebx, dword[f]
            mov edx, 0
            div ebx
            mul dword[m]
            add eax, dword[s]
            mov dword[s], eax

            ;;;;;;;;;;;;;;;;;;;;;

            pop ecx
            cmp ecx, dword[n]
            jl .repita

        ; printf("%d")
        push dword[s]
        push format
        call _printf
        add esp, 8
        ret
