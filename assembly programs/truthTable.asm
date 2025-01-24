org 100h
.model small
.stack 100h
.data
msg db 'Enter how many variables 2 or 3: $'           

msg2 db 'Enter the operation AND(2) or OR(3): $' 

ForT1 db 'Enter True or Flase for your first vairable: $'  

input1 db ?
                     
ForT2 db 'Enter True or Flase for your second vairable: $'                     

input2 db ?

torf db 'please enter True(t) or false(f): $' 

andor db ?                    
                     
.code

 main proc
    mov ax, @data
    mov ds,ax  ; ds => data segment 

inputnotvalid: 
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
                                         
    mov dx, offset msg 
    mov ah,9     ;9 in ah indicating output
    int 21h
    
     ;code for input
        
     mov ah,1 ;1 indicating input
     int 21h  
     mov bl,al  
     cmp bl , 0x32
     je keepmoving1
     cmp bl , 0x33
     je keepmoving1
     jmp inputnotvalid
       

keepmoving1:     
; for new line 
    mov dl, 10
    mov ah, 2
    int 21h  
    
 ; to remove the space 
 mov dl,13
 mov ah,2
 int 21h   
 
    
;-----------------------------------------------------
inputnotvalid2:  
     mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    
mov dx, offset msg2 
    mov ah,9     ; output
    int 21h     
      ;input   
     mov ah,1
     int 21h 
     mov bl,al  
     cmp bl , 0x32
     je keepmoving2
     cmp bl , 0x33  
     je keepmoving2
     jmp inputnotvalid2  

keepmoving2:
 mov si , offset andor    ; test        ---------------------------0000000000000000000000000000
 mov [si], bl              ;    test
    
; for new line 
    mov dl, 10
    mov ah, 2
    int 21h  
    
 ; to remove the space 
 mov dl,13
 mov ah,2
 int 21h  


       ;-------------------
     
     ;store input into array
     mov si,offset input1
     mov cx,4  
     
     lopinput1: 
     mov ah,01
     int 21h 
     cmp al, 0x66
     je  correctcheck1
     cmp al, 0x74
     je  correctcheck1 
     cmp al, 0x46
     je  correctcheck1
     cmp al, 0x54
     je  correctcheck1  
     jne invalidTF  
     
     
     
correctcheck1:     
     mov [si] , al
     inc si  
;to make space    
mov dl, 09
mov ah, 2
int 21h 
  
     
     loop lopinput1
                
 ;to make newline   
mov dl, 10
mov ah, 2
int 21h 
; to remove the space 
mov dl,13
mov ah,2
int 21h                
                
    mov si,offset input2
     mov cx,4  
     
     lopinput2: 
     mov ah,01
     int 21h
     mov [si] , al
     inc si  
;to make space    
mov dl, 09
mov ah, 2
int 21h 
 
     
     loop lopinput2     
     


mov si,offset andor
mov bl,[si]
cmp bl,0x33 
je orgate  
     
     
 ;----------------------------------------  comparing both inputs 
         mov bl ,0    
         
lopfortrueorfalse: 
         
         mov si , offset input1
           
         cmp bl , 0   
         mov bh ,bl ;; final version for the troubleshooting
         jg incsi1 
afterincsi1:         
          
         mov dl,[si]                     
        
         mov si , offset input2
          cmp bl , 0 
          mov bh ,bl ;;final version for the troubleshooting
          jg incsi2
afterincsi2:
                      
         mov cl,[si]
                    
                    
         ;; cmp cl,dl 
;mov dl, 10
;mov ah, 2
;int 21h   
       ;;  je  andlogic1
         jmp andlogic1
           
  
   ;to make new line    
            
                
 andlogic1:   
 mov  dh ,dl      ;test
 ;to make space  

mov dl, 09
mov ah, 2
int 21h 
 
 ;cmp dh,   ;test
           
 cmp cl, 0x46
 je  andlogic2
 cmp cl, 0x66
 je  andlogic2
 cmp dh, 0x46
 je  andlogic2
 cmp dh, 0x66
 je  andlogic2             
              
 
              
 mov dl ,'t'     
 mov ah ,02h
 int 21h              
 
 inc bl  
 mov cl , 4
 sub cl,bl
 jnz lopfortrueorfalse
 jmp endPr 
 
 andlogic2: 
 mov dl, 09
mov ah, 2
int 21h 
       
 mov dl , 'f'     
 mov ah ,02h
 int 21h 
 
 inc bl      
 mov cl , 4
 sub cl,bl
 jnz lopfortrueorfalse
 jmp endPr 
    
     
 ;--------------------------------------------------------
         
  
                                    
      

incsi1:
inc si  
dec bh            ;;; final version for the troubleshooting
jnz incsi1  ;;final version for the troubleshooting

jmp afterincsi1
;-------         
incsi2:
inc si  

dec bh            ;;;final version for the troubleshooting
jnz incsi2  ;;final version for the troubleshooting

jmp afterincsi2  
 
;----- 
invalidTF:
mov dx,offset torf
mov ah,9
int 21h  
jmp lopinput1   


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

orgate:



 ;----------------------------------------  comparing both inputs 
         mov bl ,0    
         
lopfortrueorfalseor: 
         
         mov si , offset input1
           
         cmp bl , 0   
         mov bh ,bl ;; final version for the troubleshooting
         jg incsi1or 
afterincsi1or:         
          
         mov dl,[si]                     
        
         mov si , offset input2
          cmp bl , 0 
          mov bh ,bl ;;final version for the troubleshooting
          jg incsi2or
afterincsi2or:
                      
         mov cl,[si]
                    
                    
         ;; cmp cl,dl 
;mov dl, 10
;mov ah, 2
;int 21h   
       ;;  je  andlogic1
         jmp andlogic1or
           
  
   ;to make new line    
            
                
 andlogic1or:   
 mov  dh ,dl      ;test
 ;to make space  

mov dl, 09
mov ah, 2
int 21h 
 
 ;cmp dh,   ;test
           
 cmp cl, 0x54
 je  andlogic2or
 cmp cl, 0x74
 je  andlogic2or
 cmp dh, 0x54
 je  andlogic2or
 cmp dh, 0x74
 je  andlogic2or             
              
 
              
 mov dl ,'f'     
 mov ah ,02h
 int 21h              
 
 inc bl  
 mov cl , 4
 sub cl,bl
 jnz lopfortrueorfalseor
 jmp endPr 
 
 andlogic2or: 
 mov dl, 09
mov ah, 2
int 21h 
       
 mov dl , 't'     
 mov ah ,02h
 int 21h 
 
 inc bl      
 mov cl , 4
 sub cl,bl
 jnz lopfortrueorfalseor
 jmp endPr 
    
     
 ;--------------------------------------------------------
         
  
                                    
      

incsi1or:
inc si  
dec bh            ;;; final version for the troubleshooting
jnz incsi1or  ;;final version for the troubleshooting

jmp afterincsi1or
;-------         
incsi2or:
inc si  

dec bh            ;;;final version for the troubleshooting
jnz incsi2or  ;;final version for the troubleshooting

jmp afterincsi2or  
 
;----- 
invalidTFor:
mov dx,offset torf
mov ah,9
int 21h  
jmp lopinput1


    
endPr:    
 ret