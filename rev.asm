.model small
.data
    arr db 1, 2, 3, 4, 5
    len db 5

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, len
    dec cx
    mov si, 0
    mov di, cx

reverse_loop:
    cmp si, di
    jge end_reverse

    ; Swap arr[si] and arr[di]
    mov al, arr[si]
    mov bl, arr[di]
    mov arr[si], bl
    mov arr[di], al

    inc si
    dec di
    jmp reverse_loop

end_reverse:
    mov ah, 4ch
    int 21h
end main
