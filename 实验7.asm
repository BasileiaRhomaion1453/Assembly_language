assume cs:codesg
data segment
db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
db '1993','1994','1995'
dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
dw 11542,14430,15257,17800
data ends
table segment
db 21 dup ('year summ ne ?? ')
table ends
stacksg segment
db 16 dup (0h)
stacksg ends
codesg segment
start:
mov ax,data
mov ds,ax
mov ax,stacksg
mov ss,ax
mov sp,16
mov ax,table
mov es,ax
mov si,0h
mov cx,15h
mov bx,0h
loop1:
push cx
mov cx,4h
mov di,0h
year:
mov al,[si]
mov es:[bx].0[di],al
inc di
inc si
loop year
pop cx
add bx,10h
loop loop1
mov cx,15h
mov bx,0h
loop2:
push cx
mov cx,4h
mov di,0h
summ:
mov al,[si]
mov es:[bx].5[di],al
inc di
inc si
loop summ
pop cx
add bx,10h
loop3:
mov ax,[si]
mov es:[bx].10,ax
mov ax,es:[bx].5
mov dx,es:[bx].7
div word ptr [si]
mov es:[bx].13,ax
add si,2h
add bx,10h
loop loop3
mov ax,4c00h
int 21h
codesg ends
end start