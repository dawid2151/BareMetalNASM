mov bx, 41

cmp bx, 4
jle bxle4

cmp bx, 40
jl bxl40

mov al, 'C'
jmp endhere

bxle4:
	mov al, 'A'
	jmp endhere
ebxle4:

bxl40:
	mov al, 'B'
	jmp endhere
ebxl40:

endhere:


mov ah, 0x0e     ; int =10/ah=0x0e  -> BIOS tele -type  output
int 0x10          ; print  the  character  in al
jmp $
; Padding  and  magic  number.
times  510-($-$$) db 0
dw 0xaa55