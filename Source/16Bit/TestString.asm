[org 0x7c00]

mov bx, message
call print_string

jmp $

%include "print_string.asm"

message:
	db 'Omg I know why it didnt worked', 0

times 510 -($-$$) db 0
dw 0xaa55