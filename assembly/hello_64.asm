section .text
    global _start

_start:
    mov rdx,len     ;third argument: message length
    mov rsi,msg     ;second argument: pointer to message to write
    mov rdi,1       ;first argument: file handle (stdout)
    mov rax,1       ;system call number (sys_write)
    syscall         ;call kernel

    xor rdi,rdi     ;first argument: file handle (stdout)
    mov rax,60      ;system call number (sys_exit)
    syscall         ;call kernel

section .data
msg db  "Hello, world!",0xa
len equ $-msg
