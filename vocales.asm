;ENSAMBLADOR PARA 8086
;CONTAR LAS VOCALES EN UN VECTOR DE CARACTERES
;JEFERSONURIELHC@UFPS.EDU.CO
;POR JEFERSON HERNANDEZ

.MODEL SMALL
PILA SEGMENT STACK
    DW 64 DUP(?)
PILA ENDS
DATOS SEGMENT     
    LENGTH_VECTOR = 21
    LENGTH_VOCALES = 5
    VECTOR DB 'voluntas omnia superat','$'
    VOCALES DB 48,48,48,48,48,'$'
    
    MENSAJE_A DB 'VOCAL A => ','$'
    MENSAJE_E DB 'VOCAL E => ','$'
    MENSAJE_I DB 'VOCAL I => ','$'
    MENSAJE_O DB 'VOCAL O => ','$'
    MENSAJE_U DB 'VOCAL U => ','$'
    MENSAJE_VECES DB ' VECES',10,13,'$'		  

    AUX DB 13,'$'
DATOS ENDS                  
CODIGO SEGMENT
ASSUME CS:CODIGO, DS:DATOS, SS:PILA
MAIN: 
    MOV AX,DATOS
    MOV DS,AX  
   

    MOV CX,LENGTH_VECTOR           
    LEA SI, VECTOR
    CICLO:
    CMP CX,0
    JE FIN
        MOV AL,VECTOR[SI]
        INC SI  
        CMP AL,'a'
        JE A
        CMP AL,'A'
        JE A
        CMP AL,'e'
        JE E
        CMP AL,'E'
        JE E
        CMP AL,'i'
        JE I
        CMP AL,'I'
        JE I 
        CMP AL,'o'
        JE O
        CMP AL,'O'
        JE O
        CMP AL,'u'
        JE U
        CMP AL,'U'
        JE U
    LOOP CICLO        
        JMP  FIN
    A:     
        MOV AL,VOCALES[0]
        INC AL
        MOV VOCALES[0],AL
        JMP CICLO
                 
    E:  
        MOV AL,VOCALES[1]
        INC AL
        MOV VOCALES[1],AL
        JMP CICLO
    I:      
        MOV AL,VOCALES[2]
        INC AL
        MOV VOCALES[2],AL
        JMP CICLO
    O:     
        MOV AL,VOCALES[3]
        INC AL
        MOV VOCALES[3],AL
        JMP CICLO
    U:   
        MOV AL,VOCALES[4]
        INC AL
        MOV VOCALES[4],AL
        JMP CICLO
    FIN:

    ;CANTIDAD DE VECES QUE ESTA LA VOCAL A
    MOV DX,OFFSET MENSAJE_A
    MOV AH,09H
    INT 21H 
    
    MOV AL,VOCALES[0] 
    MOV AUX,AL    
    MOV DX,OFFSET AUX  
    MOV AH,09H
    INT 21H   
              
    MOV DX,OFFSET MENSAJE_VECES
    MOV AH,09H
    INT 21H
          

    ;CANTIDAD DE VECES QUE ESTA LA VOCAL E
    MOV DX,OFFSET MENSAJE_E
    MOV AH,09H
    INT 21H 
    
    MOV AL,VOCALES[1] 
    MOV AUX,AL    
    MOV DX,OFFSET AUX  
    MOV AH,09H
    INT 21H   
              
    MOV DX,OFFSET MENSAJE_VECES
    MOV AH,09H
    INT 21H

    ;CANTIDAD DE VECES QUE ESTA LA VOCAL I
    MOV DX,OFFSET MENSAJE_I
    MOV AH,09H
    INT 21H 
    
    MOV AL,VOCALES[2] 
    MOV AUX,AL    
    MOV DX,OFFSET AUX  
    MOV AH,09H
    INT 21H   
              
    MOV DX,OFFSET MENSAJE_VECES
    MOV AH,09H
    INT 21H

    ;CANTIDAD DE VECES QUE ESTA LA VOCAL O
    MOV DX,OFFSET MENSAJE_O
    MOV AH,09H
    INT 21H 
    
    MOV AL,VOCALES[3] 
    MOV AUX,AL    
    MOV DX,OFFSET AUX  
    MOV AH,09H
    INT 21H   
              
    MOV DX,OFFSET MENSAJE_VECES
    MOV AH,09H
    INT 21H
     
    ;CANTIDAD DE VECES QUE ESTA LA VOCAL U
    MOV DX,OFFSET MENSAJE_U
    MOV AH,09H
    INT 21H 
    
    MOV AL,VOCALES[4] 
    MOV AUX,AL    
    MOV DX,OFFSET AUX  
    MOV AH,09H
    INT 21H   
              
    MOV DX,OFFSET MENSAJE_VECES
    MOV AH,09H
    INT 21H  
        
    ;TERMINA EL PROGRAMA Y LE DEVUELVE EL CONTROL AL SISTEMA OPERATIVO
    MOV AX,4C00H
    INT 21H
CODIGO ENDS
END MAIN
