org 0x7C00

start:
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov ah, 0x00
    mov al, 0x03
    int 0x10

    mov ah, 0x02
    mov bh, 0x00
    mov dh, 0x00
    mov dl, 0x00
    int 0x10

    mov si, message

.print_char:
    lodsb
    or al, al
    jz .hang

    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp .print_char

.hang:
    cli
    hlt

message db 'OW3L BOOT OK', 0

times 510-($-$$) db 0
dw 0xAA55
