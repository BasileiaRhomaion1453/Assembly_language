assume cs:code
data segment
db 20 dup(1)
data ends
code segment
start:
mov ax,data
mov ds,ax
mov ax,10100
call dtoc_word
mov ax,4c00h
int 21h
dtoc_word:
push ax
push bx
push cx
push dx
push si
mov bx,0
s:
mov dx,0
mov cx,10
div cx
mov cx,ax
add dx,'0'
push dx
inc bx
jcxz s1
jmp s
s1:
mov cx,bx
s2:
pop ds:[si]
inc si
loop s2
pop si
pop dx
pop cx
pop bx
pop ax
ret
code ends
end start