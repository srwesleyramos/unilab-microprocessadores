extern printf

section .data
    message: db "hello world!", 0x0

section .text
global main
main:
    push message
    call printf
    add esp, 4
    ret