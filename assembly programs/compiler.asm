; multi-segment executable file template.

data segment
    ; add your data here!
    question1 db "Enter your characters: $" 
    answer1 db ?
    state1 db "you are in state 1, and it is an end state$" 
    state2 db "you are in state 2,, and it is an end state$"
    state3 db "you are in state 3, and it is an end state $"
    state4 db "you are in state 4, and it is an end state $"
    state5 db "you are in state 5,and it is not an end state $"
    state6 db "you are in state 6,and it is not an end state $" 
    sta4andsta3 db "You have the potential to be in both state3 and state4,and both are end states $"
    invalidStatement db "undefined input$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ;  code 
            
   ; lea dx, question1;
   ; mov ah, 9         ;;  output the question 
   ; int 21h          ;  

startQ:    
    mov dl,offset question1 
    mov ah,0x9
    int 21h
     
    
    ;mov si,offset answer1
    mov ah,0x1    ;input
    int 21h
    cmp al,0x61   ;check if input is (a)
    je inputIsA
    cmp al, 0x62
    je inputIsB
    jmp startQ
    
    
    
inputIsA:    
 mov ah,0x1    ;input
 int 21h
 cmp al,0xD   ;check if input is (newline)
 je stateloop1
 cmp al,0x61   ;  check if input is (a)
 je inputIsA
 cmp al,0x62    ;check if input is (b) 
 je checkIfTerminate3
 
  


stateloop1:  
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h 
 mov dl,offset state1
 mov ah,0x9
 int 21h 
 jmp endProg
 
 checkIfTerminate3: 
 mov ah,0x1
 int 21h
 cmp al,0xD
 je stateloop2
 cmp al,0x62
 je checkIfSta4orSta5s1  ; i am checking if i will be in state four or five becuase both have bbb but state4 will be only bbb and state3 will be bbb...bb
 jmp  invalidInput
 
 
 checkIfSta4orSta5s1:
 mov ah,0x1
 int 21h
 cmp al,0xD
 je state4and3 
 cmp al,0x62
 je checkIfSta4orSta5s2  
 jmp  invalidInput 
 
 
 
  checkIfSta4orSta5s2:
 mov ah,0x1
 int 21h
 cmp al,0xD
 je state4and3 
 cmp al,0x62
 je checkIfSta4orSta5s3  
 jmp  invalidInput 
 
  checkIfSta4orSta5s3:
 mov ah,0x1
 int 21h
 cmp al,0xD
 je state4and3 
 cmp al,0x62
 je checkIfSta4orSta5s4 
 jmp  invalidInput 
 
  checkIfSta4orSta5s4:
 mov ah,0x1
 int 21h
 cmp al,0xD
 je  stateloop3
 cmp al,0x62
 je checkIfSta4orSta5s4  
 jmp  invalidInput
 
 stateloop3:  
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h 
 mov dl,offset state3
 mov ah,0x9
 int 21h 
 jmp endProg 
  
  
  state4and3: 
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h 
 
 mov dx,offset sta4andsta3
 mov ah,0x9
 int 21h     
 jmp endProg 
  
  
 
 stateloop2:    
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h 
 
 mov dl,offset state2
 mov ah,0x9
 int 21h     
 jmp endProg    
    
inputIsB:
 mov ah,0x1    ;input
 int 21h
 cmp al,0xD   ;check if input is (newline)
 je stateloop6
 cmp al,0x61   ;  check if input is (a)
 je checkIfTerminate1


stateloop6:
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h      ;
  
 mov dx,offset state6 
 mov ah,0x9
 int 21h    
 jmp endProg

checkIfTerminate1: 
 mov ah,0x1    ;input
 int 21h
 cmp al,0xD   ;check if input is (newline) 
 je  stateloop4b
 cmp al,0x62
 je checkIfTerminate2
 
 
checkIfTerminate2:
 mov ah,0x1    ;input  
 int 21h
 cmp al,0xD   ;check if input is (newline) 
 je  stateloop5b
 cmp al,0x62
 je  stateloop4b   ; ask if it will terminal do this if not 
 jmp checkIfTerminate2
 
 

stateloop5b:
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h
   
mov dl,offset state5
 mov ah,0x9
 int 21h     
 jmp endProg  
 
stateloop4b:  
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h 
 mov dl,offset state4
 mov ah,0x9
 int 21h     
 jmp endProg   
    
    
    
    
invalidInput:
 mov dx, 0xA  ;
 mov ah,0x2    ;new line 
 int 21h      ;  
 mov dx, 0xD  ;
 mov ah,0x2    ; remove unneeded space
 int 21h
 mov dx,offset invalidStatement
 mov ah,0x9
 int 21h   
    

endProg:    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
