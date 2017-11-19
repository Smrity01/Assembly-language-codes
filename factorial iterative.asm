data segment
    num dw 4     ; number whose factorial need to find  
    result dw ?  ; stores the result 
data ends

code segment 
    assume: ds:data cs:code
    
    start: mov ax,data
           mov ds,ax
           call fact
           mov ah,4ch
           int 21h
           
           fact proc ; factorial procedure
            mov ax,01h
            mov cx, num
            
            next1: mul cx
                   loop next1
            mov result,ax
            
           fact endp
code ends
end start