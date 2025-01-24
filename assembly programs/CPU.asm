org 100h     
.model small
.stack 100h
.data
processQ db 'Enter how many processes: $'
processA db ? 
processNameQ db 'Enter the name of each process: $'
processNameA dd ? 
bursttimeQ db 'Enter the burst-time for each process in its order: $'
bursttimeA dd ?
priorityQ db 'Enter the priority for each process in its order: $'
priorityA dd ?
finalViewOfPriority dd ? 
firstAnswer db 'Priority Scheduling $'
secondAnswer db 'Priority Scheduling (Round-Robin) $'                                                      
                                                      
.code

main proc
    mov ax,@data
    mov ds,ax  
                    
                  
         
questionOne:            ; --------------- Part One -----------------------
; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h 
;----------------------    
    mov dx,offset processQ
    mov ah,0x9
    int 21h
    ;input
    mov ah,0x1
    int 21h 
    mov bl,al   
    cmp bl ,0x31
    jl questionOne      ;to check if the input is a number betweeen 1 - 9
    cmp bl,0x39               ;if not repeat the process again and again
    jg  questionOne      
                        
   ;store in an array 
    mov si,offset processA  
    mov [si],bl   ; input is in address of proccessA
    mov cl , bl
    sub cl,0x30 ; to solve the problem of counter below (to make for instance 2 which is 32 in asci  --> 2 ) 
     
                                   
                                    ;------------------------Part Two------------------
                                     
questionTwo:
; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h 
;----------------------     
    mov dx, offset processNameQ
    mov ah,0x9
    int 21h
       
    mov si , offset processNameA
        
processNameloop:       
    mov ah,0x1
    int 21h
    ;check if it is  a letter 
    cmp al ,0x61
    jl questionTwo      ;to check if the input is a number betweeen 1 - 9
    cmp al,0x7a               ;if not repeat the process again and again
    jg  questionTWo  
    ;----------------
    
    mov [si],al
    mov ah,2  ; make a space between every burst time
    mov dl, 0x20 
    int 21h
    inc si
    dec cl   ; decrement the number of processes
    cmp cl,0
    jne processNameloop ; jump the number of processes
     
                                   

  
                                     ;    --------------------- Part Three ----------------
    mov si,offset processA  
    mov bl,[si]   ; input is in address of proccessA
    mov cl , bl
    sub cl,0x30 ; to solve the problem of counter below (to make for instance 2 which is 32 in asci  --> 2 ) 
    

questionThree:
; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h 
;----------------------     
    mov dx, offset bursttimeQ
    mov ah,0x9
    int 21h
       
    mov si , offset bursttimeA
        
burstTimeLoop:       
    mov ah,0x1
    int 21h
    ;check if it is  a number 
    cmp al ,0x31
    jl questionThree      ;to check if the input is a number betweeen 1 - 9
    cmp al,0x39               ;if not repeat the process again and again
    jg  questionThree  
    ;----------------
    
    mov [si],al
    mov ah,2  ; make a space between every burst time
    mov dl, 0x20 
    int 21h
    inc si
    dec cl   ; decrement the number of processes
    cmp cl,0
    jne burstTimeLoop ; jump the number of processes
     
    
    
  ;                                   --------------------- Part Four ----------------  
    mov si,offset processA  
    mov bl,[si]   ; input is in address of proccessA
    mov cl , bl
    sub cl,0x30 ; to solve the problem of counter below (to make for instance 2 which is 32 in asci  --> 2 ) 
 
questionFour:
; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h 
;----------------------     
    mov dx, offset priorityQ
    mov ah,0x9
    int 21h
       
    mov si , offset priorityA
        
priorityLoop:       
    mov ah,0x1
    int 21h
    ;check if it is  a number 
    cmp al ,0x31
    jl questionFour      ;to check if the input is a number betweeen 1 - 9
    cmp al,0x39               ;if not repeat the process again and again
    jg  questionFour  
    ;----------------
    
    mov [si],al
    mov ah,2  ; make a space between every burst time
    mov dl, 0x20 
    int 21h
    inc si
    dec cl   ; decrement the number of processes
    cmp cl,0
    jne priorityLoop ; jump the number of processes 
    
   
; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h 
        
    mov dx, offset firstAnswer
    mov ah,0x9
    int 21h 

                      ;;;;; at this stage it will be just a test    i changed it to ch becuase i need cl



mov ax,0                  ;
mov si,offset processA     ;
mov bl,[si]                 ;
mov ch , bl                  ;
sub ch,0x30                   ;
mov cl,1                       ;
numberOfSwapLoop:               ;;;;  these are algorithem to check how many swap we need  , example(4,3,2,1)
mov bl,ch                      ;
sub bl,cl                     ;
add al,bl                    ;
inc cl                      ;
cmp ch,cl                  ;
jnl numberOfSwapLoop      ;  



;;; dynamic allocation to solve the problem of accessing every x,x+1,x+2,x+3  to be able of comparing priority



;;;                                                  end of dynamic allocation




    ; choosing the right process  according to its priority
    repeat:
    mov si,offset priorityA    
    mov bx,[si] 
    mov si,offset priorityA
    add si,2
    mov dx,[si]
    
    cmp al,0
    je afterOrdering
    cmp bl,bh  ;test
    jg firstSwap
    cmp bl,dl 
    jg secondSwap
    cmp bl,dh
    jg thirdSwap
    cmp bh,dl
    jg forthSwap
    cmp bh,dh
    jg fifthSwap 
    cmp dl,dh
    jg sixthSwap            
    jmp afterOrdering 
     
 
 
firstSwap: ; we are going to use it to prioritize our priority
xchg bl,bh 
dec al 

mov si,offset priorityA ;;test -------------
mov [si] , bx
add si,2
mov [si],dx          ; ---------------

jmp orderProcessesName1
                                          
                                          
secondSwap:
xchg bl,dl
;inc cl
dec al 

mov si,offset priorityA ;;test -------------
mov [si] , bx
add si,2
mov [si],dx          ; ---------------

jmp orderProcessesName2                                

  
thirdSwap:
xchg bl,dh
;inc cl
dec al 

mov si,offset priorityA ;;test -------------
mov [si] , bx
add si,2
mov [si],dx          ; ---------------

jmp orderProcessesName3 


forthSwap:
xchg bh,dl
;inc cl
dec al 

mov si,offset priorityA ;;test -------------
mov [si] , bx
add si,2
mov [si],dx          ; ---------------

jmp orderProcessesName4



fifthSwap:
xchg bh,dh
;inc cl
dec al 

mov si,offset priorityA ;;test -------------
mov [si] , bx
add si,2
mov [si],dx          ; ---------------

jmp orderProcessesName5



sixthSwap:
xchg dl,dh
;inc cl
dec al 

mov si,offset priorityA ;;test -------------
mov [si] , bx
add si,2
mov [si],dx          ; ---------------

jmp orderProcessesName6     
 
orderProcessesName1:     ;; so this function is used to link every name to its priority number             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; working func ;;;;;;;;;;;;;;;;;;;;;;
 mov si,offset processNameA    
 mov bx,[si]
 mov si,offset processNameA
 add si,2
 mov dx,[si]   
 xchg bl,bh 
mov si,offset processNameA    
mov [si] , bx
add si,2
mov [si],dx 
jmp orderBurstTime1 
 
orderProcessesName2:     
    mov si,offset processNameA    
    mov bx,[si] 
    mov si,offset processNameA
    add si,2
    mov dx,[si]
    xchg bl,dl
    
mov si,offset processNameA    
mov [si] , bx
add si,2
mov [si],dx 
jmp orderBurstTime2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
                                                                                                                                                             
orderProcessesName3:     
    mov si,offset processNameA    
    mov bx,[si] 
    mov si,offset processNameA
    add si,2
    mov dx,[si]
    xchg bl,dh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset processNameA    
mov [si] , bx
add si,2
mov [si],dx 
jmp orderBurstTime3
                                                                                                             
orderProcessesName4:     
    mov si,offset processNameA    
    mov bx,[si] 
    mov si,offset processNameA
    add si,2
    mov dx,[si]
    xchg bh,dl                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset processNameA    
mov [si] , bx
add si,2
mov [si],dx 
jmp orderBurstTime4                                                                                                               ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; stop here;;;;;;;;;;;;;;;;                                                                  
orderProcessesName5:     
    mov si,offset processNameA    
    mov bx,[si] 
    mov si,offset processNameA
    add si,2
    mov dx,[si]
    xchg bh,dh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset processNameA    
mov [si] , bx
add si,2
mov [si],dx 
jmp orderBurstTime5
orderProcessesName6:     
    mov si,offset processNameA    
    mov bx,[si]   
    mov si,offset processNameA
    add si,2
    mov dx,[si]
    xchg dl,dh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset processNameA    
mov [si] , bx
add si,2
mov [si],dx 
jmp orderBurstTime6    
      
 
orderBurstTime1: 
    mov si,offset bursttimeA    
    mov bx,[si]   
    mov si,offset bursttimeA
    add si,2
    mov dx,[si]
    xchg bl,bh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset bursttimeA    
mov [si] , bx
add si,2
mov [si],dx 
jmp repeat 

orderBurstTime2:     
    mov si,offset bursttimeA    
    mov bx,[si] 
    mov si,offset bursttimeA
    add si,2
    mov dx,[si]
    xchg bl,dl
                                            
mov si,offset bursttimeA    
mov [si] , bx
add si,2
mov [si],dx 
jmp repeat
orderBurstTime3:     
    mov si,offset bursttimeA    
    mov bx,[si] 
    mov si,offset bursttimeA
    add si,2
    mov dx,[si]
    xchg bl,dh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset bursttimeA    
mov [si] , bx
add si,2
mov [si],dx 
jmp repeat  
orderBurstTime4:     
    mov si,offset bursttimeA    
    mov bx,[si] 
    mov si,offset bursttimeA
    add si,2
    mov dx,[si]
    xchg bh,dl                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset bursttimeA    
mov [si] , bx
add si,2
mov [si],dx 
jmp repeat
orderBurstTime5:     
    mov si,offset bursttimeA    
    mov bx,[si] 
    mov si,offset bursttimeA
    add si,2
    mov dx,[si]
    xchg bh,dh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset bursttimeA    
mov [si] , bx
add si,2
mov [si],dx 
jmp repeat
orderBurstTime6:     
    mov si,offset bursttimeA    
    mov bx,[si]   
    mov si,offset bursttimeA
    add si,2
    mov dx,[si]
    xchg dl,dh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
mov si,offset bursttimeA    
mov [si] , bx
add si,2
mov [si],dx 
jmp repeat    
      
    
    
afterOrdering: 





 
 
 
 
     
mov si,offset processA  
mov bl,[si]   ; input is in address of proccessA
mov cl , bl
sub cl,0x30 ; to solve the problem of counter below (to make for instance 2 which is 32 in asci  --> 2 ) 

; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h   

;; display processes names according to its priority to show the final output    
    mov si ,offset priorityA      
testme: 
    ;space     
    mov dl, 0x20     
    mov ah,0x2  
    int 21h
    ;----   
    mov ah,0x2
    mov dl,[si]
    int 21h
    inc si  
    dec cl    
    cmp cl,0
    jne testme
      
 
 
 
 
 
 
 







mov si,offset processA  
mov bl,[si]   ; input is in address of proccessA
mov cl , bl
sub cl,0x30 ; to solve the problem of counter below (to make for instance 2 which is 32 in asci  --> 2 ) 

; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h   

;; display processes names according to its priority to show the final output    
    mov si ,offset processNameA      
processNameDisplayloop: 
    ;space     
    mov dl, 0x20     
    mov ah,0x2  
    int 21h
    ;----   
    mov ah,0x2
    mov dl,[si]
    int 21h
    inc si  
    dec cl    
    cmp cl,0
    jne processNameDisplayloop







    
     
   mov si,offset processA  
mov bl,[si]   ; input is in address of proccessA
mov cl , bl
sub cl,0x30 ; to solve the problem of counter below (to make for instance 2 which is 32 in asci  --> 2 ) 

; make newline and remove the unneeded space 
mov dl,0xa
mov ah,0x2 
int 21h 
mov dl,0xd
mov ah,0x2 
int 21h   

;; display processes names according to its priority to show the final output    
    
 mov si,offset bursttimeA    
    mov bx,[si] 
sub bl,0x30
sub bh,0x30     


add bh,bl
mov al,bh
mov [si],bx
    

mov si,offset bursttimeA
    add si,2
    mov dx,[si]  
sub dl,0x30
sub dh,0x30    
                
add dl,al
add dh,dl
mov [si], dx


mov si,offset bursttimeA  
mov bx,[si] 
;mov ah,0x2h
;mov dl,bl 
;int 21h          
;mov ah,0x2h
;mov dl,bh 
;int 21h                   

mov ax,0
mov al,bl
mov cx,10
div cl

;step 2 convert tens digit to ascii
add al,'0'
mov dl,al
mov dh,ah
mov ah,2
int 21h

;step 3 convert units digit to ascii
mov al,dh
add al,'0'
mov dl, al
mov ah,2
int 21h 

mov ah,0x2    ;;;;tap 
mov dl,09
int 21h     



mov ax,0
mov al,bh
mov cx,10
div cl

;step 2 convert tens digit to ascii
add al,'0'
mov dl,al
mov dh,ah
mov ah,2
int 21h

;step 3 convert units digit to ascii
mov al,dh
add al,'0'
mov dl, al
mov ah,2
int 21h

mov ah,0x2    ;;;;tap 
mov dl,09
int 21h 


mov si,offset bursttimeA  
    add si,2
    mov bx,[si]  
;mov ah,0x2h
;mov dl,al 
;int 21h          
;mov ah,0x2h
;mov dl,ah 
;int 21h 

mov ax,0
mov al,bl
mov cx,10
div cl

;step 2 convert tens digit to ascii
add al,'0'
mov dl,al
mov dh,ah
mov ah,2
int 21h

;step 3 convert units digit to ascii
mov al,dh
add al,'0'
mov dl, al
mov ah,2
int 21h

mov ah,0x2    ;;;;tap 
mov dl,09
int 21h 


mov ax,0
mov al,bh
mov cx,10
div cl

;step 2 convert tens digit to ascii
add al,'0'
mov dl,al
mov dh,ah
mov ah,2
int 21h

;step 3 convert units digit to ascii
mov al,dh
add al,'0'
mov dl, al
mov ah,2
int 21h
 
 
 
    
endPro:    
    
             
   
    
    
    
  mov ah,4Ch
  int 21h  
  main endp
end main
