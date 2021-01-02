; HelloWorld.asm from pentesterAcademy course
; x86 helloWorld
; /usr/src/linux-headers-5.4.0-1029-aws/include/uapi/asm-generic/unistd.h
; EAX systemcall
; EBX 1st arg
; ECX 2nd arg
; EDX 3rd arg
; ESI 4th arg
; EDI 5th arg

; nasm -f elf32 -o HelloWorld.o helloworld.asm 
; ld -m elf_i386 -o HelloWorld HelloWorld.o


global _start

section .text

_start:

    ; ssize_t write(int fd, const void *buf, size_t count);
    mov eax, 0x4 ; syscall
    mov ebx, 0x1 ;  stdout
    mov ecx, message ; message
    mov edx, mlen ; message length
    int 0x80

    mov eax, 0x1 ; exit
    mov ebx, 0x0 ; return status
    int 0x80

section .data

    message: db "Hello World"
    mlen equ $-message