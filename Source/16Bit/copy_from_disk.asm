[bits 16]
copy_from_disk:
    mov bx, KERNEL_ADDRESS
    mov dh, 15              ;load 15 sectors
    mov dl, [BOOT_DEVICE]   ;from boot device
    call disk_load
    ret

disk_load:                  ;load dh sectors to es:bx from dl device
    push dx

    mov ah, 0x02            ;Bios read
    mov al, dh              ;DH sectors
    mov ch, 0x0               ;From CH cylinder
    mov dh, 0x0               ;From DH head
    mov cl, 0x02            ;Start from second sector
    int 0x13

    jc read_error
    mov bx, LOADING_MSG
    call print_string

    pop dx
    cmp dh, al
    jne read_error

    mov bx, COMPLETE_MSG
    call print_string

    ret


read_error:
    mov ah, 0x01
    int 0x13

    mov dx, 0x0000
    mov dh, ah
    mov bx, ERROR_CODE
    call print_hex

    mov bx, ERROR_MSG
    call print_string

    jmp $


ERROR_MSG db 'Error reading disk', 0

LOADING_MSG db 'Interrupt issued successfully', 0x0a, 0

COMPLETE_MSG db 'Loading completed', 0

BOOT_DEVICE db 0

ERROR_CODE db '0x0000', 0