[org 0x7c00]
[bits 16]
KERNEL_ADDRESS equ 0x1000   ;kernel load address
mov [BOOT_DEVICE], dl       ;device we booted from

mov bp, 0x9000              ;stack
mov sp, bp

call copy_from_disk

call switch_to_protected

mov bx, OUT_OF_LOOP_EXCEPTION
call print_string32

hang: 
    jmp hang

%include "print_hex.asm"
%include "print_string.asm"
%include "gdt_definition.asm"
%include "copy_from_disk.asm"
%include "print_string_32.asm"
%include "run_protected.asm"
%include "switch_to_protected.asm"

TEMP_DATA db '0x0000', 0

OUT_OF_LOOP_EXCEPTION db 'Critical exception: Outside of main loop!', 0

times 510 - ($-$$) db 0
dw 0xaa55