[bits 32]
[extern main]

    mov ah, 0x23
    mov al, 0xDB
    call fill_display

    mov ebx, KERNEL_INIT_MSG
    call print_string32

    call main

    jmp $
KERNEL_INIT_MSG db 'Initialization of kernel...', 0

%include "print_string_32.asm"
