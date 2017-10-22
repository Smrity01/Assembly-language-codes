;packed to unpacked conversion using masking
;all the variables are intialized in data segment

data segment
    packed db 21h,34h,56h,78h,49h,17h,63h,82h
    unpacked dw ?,?,?,?,?,?,?,? 
    mask_var1 db 0fh
    mask_var2 db 0f0h
data ends 

;code is written in code segment

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
          mov ah,packed[si]
          and al,mask_var1
          and ah,mask_var2
          shr ah,04
          mov unpacked[di],ax
          inc si
          inc di
          inc di
          loop next
code ends
end start




