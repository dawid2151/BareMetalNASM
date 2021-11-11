;BX is pointer to current character of a string

print_string:			; print string from memory at starting address bx
	pusha

	loopstart:			; mark start of the per character loop
	mov cl, [bx]		; copy ascii character at address bx to CL
	cmp cl, 0
	je end_print_string	; if char == 0 endprogram,	Null terminated string
	jmp print_char		; else print charracter stored in CL

print_char:				; print character held in cl
	mov ah, 0x0e		;
	mov al, cl			; lower byte of AX holds character in ascii
	int 0x10			; call bios interrupt that prints character from AX
	add bx, 0x0001		; increment bx, to point at next character
	jmp loopstart		; go back to loop begining


end_print_string:
	popa				; return values from stack and return from function call
	ret