data segment
    num dw 4     ; number whose factorial need to find  
    result dw ?  ; variable to store the result 
data ends

code segment 
    assume: ds:data cs:code
    
    start: mov ax,data
           mov ds,ax
          
           mov ax,01 ;initial condition
           call fact
           
           mov ah,4ch ; termination
           int 21h
          
           
         fact proc ; factorial procedure
            
            cmp num,0
            je done
            mul num
            dec num
            call fact ;recursive call of fact
             
          done: mov result,ax 
           
          ret  
         fact endp
code ends
end start