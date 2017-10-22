data segment
    packed db 21h,34h,56h,78h,49h,17h,63h,82h
    unpacked dw ?,?,?,?,?,?,?,?
data ends
code segment
    assume: DS:data CS:code
    start:mov ax,data
          mov ds,ax
          mov cx,8
          mov ax,0
          mov si,0
          mov di,0 
          
     next:mov ax,0
          mov al,packed[si]
          rcl ax,4
          rcr al,4
          mov unpacked[di],ax
          inc si
          inc di
          inc di
          loop next
code ends
end start




