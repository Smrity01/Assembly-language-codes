data1 segment
    sum dw 0
    index db 5
    array db 1,2,3,4,5
data1 ends

code1 segment
    assume 
           mov ax,0
           mov si,0
           
           lea bx,array
           mov cx,index-1
           add ax,bx[si]
    next:inc si
    adc ax,bx[si]
    loop next
    
    mov sum,ax  
    
code1 ends
    