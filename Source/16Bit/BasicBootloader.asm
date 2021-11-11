
mov ah, 0x0e
mov bx, 0x7c00
add bx, tempText
mov al, [bx]
int 0x10

mov al, 'T'
call printFunc
mov al, 'h'
call printFunc
mov al, 'i'
call printFunc
mov al, 's'
call printFunc
mov al, ' '
call printFunc
mov al, 'i'
call printFunc
mov al, 's'
call printFunc
mov al, ' '
call printFunc
mov al, 's'
call printFunc
mov al, 'h'
call printFunc
mov al, 'i'
call printFunc
mov al, 't'
call printFunc


jmp $

printFunc:
mov ah, 0x0e
int 0x10
ret

tempText :
db 'F'

times 510 - ($-$$) db 0
dw 0xaa55