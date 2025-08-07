.model small
.data
    arr db 5, 10, 15, 20, 25
    len db 5
    sum db 0

.code
main:
    mov ax, @data
    mov ds, ax

    xor si, si       ; index
    xor ax, ax       ; accumulator for sum
    mov cx, len

sum_loop:
    mov bl, arr[si]
    add al, bl
    inc si
    loop sum_loop

    ; AL now has the sum
    mov sum, al

    mov ah, 4ch
    int 21h
end main
