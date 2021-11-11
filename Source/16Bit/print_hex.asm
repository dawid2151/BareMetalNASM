print_hex:						; print 16bit hex digit stored in dx where bx is string addr in memory
	pusha
					
start:							
	add bx, 0x02				; increment bx to point after '0x'
	mov ah, dh					; isolate first hex digit into ah
	shr ah, 4
	and ah, 00001111b
	call hex_char_to_ascii		
	
	mov ah, dh					; isolate second hex digit
	and ah, 00001111b
	call hex_char_to_ascii

	mov ah, dl
	shr ah, 4
	and ah, 00001111b
	call hex_char_to_ascii	

	mov ah, dl
	and ah, 00001111b
	call hex_char_to_ascii	

	jmp end_print_hex


hex_char_to_ascii:				; convert hex digit from al to ascii digit into cx as 0 terminated string
	cmp ah, 10d
	jl skipAddition
	add ah, 0x27							
	skipAddition:
	add ah, 0x30				; at this potin al holds our ready ascii char
	mov [bx], ah
	add bx, 0x01
	ret


end_print_hex:
	sub bx, 0x06
	call print_string
	popa
	ret
