;16 digit unpacked to packed BCD conversion

;initialize the unpacked and packed array in data segment

data segment
    unpacked dw 0201h,0304h,0506h,0708h,0902h,0503h,0104h,0608H
    packed db ?,?,?,?,?,?,?,?
data ends


;Code is written in code segment

code segment
    assume DS:data CS:code
    
    start:mov ax, data
          mov ds,ax
          mov ax,0
          MOV SI,0
          mov cx,8
          mov di,0
           
     next:mov ax,unpacked[SI]
          shl al,4
          shr ax,4
          mov packed[di],al
          inc si
          inc si
          inc di
          loop next
          
code ends
end start
    
    




