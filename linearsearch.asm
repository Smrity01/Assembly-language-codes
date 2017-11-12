data segment
    array dw 01h,06h,65h,43h,30h,40h,55h
    element dw 40h
    index dw ? 
    two db 2
data ends

code segment
    assume: ds:data cs:code
    
    start: mov ax,data
           mov ds,ax
           
           mov ax,0
           mov si,0
           mov cx,7
           
           
    linear_search proc near
        next: mov ax,array[si]
              cmp ax,element
              jz found
              inc si
              inc si
              loop next
              jmp not_found
              
        found: mov ax,si
               div two
               mov ah,0
               mov si,ax
               mov index,si
               mov ah,4ch
               int 21h
               
       not_found: mov index,-1
                  mov ah,4ch
                  int 21h
             
       ret
      linear_search endp
    call linear_search
code ends
end start
        


