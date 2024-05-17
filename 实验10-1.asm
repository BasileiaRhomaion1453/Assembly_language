assume cs:code
data segment
db 'welcome to masm!',0
data ends
code segment
start:
mov dh,8
mov dl,21
mov cl,2
mov ax,data
mov ds,ax
mov si,0
call show_str
mov ax,4c00h
int 21h
show_str:
push ax
push cx
push dx
push es
push si
push di
mov ax,0b800h
mov es,ax
dec dh
mov al,160
mul dh
add dl,dl
mov dh,0
add ax,dx
mov di,ax
mov ah,cl
s:
mov cl,ds:[si]
mov ch,0
jcxz s1
mov al,cl
mov es:[di],ax
inc si
inc di
inc di
jmp s
s1:
pop di
pop si
pop es
pop dx
pop cx
pop ax
ret
code ends
end start