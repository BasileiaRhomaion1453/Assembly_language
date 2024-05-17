assume cs:code
data segment
db 'welcome to masm!'
data ends
code segment
start:
mov ax,data
mov ds,ax
mov ax,0b800h
mov es,ax
mov si,0
mov di,10*160+80
mov cx,16
s1:
mov al,ds:[si]
mov ah,00000010b
mov es:[di],ax
inc si
inc di
inc di
loop s1
mov si,0
mov di,11*160+80
mov cx,16
s2:
mov al,ds:[si]
mov ah,00100100b
mov es:[di],ax
inc si
inc di
inc di
loop s2
mov si,0
mov di,12*16+80
mov cx,16
s3:
mov al,ds:[si]
mov ah,01110001b
mov es:[di],ax
inc si
inc di
inc di
loop s3
mov ax,4c00h
int 21h
code ends
end start