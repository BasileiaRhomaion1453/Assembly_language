assume cs:code
code segment
start:
mov ax,cs
mov ds,ax
mov si,offset do
mov ax,0
mov es,ax
mov di,200h
mov cx,offset doend-offset do
rep movsb
mov word ptr es:[0],200h
mov word ptr es:[2],0
mov dx,0ffffh
mov bx,1
div bx
mov ax,4c00h
int 21h
do:jmp short  dostart
db 'divide error!'
dostart:
mov ax,0
mov ds,ax
mov si,202h
mov ax,0b800h
mov es,ax
mov ds,160*10+80
mov cx,13
s:
mov al,ds:[si]
mov ah,2
mov es:[di],ax
inc si
inc di
inc di
loop s
mov ax,4c00h
int 21h
doend:nop
code ends
end start