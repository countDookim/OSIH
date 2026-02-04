[org 0x7c00]        ; Sets origin of memory to account for offset
    mov bx, buffer
    mov cl, 0

takeInput:
    mov ah, 0
    int 0x16
    cmp al, 0x0d
    je prnt
    cmp cl, 10
    je prnt
    inc cl
    mov ah, 0x0e
    int 0x10
    mov [bx], al
    inc bx
    jmp takeInput

prnt:
    mov [bx], 0
    mov ah, 0x0e
    mov al, 0x0d
    int 0x10
    mov al, 0x0a
    int 0x10
    mov bx, buffer      ; Pointer to buffer

printString:
    mov al, [bx]
    cmp al, 0
    je exit
    int 0x10
    inc bx
    jmp printString

exit:
    jmp $

buffer:
times 10 db 0



times 510-($-$$) db 0
db 0x55, 0xaa