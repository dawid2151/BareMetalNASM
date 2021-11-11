[bits 32]

gdt_definition:

gdt_null:
    dd 0x0
    dd 0x0

gdt_code:
    dw 0xffff       ;Segment limit (0-15)
    dw 0x0000       ;Base address (16-31)
    db 0x00         ;Base address (32-39)

    ;Access byte (40 - 47)
    ;Ac    0     40 - Is segment accesed by cpu
    ;RW    1     41 - Is readable/writable
    ;DC    0     42 - Direction/conforming
    ;EX    1     43 - Is executable
    ;S     1     44
    ;Privl 0     45
    ;Privl 0     46
    ;Pr    1     47
    db 10011010b

    ;Segment limit (48 - 51)
    ;Flags (52-55)
    ;AVL   0     52
    ;64bit 0     53
    ;Sz    1     54
    ;Gr    1     55
    db 11001111b

    db 0x00         ;Base (56-63)

gdt_data:
    dw 0xffff       ;Segment limit (0-15)
    dw 0x0000       ;Base address (16-31)
    db 0x00         ;Base address (32-39)

    ;Access byte (40 - 47)
    ;Ac    0     40 - Is segment accesed by cpu
    ;RW    1     41 - Is readable/writable
    ;DC    0     42 - Direction/conforming
    ;EX    0     43 - Is executable
    ;S     1     44
    ;Privl 0     45
    ;Privl 0     46
    ;Pr    1     47
    db 10010010b

    ;Segment limit (48 - 51)
    ;Flags (52-55)
    ;AVL   0     52
    ;64bit 0     53
    ;Sz    1     54
    ;Gr    1     55
    db 11001111b

    db 0x00         ;Base (56-63)

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_definition - 1     ;Size
    dd gdt_definition                   ;Start address

CODE_SEGMENT equ gdt_code - gdt_definition
DATA_SEGMENT equ gdt_data - gdt_definition
