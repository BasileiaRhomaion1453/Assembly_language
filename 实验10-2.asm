assume cs:code
code segment
start:
mov ax,2390
mov dx,0
mov cx,10
call divdw
mov ax,4c00h
int 21h
divdw:
push bx
push ax
mov ax,dx
mov dx,0
div cx
mov bx,ax
pop ax
div cx
mov cx,dx
mov dx,bx
pop bx
ret
code ends
end start