start:
mov ax,cs
mov ds,ax
mov si,offset dp
mov ax,0
mov es,ax
mov di,200h
mov cx,offset dpend-offset dp
rep movsb
mov word ptr es:[7ch*4],200h
mov word ptr es:[7ch*4+2],0
dp:
mov al,160
mul dh
add dl,dl
mov dh,0
add ax,ax
mov di,ax
mov ax,0b800h
mov es,ax
s:
mov al,ds:[si]
mov ah,0
cmp ax,0
je f
mov ah,cl
mov es:[di],ax
inc si
inc di
inc di
jmp s
f:
iret
dpend:nop

start:
mov ax,cs
mov ds,ax
mov si,offset lp
mov ax,0
mov es,ax
mov di,200h
mov cx,offset dpend-offset lp
rep movsb
mov word ptr es:[7ch*4],200h
mov word ptr es:[7ch*4+2],0
lp:
push bp
dec cx
jcxz f
mov bp,sp
add [bp+2],bx
f:
pop bp
iret
lpend:nop