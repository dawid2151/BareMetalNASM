;EBX is pointer to current character of a string
;EDX is pointer to current character in video memory
[bits 32]
VIDEO_MEMORY equ 0xb8000


print_string32:			
	pusha
	mov edx, VIDEO_MEMORY	

	loopstart32:			
	mov ah, 0x1f 		;character parameters - white on black
	mov al, [EBX]		;copy character at address ebx
	cmp al, 0
	je end_print_string32	; if char == 0 endprogram,	Null terminated string
	jmp print_char32		; else print charracter stored in CL

print_char32:				
	mov [EDX], AX
	add ebx, 0x0001		; increment ebx to point at next character (ascii 8bits)
	add edx, 0x0002		; increment edx to point at next character (properties + ascii 16bits)
	jmp loopstart32		; go back to loop begining


end_print_string32:
	popa				; return values from stack and return from function call
	ret


fill_display:				;fill display with AL character with AH parameters
	pusha
	mov edx, VIDEO_MEMORY

	mov ebx, 0

	fill_character:
	mov [edx], AX
	add edx, 0x0002
	add ebx, 1
	cmp ebx, 2000
	je end_fill_display
	jmp fill_character

end_fill_display:
	popa
	ret