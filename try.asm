assume cs:code
data segment
db 'welcome to masm!'
db 01001010b
db 10101100b
db 01111001b
data ends

stack segment
db 128 dup (0)
stack ends

code segment
start:
mov ax,stack
mov ss,ax
mov sp,128
mov bx,data
mov ds,bx

mov bx,0b800h
mov es,bx
mov si,0
mov di,160*10+30*2
mov bx,16
mov dx,0
mov cx,3
showmasm:
push bx
push cx
push si
push di
mov cx,16
mov dh,ds:[bx]
showrow:
mov dl,ds:[si]
mov es:[di],dx
add di,2
inc si
loop showrow
pop di
pop si
pop cx
pop bx
add di,160
inc bx
loop showmasm


mov ax,4c00h
int 21h
code ends
end start