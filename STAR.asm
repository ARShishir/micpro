.MODEL SMALL
.STACK 100H
.DATA
MSG DB "ENTER VALUE AMONG (1-9): $"
VAR DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG
    MOV AH,09H
    INT 21H   
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV VAR,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV CX,0
    MOV CL,VAR
    MOV BL,1
    
    TOP:
    MOV CX,BX
   
   LEVEL1:
   CMP BL,VAR
   JG EXIT
   
   MOV AH,2
   MOV DL,'*'
   INT 21H
   
   LOOP LEVEL1
   INC BL 
   
   MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LOOP TOP
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN