assume cs:codesg
codesg segment
    mov ax,2000
    mov ss,ax
    mov sp,0
    add sp,0010
    pop ax
    pop bx
    push ax
    push bx
    pop ax
    pop bx
    mov ax,4c00h
    int 21
codesg ends
end