[org 0x7c00]


mov dx, 0x1fb6					; store  the  value  to  print in dx
mov bx, HEX_OUT
call print_hex

jmp $

%include "print_string.asm"
%include "print_hex.asm"


HEX_OUT:
	db '0x0000', 0

times 510-($-$$) db 0
dw 0xaa55