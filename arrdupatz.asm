.model small
.stack 100h

.data
    arr db 26 dup(0)     ; Allocate 26 bytes for A-Z
    len db 26

.code
main:
    mov ax, @data
    mov ds, ax

    ; Fill array with A-Z using ASCII values
    mov cx, 26
    xor si, si
    mov bl, 65           ; ASCII value of 'A'

fill_loop:
    mov arr[si], bl
    inc bl
    inc si
    loop fill_loop

    ; Print the array
    xor si, si
    mov cx, 26

print_loop:
    mov dl, arr[si]
    mov ah, 02h
    int 21h

    ; Optional: add a space
    mov dl, ' '
    int 21h

    inc si
    loop print_loop

    ; Exit program
    mov ah, 4ch
    int 21h
end main
