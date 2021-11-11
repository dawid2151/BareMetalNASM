[bits 32]
run_protected:
    mov ah, 0x12
    mov al, 0xDB
    call fill_display

    mov ebx, PROTECTED_MODE_MSG
    call print_string32

    call KERNEL_ADDRESS

    jmp $
ret

PROTECTED_MODE_MSG db 'Entered protected mode.', 0


