mov ah, 0x0e
mov al, 'A'

loop:
    int 0x10
    cmp al, 0x61
    jge upper
    jmp lower

upper:
    sub al, 0x1f
    cmp al, 'Z'+1
    je exit
    jmp loop

lower:
    add al, 0x21
    cmp al, 'z'+1
    je exit
    jmp loop

exit:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa