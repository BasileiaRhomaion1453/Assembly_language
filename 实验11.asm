letterc:
push si
push ax
x:
mov al,ds:[si]
cmp al,0
je f 
inc si
cmp al,'a'
jb x
cmp al 'z'
ja x
add al,'A'-'a'
mov ds:[si-1],al
jmp x
f:
pop ax
pop si
ret