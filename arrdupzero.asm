.model small
.stack 100h

.data
    arr db 10 dup(0)         ; Allocate 10 bytes with initial value 0
    len db 10                ; Length of array

.code
main:
    mov ax, @data
    mov ds, ax

    ; Fill array with values 0 to 9
    mov cx, 10
    xor si, si
fill_loop:
    mov al, si
    mov arr[si], al
    inc si
    loop fill_loop

    ; Print the array elements (as digits)
    xor si, si
    mov cx, 10

print_loop:
    mov al, arr[si]
    add al, 30h           ; Convert to ASCII digit
    mov dl, al
    mov ah, 02h
    int 21h

    ; Print space for clarity
    mov dl, ' '
    int 21h

    inc si
    loop print_loop

    ; Exit
    mov ah, 4ch
    int 21h
end main
