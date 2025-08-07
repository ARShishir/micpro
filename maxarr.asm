.model small
.data
    arr db 12, 35, 27, 89, 44
    len db 5
    max db 0

.code
main:
    mov ax, @data
    mov ds, ax

    xor si, si
    mov al, arr[si]    ; Assume first is max
    inc si
    mov cx, len
    dec cx             ; Already considered first element

find_max:
    mov bl, arr[si]
    cmp bl, al
    jbe skip
    mov al, bl
skip:
    inc si
    loop find_max

    mov max, al

    mov ah, 4ch
    int 21h
end main
