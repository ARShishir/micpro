.model small
.stack 100h

.data
    msg1 db 'Enter a Lowercase letter (a-z): $'
    msg2 db 0Dh, 0Ah, 'Uppercase version: $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Print prompt
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Take character input
    mov ah, 01h
    int 21h
    mov bl, al        ; store input in BL

    ; Convert to uppercase: subtract 32
    sub bl, 32

    ; New line + print message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Print converted letter
    mov dl, bl
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
end main
