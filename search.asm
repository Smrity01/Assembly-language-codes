;******Linear Search*****                           

;variables are initialized in data segment
;array: store the multiple numeric values
;element: the element which need to be find in array

data segment
    array db 01h,05h,07h,02h
    element db 08h
data ends

code segment
    assume ds:data,cs:code
    
    start: mov ax,data
           mov ds,ax
           mov bx,0
           mov si,0
           mov ah,0
           mov al,element
           mov cx,04h
           
    next:  cmp al, array[si]
           jz el_found
           inc si
           loop next
           jmp el_not_found 
           
    el_found: mov bl,element
    el_not_found: code ends

    
end start


