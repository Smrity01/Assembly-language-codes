data segment
    matrix1 db 1h,2h  ;initialize matrix1
            db 2h,3h
            
    matrix2 db 2h,3h,4h  ;initialize matrix2
            db 7h,6h,5h
            
    matrix3 dw 6 dup(?)  ;initialize matrix3 with NAs
    nrow1 dw 2
    ncol1 dw 2
    nrow2 dw 2
    ncol2 dw 3
    
    
data ends
code segment
    assume: ds:data, cs:code
    
    start: mov ax,data
           mov ds,ax
     call matrix_mul
     
     mov ah,4ch
     int 21h
           
     matrix_mul proc near ; MULTIPLICATION PROCEDURE
            mov ax,0
            mov si,0 ; for indexing matrix1
            mov di,0 ; for indexing matrix2
            mov bx,0 ; for indexing matrix3 
            mov cx,nrow1 ; move no. of rows
            mov dl,0 ; for addition of elements
            mov bp,0
      next1:push cx
            mov cx,ncol2 ; move no. of columss
            
            
      next2:push cx
            mov cx,ncol1 ; move no. of columns (for 3rd loop)
            mov ax,0
      next3:
            mov al,matrix1[bp][si]
            mul matrix2[bp][di]
            mov ah,0
            add dx,ax
            inc si
            add di,ncol2;increment di with no of cols
            loop next3
            
            pop cx
            mov matrix3[bp][bx],dx
            inc bx
            inc bx
            mov dx,0
            sub si,ncol1
            mov ax,nrow2
            mul ncol2
            sub ax,1 
            sub di,ax ;subtract (nrow*ncol)-1 from di
            loop next2
            
            pop cx
            add si,ncol1
            mov di,0
            loop next1
      ret           
     matrix_mul endp ;end procedure
     
     
             
             
code ends
end start