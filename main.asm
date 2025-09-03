global _start

; Simple calculator, x86-64 assembly, Linux
; this took time, effort and internal pain to make, so please respect the code

; in the example progeram, the addition 1 + 2 executes because
; rbx has 1, rbp has 2, and R13 has 1 which means addition

section .text

_start:
    mov rbx, 1 ; num1
    mov rbp, 2 ; num2
    mov r12, 0 ; result
    mov rdx, 0 ; div remainder
    mov r13, 1 ; operation (1:add, 2:sub, 3:mul, 4:div)


    cmp r13, 1
    je l_add ; addition

    cmp r13, 2
    je l_sub ; subtraction

    cmp r13, 3
    je l_mul ; multiplication

    cmp r13, 4
    je l_div ; division

l_add:
    add rbx, rbp ; rbx = rbx + rbp
    mov r12, rbx ; store result in r12
    jmp l_end

l_sub:
    sub rbx, rbp ; rbx = rbx - rbp
    mov r12, rbx ; store result in r12
    jmp l_end

l_mul:
    imul rbx, rbp ; rbx = rbx * rbp
    mov r12, rbx ; store result in r12
    jmp l_end

l_div:
    cmp rbp, 0
    je l_error
    xor rdx, rdx ; clear remainder
    mov rax, rbx
    div rbp ; rax = rbx / rbp, rdx = rbx % rbp 
    mov r12, rax ; store result in r12

l_end:
    xor rbp, rbp ; clear register
    xor r12, r12 ; clear register
    xor rdx, rdx ; clear register
    xor r13, r13 ; clear register

    mov rax, 60 ; syscall: exit
    xor rdi, rdi ; code 0
    syscall

l_error:
    mov rax, 60 ; syscall: exit
    mov rdi, 1 ; 1 for error
    syscall