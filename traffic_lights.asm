    .model	tiny
	.code
	ORG	100h          

    Main:
        #start=Traffic_Lights.exe#
    
        name "traffic"
    
    
        mov ax, all_red
        out 4, ax
    
    
        mov si, offset situation
        
        mov ax, 03
        int 10h
        
        ;Menu
        MOV    AH,  13h            
        MOV    AL,  1              
        MOV    CX,  4             
        MOV    BL,  00011111b      
        MOV    DL,  5               
        MOV    DH,  2               
        MOV    BP,  offset menu   
        INT    10h
        ;start
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  21              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  3               
        MOV    BP,  offset start   
        INT    10h
        ;options
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  34              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  4               
        MOV    BP,  offset options   
        INT    10h
         ;exit
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  32              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  5               
        MOV    BP,  offset exit   
        INT    10h 
       
       
       key: 
            mov ah,1           
            int 16h
            jz key    
            mov ah,0        
            int 16h     
            
            cmp ah,02h
            je clickOne
            cmp ah,0Bh
            je clickTwo
            cmp ah,0Ah
            je clickThree 
            ret
        
        
        option:
            mov ax, 03
            int 10h
           
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  30             
            MOV    BL,  00011111b      
            MOV    DL,  5               
            MOV    DH,  2               
            MOV    BP,  offset interval   
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  5               
            MOV    DH,  3               
            MOV    BP,  offset iOne   
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  14               
            MOV    DH,  3               
            MOV    BP,  offset iTwo  
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  24               
            MOV    DH,  3               
            MOV    BP,  offset iThree  
            INT    10h
           
            
            get_key:
                mov ah,1           
                int 16h
                jz get_key    
                mov ah,0        
                int 16h     
                
                cmp ah,02h
                je oneOpt
                cmp ah,03h
                je twoOpt
                cmp ah,04h
                je threeOpt
                jmp get_key
                
                one:
                  xor ax,ax
                  mov al,3
                  mov time,al
                  jmp Main  
                two:
                  xor ax,ax
                  mov al,5
                  mov time,al
                  jmp Main 
                three:
                  xor ax,ax
                  mov al,8
                  mov time,al
                  jmp Main     
                      
        start_program:
        
        xor ax,ax    
        
        mov ax, [si]
        out 4, ax
        
        ; wait 5 seconds (5 million microseconds)
         xor ax,ax
         xor bx,bx
         mov bx,10
         mov al,time
         mul bx
            
            
        mov     cx,ax   ;    004C4B40h = 5,000,000
        mov     dx, 0
        mov     ah, 86h
        int     15h 
        
        
        
        keyTwo: 
        mov ah,1           
        int 16h
        jz continue   
        mov ah,0        
        int 16h     
        
        cmp ah,02h
        je start_program
        cmp ah,0Bh
        je clickTwo
        cmp ah,0Ah
        je clickThree 
        continue:
        add si, 2 ; next situation
        cmp si, sit_end
        jb  start_program
        mov si, offset situation
          
        jmp start_program
        
        
        ;Tsvetocorektsiiz
        clickOne:
        ;start
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  21              
        MOV    BL,  00011110b       
        MOV    DL,  5               
        MOV    DH,  3               
        MOV    BP,  offset start   
        INT    10h
        ;options
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  34              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  4               
        MOV    BP,  offset options   
        INT    10h
         ;exit
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  32              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  5               
        MOV    BP,  offset exit   
        INT    10h 
        
        jmp start_program
        
        clickTwo:
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  21              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  3               
        MOV    BP,  offset start   
        INT    10h
        ;options
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  34              
        MOV    BL,  00011110b       
        MOV    DL,  5               
        MOV    DH,  4               
        MOV    BP,  offset options   
        INT    10h
         ;exit
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  32              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  5               
        MOV    BP,  offset exit   
        INT    10h
        
        mov     cx,2   ;    004C4B40h = 5,000,000
        mov     dx, 0
        mov     ah, 86h
        int     15h  
        
        jmp option 
        
         clickThree:
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  21              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  3               
        MOV    BP,  offset start   
        INT    10h
        ;options
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  34              
        MOV    BL,  00011111b       
        MOV    DL,  5               
        MOV    DH,  4               
        MOV    BP,  offset options   
        INT    10h
         ;exit
        MOV    AH,  13h             
        MOV    AL,  1               
        MOV    CX,  32              
        MOV    BL,  00011110b       
        MOV    DL,  5               
        MOV    DH,  5               
        MOV    BP,  offset exit   
        INT    10h
        
        mov     cx,2   ;    004C4B40h = 5,000,000
        mov     dx, 0
        mov     ah, 86h
        int     15h  
        
        jmp close
        
          oneOpt:
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011110b      
            MOV    DL,  5               
            MOV    DH,  3               
            MOV    BP,  offset iOne   
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  14               
            MOV    DH,  3               
            MOV    BP,  offset iTwo  
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  24               
            MOV    DH,  3               
            MOV    BP,  offset iThree  
            INT    10h
            
            mov     cx,2   ;    004C4B40h = 5,000,000
            mov     dx, 0
            mov     ah, 86h
            int     15h  
        
            jmp one
            
          twoOpt:
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  5               
            MOV    DH,  3               
            MOV    BP,  offset iOne   
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011110b      
            MOV    DL,  14               
            MOV    DH,  3               
            MOV    BP,  offset iTwo  
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  24               
            MOV    DH,  3               
            MOV    BP,  offset iThree  
            INT    10h
            
            mov     cx,2   ;    004C4B40h = 5,000,000
            mov     dx, 0
            mov     ah, 86h
            int     15h  
        
            jmp two
            
          threeOpt:
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  5               
            MOV    DH,  3               
            MOV    BP,  offset iOne   
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011111b      
            MOV    DL,  14               
            MOV    DH,  3               
            MOV    BP,  offset iTwo  
            INT    10h
            
            MOV    AH,  13h            
            MOV    AL,  1              
            MOV    CX,  7             
            MOV    BL,  00011110b      
            MOV    DL,  24               
            MOV    DH,  3               
            MOV    BP,  offset iThree  
            INT    10h
            
            mov     cx,2   ;    004C4B40h = 5,000,000
            mov     dx, 0
            mov     ah, 86h
            int     15h  
        
            jmp three
        ;                        FEDC_BA98_7654_3210
        situation        dw      0000_0011_0000_1100b
        s1               dw      0000_0110_1001_1010b
        s2               dw      0000_1000_0110_0001b
        s3               dw      0000_1000_0110_0001b
        s4               dw      0000_0100_1101_0011b
        sit_end = $
        all_red          equ     0000_0010_0100_1001b
        
        menu db "Menu"
        start db "Dla zapuska najmite 1"
        options db "Dla izmeneniia intervala najmite 0"
        exit db "Dla vixoda iz programi najmite 9"
        time db 5 
        interval db "Vibirite variant perecluchenia"
        iOne db "1)3 sec"
        iTwo db "2)5 sec"
        iThree db "3)8 sec"
        
        close:
        mov ax, all_red
        out 4, ax
    END Main