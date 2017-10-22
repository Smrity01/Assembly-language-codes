;Sum of elements of an array
;initialize the variables in data segment

data segment
    sum dw 0
    array dw 01h,02h,03h,04h,05h
    
data ends

;Code is written in code segment
code segment
    assume DS:data,CS:code
    
    start: mov ax,data
           mov ds,ax 
           
           mov cx,5
           mov si,0
           mov ax,0
           lea bx,array
           clc
           
    next: adc ax,bx[si]
          inc si
          inc si
          loop next
          
          mov sum,ax
code ends
end start


