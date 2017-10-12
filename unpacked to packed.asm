data segment
    unpacked dw 0201h
    packed db ?
data ends

code segment
    assume DS:data CS:code
    
    start:mov ax, data
          mov ds,ax
          mov ax,0 
          mov ax,unpacked
          shl al,4
          shr ax,4
          mov packed,al
          
code ends
end start
    
    




