DATA SEGMENT
    MATRIX1 DB 01H,02H,03H    ;MATRIX1 INITIALIZED
            DB 04H,05H,06H    
            DB 07H,08H,09H
    MATRIX2 DB 03H,01H,03H    ;MATRIX2 INITIALIZED
            DB 06H,05H,04H
            DB 02H,02H,01H
    MATRIX3 DB 9 DUP(?)       ; MATRIX3 INITIALIZED WITH NULL
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START: MOV AX,DATA
           MOV DS,AX
           
           MOV AX,0
           MOV SI,0
           MOV DI,0
           MOV CX,3  ;CX INITIALIZED FOR EXTERNAL LOOP
    NEXT1: PUSH CX
           MOV CX,3  ;CX INITIALIZE FOR INTERNAL LOOP
                  
          
        NEXT:
              MOV AH,0
              MOV AH,MATRIX1[SI]
              ADD AH,MATRIX2[DI]
              MOV MATRIX3[DI],AH
              INC SI
              INC DI
        LOOP NEXT
    POP CX
    LOOP NEXT1
          
CODE ENDS
END START
            
