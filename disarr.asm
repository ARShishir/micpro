.model small
.data
    arr db 10, 20, 30, 40, 50
    len db 5

.code
main:
    mov ax, @data
    mov ds, ax

    mov si, 0         ; index
    mov cx, len       ; loop counter

print_loop:
    mov al, arr[si]
    ; AL 
    inc si
    loop print_loop

    mov ah, 4ch
    int 21h
end main
