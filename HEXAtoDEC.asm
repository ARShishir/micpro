 INCLUDE "EMU8086.INC"    
.MODEL SMALL
.STACK 100H
.DATA
MSG DB "ENTER A HEX DIGIT: $"
OUTPUT DB 10,13,'IN DECIMAL: $' 
ASK DB 10,13, 'DO YOU WANT ANOTHER INPUT? $'
TRY_MSG DB 10,13, 'TRY AGAIN. $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    TOP:
    LEA DX,MSG
    MOV AH,09H
    INT 21H 
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    CMP BL,30H
    JL TRY
    CMP BL,46H
    JG TRY 
    
    CMP BL,39H
    JLE DIGIT 
    
    LEA DX,OUTPUT
    MOV AH,9
    INT 21H
    
    SUB BL,11H
    MOV AH,2
    MOV DL,31H
    INT 21H
    MOV DL,BL
    INT 21H
     
     AGAIN: 
     LEA DX,ASK
     MOV AH,9
     INT 21H
     
     MOV AH,1
     INT 21H
     MOV BH,AL 
     
     MOV AH,2
     MOV DL,0AH
     INT 21H
     MOV DL,0DH
     INT 21H
     
     CMP BH,'Y'
     JE TOP
     CMP BH,'y'
     JE TOP
     JMP EXIT 
     
    DIGIT:
    LEA DX,OUTPUT
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    JMP AGAIN
    
    TRY:
    LEA DX,TRY_MSG
    MOV AH,9
    INT 21H
    
    PRINTN " " 
    JMP TOP  
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
      