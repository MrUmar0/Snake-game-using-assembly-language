.model small
.stack 100h
.data
ro1 db 0dh,0ah,"#####################"
ro2 db 0ah,0dh,"#* #    #X     *   *#"
ro3 db 0ah,0dh,"# #  # ##*#### # #  #"
ro4 db 0ah,0dh,"#   #  *     #  * * #"
ro5 db 0ah,0dh,"#  # # ### ####     #"
ro6 db 0ah,0dh,"# *              * *#"
ro7 db 0ah,0dh,"#####################$"  
nle db 0ah,0ah,0ah,0dh,"$"
msg db 0ah,0ah,0dh,"   Moves Left :$"
msg1 db "Game Start$" 
msg2 db "Game Over$"
msg3 db 0ah,0dh,"There is a wall$"
msg4 db 0ah,0ah,0dh,"Reach X, Enter Moves in w,s,a,d :$"
msg5 db 0ah,0ah,0dh,"You Reach the X You WIN THE GAME$"
hei db 1
wit db 3
mos db 54
.code
main proc
   mov ax,@data
   mov ds,ax
   
   lea dx,nle
   mov ah,09h
   int 21h  
   lea dx,msg1
   mov ah,09h
   int 21h
   mov ah,00h
   int 16h
   
   mov ro6[3],'y'
  Repeat: 
   dec mos
   lea dx,msg
   mov ah,09h
   int 21h 
   mov ah,0
   mov al,mos 
   mov bl,10
   div bl
   mov bl,ah
   add al,'0'
   add bl,'0'
   mov dl,al
   mov ah,02h
   int 21h 
   mov dl,bl
   mov ah,02h
   int 21h
   cmp mos,0
   je go            
   lea dx,nle
   mov ah,09h
   int 21h
   lea dx,ro1
   mov ah,09h
   int 21h
   cmp hei,5
   jne input
   cmp wit,11
   je win
  input: 
   lea dx,msg4
   mov ah,09h
   int 21h
   mov ah,01h
   int 21h
   cmp al,"w"
   je up
   cmp al,"s"
   je  dow
   cmp al,"a"
   je  lef
   cmp al,"d"
   je  rig
   jmp input
  
  
  up:   
   mov ah,0
   mov al,wit  
   cmp hei,5
   je wal
   cmp hei,4
   je heith4
   cmp hei,3
   je heith3
   cmp hei,2
   je heith2
   cmp hei,1
   je heith1
   heith4:
   lea di,ro3 
   add di,ax   
   mov [di],'*'
   lea si,ro2
   add si,ax
   cmp [si],'#'
   je uwal
   cmp [si],'*'
   je go
   mov [si],'y'  
   inc hei 
   jmp repeat  
   heith3:  
   lea di,ro4
   add di,ax
   mov [di],'*' 
   lea si,ro3
   add si,ax
   cmp [si],'#'
   je uwal
   cmp [si],'*'
   je go
   mov [si],'y'
   inc hei 
   jmp repeat
   heith2: 
   lea di,ro5
   add di,ax
   mov [di],'*' 
   lea si,ro4
   add si,ax 
   cmp [si],'#'
   je uwal
   cmp [si],'*'
   je go
   mov [si],'y'
   inc hei 
   jmp repeat
   heith1:
   lea di,ro6
   add di,ax
   mov [di],'*' 
   lea si,ro5
   add si,ax 
   cmp [si],'#'
   je uwal
   cmp [si],'*'
   je go
   mov [si],'y'
   inc hei       
   jmp repeat
   uwal:
   mov [di],'y' 
   jmp wal
    
   
  dow:   
   mov ah,0
   mov al,wit  
   cmp hei,5
   je dh5
   cmp hei,4
   je dh4
   cmp hei,3
   je dh3
   cmp hei,2
   je dh2 
   cmp hei,1
   je wal
   dh5:
   lea si,ro3 
   add si,ax    
   cmp [si],'*'
   je go
   cmp [si],'#'
   je uwal
   mov [si],'y'
   lea di,ro2
   add di,ax
   mov [di],'*'  
   dec hei 
   jmp repeat  
   dh4:  
   lea si,ro4
   add si,ax  
   cmp [si],'#'
   je uwal   
   cmp [si],'*'
   je go
   mov [si],'y' 
   lea di,ro3
   add di,ax
   mov [di],'*'
   dec hei 
   jmp repeat
   dh3: 
   lea si,ro5
   add si,ax
   cmp [si],'#'
   je uwal      
   cmp [si],'*'
   je go
   mov [si],'y' 
   lea di,ro4
   add di,ax 
   mov [di],'*'
   dec hei 
   jmp repeat
   dh2:
   lea si,ro6
   add si,ax
   cmp [si],'#'
   je uwal
   cmp [si],'*'
   je go  
   mov [si],'y' 
   lea di,ro5
   add di,ax 
   mov [di],'*'
   dec hei       
   jmp repeat      
     
      
  lef:   
   mov ah,0
   mov al,wit  
   cmp hei,5
   je lh5
   cmp hei,4
   je lh4
   cmp hei,3
   je lh3
   cmp hei,2
   je lh2 
   cmp hei,1
   je lh1 
   lh5:     
   lea si,ro2
   add si,ax 
   mov [si],'*'
   dec si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je lwal
   mov [si],'y'
   dec wit 
   jmp repeat  
   lh4:     
   lea si,ro3
   add si,ax 
   mov [si],'*'
   dec si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je lwal
   mov [si],'y'
   dec wit 
   jmp repeat 
   lh3:     
   lea si,ro4
   add si,ax 
   mov [si],'*'
   dec si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je lwal
   mov [si],'y'
   dec wit 
   jmp repeat    
   lh2:     
   lea si,ro5
   add si,ax 
   mov [si],'*'
   dec si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je lwal
   mov [si],'y'
   dec wit 
   jmp repeat    
   lh1:     
   lea si,ro6
   add si,ax 
   mov [si],'*'
   dec si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je lwal
   mov [si],'y'
   dec wit 
   jmp repeat       
   lwal: 
   inc si
   mov [si],'y'    
   jmp wal 
     
     
  rig:   
   mov ah,0
   mov al,wit  
   cmp hei,5
   je rh5
   cmp hei,4
   je rh4
   cmp hei,3
   je rh3
   cmp hei,2
   je rh2 
   cmp hei,1
   je rh1 
   rh5:     
   lea si,ro2
   add si,ax 
   mov [si],'*'
   inc si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je rwal
   mov [si],'y'
   inc wit 
   jmp repeat  
   rh4:     
   lea si,ro3
   add si,ax 
   mov [si],'*'
   inc si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je rwal
   mov [si],'y'
   inc wit 
   jmp repeat 
   rh3:     
   lea si,ro4
   add si,ax 
   mov [si],'*'
   inc si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je rwal
   mov [si],'y'
   inc wit 
   jmp repeat    
   rh2:     
   lea si,ro5
   add si,ax 
   mov [si],'*'
   inc si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je rwal
   mov [si],'y'
   inc wit 
   jmp repeat    
   rh1:     
   lea si,ro6
   add si,ax 
   mov [si],'*'
   inc si 
   cmp [si],'*'
   je go
   cmp [si],'#'
   je rwal
   mov [si],'y'
   inc wit 
   jmp repeat       
   rwal: 
   dec si
   mov [si],'y'    
   jmp wal 
    
    
   win:  
   
   lea dx,msg5
   mov ah,09h
   int 21h
    
   jmp exit         
     
   go:
   lea dx,msg2
   mov ah,09h
   int 21h 
   jmp exit 
   
   wal:
   lea dx,msg3
   mov ah,09h
   int 21h
   jmp repeat
   
   exit:
   mov ah,4ch
   int 21h
   main endp
end main