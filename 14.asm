assume cs:code
code segment
start:
mov ax,2
shl ax,1
mov bx,ax
shl ax,1
shl ax,1
add ax,bx
mov ax,4c00h
int 21h
code ends
end start

s:
mov ax,a[si]
add b,ax
adc b[2],0
add si,2
loop s

assume cs:code, ds:data, es: info_num 
data segment
db ' 11/11/11 11:11:11$' 
data ends
info_num segment 
db 9, 8, 7, 4, 2, 0 
info_num ends 
code segment 
start:
mov ax, data
mov ds, ax 
mov si, 0
mov ax, info_num
mov es, ax 
mov bp, 0 
mov cx, 6
s:
push cx
mov al,es:[bp] 
out 70h,al 
in al,71h 
mov ah,al 
mov cl,4 
shr ah,cl
and al,00001111B 
add al,30h 
add ah,30h 
mov ds:[si],ah 
mov ds:[si+1],al 
add si,3
inc bp
pop cx
loop s 
mov ah,2 
mov bh,0 
mov dh,12 
mov dl,50 
int 10h 
mov ah,9 
mov dx,0
int 21h
mov ah,2 
mov bh,0 
mov dh,24 
mov dl,0 
int 10h 


assume cs: codesg, ss:stacksg stacksg SEGMENT
dw 64 dup (0) stacksg ENDS 
codesg SEGMENT
start:
mov ax,stacksg 
mov ss,ax
mov sp,128 
mov ax,0 
mov es, ax 
mov di,0200h 
mov si, offset int9 
push cs
pop ds 
cli
mov bx, offset table 
mov ax,es:[9*4] 
mov ds : [bx],ax 
mov ax,es:[9*4+2] 
mov ds:[bx+2],ax 
sti
mov cx, offset int9end - offset int9 
cld
rep movsb
mov word ptr es : [9 * 4 + 2], 0 
mov word ptr es : [9 * 4], 0200h
mov ax, 4c00h 
int 21h
int 9    
jmp short S
table dw 0,0
S:    
push ax
push cx
push si
push es
mov ax,  0
mov ds,ax
pushf
call dword ptr ds:202hin al,60h
cmp al, 9eh
jne 
int 9 
ret
mov ax, 0b800h
mov es,  ax
mov si,
mov cx, 2000
s1:
mov byte ptr es:[si],'A'
add si,2
loop s1
int 9 
ret:
pop es
pop si
pop cx
pop ax
iret
int 9 
end:nop
codesg ENDS
END start


assume cs:code,ds:data
data segment
strd db 60000 dup(0)
code segment
start:
mov ax,data
mov ds,ax
mov si,offset strd
mov ax,0
mov es,ax

push si
pop es:[204h]
push ds
pop es:[206h]
push cs
pop ds
call setup 7ch；
mov ax,0
mov es,ax
cli
push es:[13h*4]
pop es:200h
push es:[13h*4+2]
pop es:[202h]
mov word ptr es:[7ch*4],208h7ch 
mov word ptr es:[7ch*4+2],0
sti
mov ah,0 
mov bx,9
int 7ch
mov ax,4c00h
int 21h
setup 7ch 
proc
push ax
push si
push di
push cx
mov si,offset new7ch
mov ax,0
mov es,ax
mov di,208h
mov cx,offset new 7ch end - offset new 7ch cld
rep mov sb
pop cx
pop di
pop si
pop ax
ret
setup 7ch endp
new 7ch:jmp short nstart 7ch
strc db'i love this world!'
nstart: push cs
pop ds
push ds
pop es
push bx
cmp ah,1
jne fread
fwrite:pop bx
call setfld
mov bx,offset strc
mov al,1
mov ah,3
pushf
call dwordptr es:[200h]
iret
fread:pop bx
call setfld
mov ax,es:[206h]
mov es,ax
mov bx,es:[204h]
mov al,1
mov ah,2
pushf
call dwordptr cs:L200h
iret
setfld proc
mov ax,0
mov ax,bx
xor dx,dx
mov bx,1440
div bx
xchg ahal
push ax
mov ax，dx
xor dx,dx
mov bh,0
mov bl,18
div bl
mov ch,al
xchg ah，al
mov ah,0
inc ax
mov cl,al
pop dx
ret
setfld endp
new7chend:nop
code ends
end start