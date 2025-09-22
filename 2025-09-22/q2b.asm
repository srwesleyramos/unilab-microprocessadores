;
;  A = { 07, 08, 16, 10 }
;  B = { 01, 02, 04, 07}
;  S = A - B
;

section .data
    format: db "%d ", 0x0

    ; input & output
    a: dd 7, 8, 16, 10
    b: dd 1, 2, 4, 7

section .text
    extern _printf, _scanf
    global _main

    _main:
        mov ecx, 0

        .repita:
            inc ecx
            push ecx

            ; ----

            mov eax, dword[a + (ecx - 1) * 4]
            mov ebx, dword[b + (ecx - 1) * 4]
            sub eax, ebx

            push eax
            push format
            call _printf
            add esp, 8

            ; ----

            pop ecx
            cmp ecx, 4
            jl .repita

        ret