INCLUDE Irvine32.inc
include macros.inc
BUFFER_SIZE = 501
;includelib winmm.lib


.data
menu1 byte "--            _____                   _____                    _____ ",0,
"--           /\    \                 /\    \                  /\    \          ",0
menu2 byte "--          /::\    \               /::\    \                /::\    \         ",0,
"--         /::::\    \             /::::\    \              /::::\    \        ",0
menu3 byte "--        /::::::\    \           /::::::\    \            /::::::\    \       ",0,
"--       /:::/\:::\    \         /:::/\:::\    \          /:::/\:::\    \      ",0
menu4 byte "--      /:::/__\:::\    \       /:::/__\:::\    \        /:::/  \:::\    \     ",0,
"--     /::::\   \:::\    \     /::::\   \:::\    \      /:::/    \:::\    \    ",0
menu5 byte "--    /::::::\   \:::\    \   /::::::\   \:::\    \    /:::/    / \:::\    \   ",0,
"--   /:::/\:::\   \:::\____\ /:::/\:::\   \:::\    \  /:::/    /   \:::\    \  ",0
m1 db "--  /:::/  \:::\   \:::|    /:::/  \:::\   \:::\____\/:::/____/     \:::\____\ ",0,
"--  \::/    \:::\  /:::|____\::/    \:::\  /:::/    /\:::\    \      \::/    / ",0
m2 db "--   \/_____/\:::\/:::/    / \/____/ \:::\/:::/    /  \:::\    \      \/____/  ",0,
"--            \::::::/    /           \::::::/    /    \:::\    \              ",0
m3 db "--             \::::/    /             \::::/    /      \:::\    \             ",0,
"--              \::/____/              /:::/    /        \:::\    \            ",0
m4 db "--               ~~                   /:::/    /          \:::\    \           ",0,
"--                                   /:::/    /            \:::\    \          ",0
m5 db "--                                  /:::/    /              \:::\____\         ",0,
"--                                  \::/    /                \::/    /         ",0
m6 db "--                                   \/____/                  \/____/          ",0,
"--            _____                    _____                    _____          ",0
m7 db "--           /\    \                  /\    \                  /\    \         ",0,
"--          /::\____\                /::\    \                /::\____\        ",0
m8 db "--         /::::|   |               /::::\    \              /::::|   |        ",0,
"--        /:::::|   |              /::::::\    \            /:::::|   |        ",0
m9 db "--       /::::::|   |             /:::/\:::\    \          /::::::|   |        ",0,
"--      /:::/|::|   |            /:::/__\:::\    \        /:::/|::|   |        ",0
m10 db "--     /:::/ |::|   |           /::::\   \:::\    \      /:::/ |::|   |        ",0,
"--    /:::/  |::|___|______    /::::::\   \:::\    \    /:::/  |::|   | _____  ",0
m11 db "--   /:::/   |::::::::\    \  /:::/\:::\   \:::\    \  /:::/   |::|   |/\    \ ",0,
"--  /:::/    |:::::::::\____\/:::/  \:::\   \:::\____\/:: /    |::|   /::\____|",0
m12 db "--  \::/    / ~~~~~/:::/    /\::/    \:::\  /:::/    /\::/    /|::|  /:::/    /",0,
"--   \/____/      /:::/    /  \/____/ \:::\/:::/    /  \/____/ |::| /:::/    / ",0
m13 db "--               /:::/    /            \::::::/    /           |::|/:::/    /  ",0,
"--              /:::/    /              \::::/    /            |::::::/    /   ",0
m14 db "--             /:::/    /               /:::/    /             |:::::/    /    ",0,
"--            /:::/    /               /:::/    /              |::::/    /     ",0
m15 db "--           /:::/    /               /:::/    /               /:::/    /      ",0,
"--          /:::/    /               /:::/    /               /:::/    /       ",0
m16 db "--          \::/    /                \::/    /                \::/    /        ",0,
"--           \/____/                  \/____/                  \/____/         ",0
pacman_chomp		db 'pacman-chomp.wav',0  
pacman_beginning	db 'pacman_beginning.wav',0  ; Replace with the actual path to your sound file

PlaySound PROTO,
pszSound:PTR BYTE,
hmod:DWORD,
fdwSound:DWORD

levelswitchto3 db 0

temp2 dw 0
lives db 3
pellethit db 0
naam db 18 dup(0) 
xval db 0
yval db 0

levelswitchto2 db 0
gx db 0
gy db 0

ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
press db 0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0
test2 db "this", 0
temp byte ?
wall db "|",0
floor db "_",0
level db 1
hit db 0
pellets db " . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",0
pellets2 db " . . . . . . . . . . . . .",0
pellets3 db " . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ",0


ghostx db 21 ,0

ghosty db 20 ,0
ghost db 'G',0

ghost2x db 24
ghost2y db 25


xg db 0
yg db 0

fruit db 'F',0
fruiteaten db 0
gcheck db 0

strScore BYTE "Your score is: ",0
score BYTE 0

xPos BYTE 22,0
yPos BYTE 25 ,0

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

; dh = height
; dl = width




buffer BYTE BUFFER_SIZE DUP(?)
filename     BYTE "output.txt",0
fileHandle   HANDLE ?
stringLength DWORD ?
bytesWritten DWORD ?
str1 BYTE "Cannot create file",0dh,0ah,0
str2 BYTE "Bytes written to file [output.txt]:",0
str3 BYTE "Enter up to 500 characters and press"
     BYTE "[Enter]: ",0dh,0ah,0










.code

gcheckset proc


    inc gcheck
    cmp gcheck, 10
    jge reset 
    ret



    reset:
    mov gcheck, 0


    ret
gcheckset endp


movecheck proc

    call gcheckset
    movzx ax, gcheck
    mov bl, 2
    div bl

    cmp ah, 1
   jne skip
    call moveghost

    skip:

    ret
movecheck endp


drawghost proc uses eax edx
    mov dl, ghostx
    mov dh, ghosty

    mov eax, yellow + (blue * 16)
    call settextcolor

    call gotoxy
    mov edx, offset ghost
    call writestring

   
   cmp level, 3
   jne returnzone

   mov dl, ghost2x
   mov dh, ghost2y
   call gotoxy
   mov edx, offset ghost
   call writestring



   returnzone:
   mov eax, yellow
   call settextcolor

ret
drawghost endp
updateghost proc

mov dl, ghostx
mov dh, ghosty

call gotoxy
mov eax, blue

call settextcolor
mov al, " "
call writechar

mov dl, xpos
mov dh, ypos
call gotoxy



ret
updateghost endp
ghostpellet proc uses edx eax

        mov temp, dh
        mov dh, ghosty
        cmp dh, 24
        jne after1

        mov edx, offset pellets
        movzx eax, ghostx
        dec eax
        dec eax
        add edx, eax
        mov al, [edx]
        cmp al, '.'
        jne after1
        
            mov eax, '.'
            mov [edx], al
            ;inc score


        after1:


        mov dh, temp

ret
ghostpellet endp

moveghost proc
    

    mov al, xpos
    mov xval, al
    mov al, ypos
    mov yval , al
    

    mov al, ghostx
    cmp xpos, al
    je verticalcheck

    cmp xpos, al
    jg ghostgoright

    cmp xpos, al
    jl ghostgoleft

    
    
    ghostgoright:
        mov al, ghostx
       mov xpos, al
       mov al, ghosty
       mov ypos, al
       mov hit, 0
       call rightcollision
       cmp hit, 1
       je verticalcheck
       ;je reset
       call updateghost
       inc ghostx
       CALL ghostpellet
       ;call drawghost
       comment &
       mov al, yval
       mov ypos, al
       mov al, xval
       mov xpos, al
       mov dl, xpos
       mov dh, ypos
       &
       ;call gotoxy
       mov hit, 0
       jmp reset


    ghostgoleft:
        mov al, ghostx
        mov xpos, al
        mov al, ghosty
        mov ypos, al
        mov hit, 0
        call leftcollision
        cmp hit, 1
        je verticalcheck
        ;je reset
        call updateghost
        dec ghostx
        call ghostpellet
        ;call drawghost
        comment &
        mov al, yval
        mov ypos, al
        mov al, xval
        mov xpos, al
        mov dl, xpos
        mov dh, ypos
        &
        ;call gotoxy
        mov hit, 0

        jmp reset


        

    
    verticalcheck:
    
        mov dh, ghosty
        cmp dh, yval
        jg godown
    
        cmp dh, yval
        jl goup

        
        

        cmp dl, xval
        je hitpoint1

        jmp reset

        cmp lives, 0
        jle gameoverscreen
        
        hitpoint1:
        ;dec lives
        jmp reset


        godown:
        mov al, ghostx
        mov xpos, al
        mov al, ghosty
        mov ypos, al
        mov hit,0
        call upcollision
        cmp hit, 1
        je reset
        call updateghost
        dec ghosty
        call ghostpellet
        ;call drawghost
        jmp reset

       
        
        goup:
        mov al, ghostx
        mov xpos, al
        mov al, ghosty
        mov ypos, al
        mov hit, 0
        call downcollision
        cmp hit, 1
        je reset
        call updateghost
        inc ghosty
        call ghostpellet
        ;call drawghost
        jmp reset


        
        ;resetting dl, dh and xpos, ypos
       
        reset:
        mov al, yval
       mov ypos, al
       mov al, xval
       mov xpos, al
       mov dl, xpos
       mov dh, ypos

       ;call gotoxy
       mov hit, 0
       ret
    
    
    ;mov dl, xpos
    ;mov dh, ypos

     ;  call gotoxy
    ;mov hit, 0
    ;mov al, ghosty
    ;cmp al, ypos
    ;je hitpoint







    hitpoint:


    endarea2:
    mov hit, 0
    ret

    gameoverscreen:


ret
moveghost endp


gameoverscreen proc
call clrscr
mov eax, black + (gray * 16)
call settextcolor



mwrite<"Game over">
mwrite<0ah, 0dh>

mwrite<"Your name - >">
mov edx, offset naam
call writestring 

mwrite<0ah,0dh>
movzx eax, score

mwrite<"your score ->">
call writedec


mov eax, blue

call settextcolor
mwrite<0ah,0dh>

call filemake

ret
gameoverscreen endp


filemake proc
; Create a new text file.
mov edx,OFFSET filename
call CreateOutputFile
mov fileHandle,eax
; Check for errors.
cmp eax, INVALID_HANDLE_VALUE ; error found?
jne file_ok
; no: skip
mov edx,OFFSET str1
; display error
call WriteString
jmp quit
file_ok:
; Ask the user to input a string.
;mov edx,OFFSET str3
; "Enter up to ...."
;call WriteString
;mov ecx,BUFFER_SIZE
; Input a string
;mov edx,OFFSET buffer
;call ReadString
;mov stringLength,eax
; counts chars entered
; Write the buffer to the output file.

mov edx, offset buffer
;add edx, 10
mov esi, offset naam

mov ecx, 16
loop1:
mov al, [esi]
mov [edx], al
inc esi
inc edx


loop loop1


mov al, score
mov [edx], al

mov eax,fileHandle
mov edx,OFFSET buffer
mov ecx,20
call WriteToFile
;mov bytesWritten,eax
; save return value
call CloseFile
; Display the return value.
mov edx,OFFSET str2
; "Bytes written"
;call WriteString
mov eax,bytesWritten
call WriteDec
;call Crlf
quit:
ret
filemake endp

upcollision proc
    mov dh, ypos
    mov dl, xpos
    
    mov hit, 0
    
   
    
    cmp dh, 11
    je check

    
    
    jmp part2

check:

    
    cmp dl, 7
    je hitpoint

    cmp dl, 8
    je hitpoint

    cmp dl, 9
    je hitpoint

    

part2:

    cmp dh, 21
    jne isfine
    
    
    
    cmp dl, 18
    je hitpoint

    cmp dl, 19
    je hitpoint

    cmp dl, 20
    je hitpoint

    ret
     

    hitpoint:
    mov hit, 1
    mov al, 9


    isfine:
    ;is fine for past two parts, third checking now

    cmp dh, 4
    jg extra

    cmp dl, 25
    jl extra

    cmp dl, 101
    jg extra

    mov hit, 1


    ret
   
    
    extra:

    ;wall 3
    cmp dl, 105
    jle wall5

    cmp dl, 108
    jg wall5

    cmp dh, 23
    jl wall5

    cmp dh, 25
    jge wall5

    mov hit, 1


    wall5:

    
    cmp dh, 27
    jne level2

    cmp dl, 42
    jl level2

    cmp dl, 78
    jg level2

    cmp level, 1
    ja level2
    mov hit, 1


    level2:
    cmp level, 1
    je retarea

    cmp dh, 23
    jne secondaryw

    cmp dl, 95
    jg level3

    cmp dl, 34
    jl level3

    mov hit,1
    jmp retarea
    
    
    
    secondaryw:
    cmp dh, 8
    jne level3
    
    cmp dl, 95
    jg level3

    cmp dl, 35
    jl level3

    mov hit, 1
    jmp retarea


    level3:
    retarea:
    
    ret



upcollision endp
ghosthit proc uses eax

    cmp level, 2
    jg ghost2also

    mov al, xpos
    cmp al, ghostx
    jne returnarea

    mov al, ypos
    cmp al, ghosty
    jne returnarea

    dec lives

ret 


    ghost2also:
    cmp al, ghost2x
    jne returnarea

    mov al, ypos

    cmp al, ghost2y
    jne returnarea

    dec lives
    ret

     
   

    returnarea:
    ret
ghosthit endp

downcollision proc
    mov hit, 0

    mov dl, xpos
    mov dh, ypos

    cmp dh,2
    jne endarea

    cmp dl, 7
    je hitpoint 

    cmp dl, 8
    je hitpoint


    cmp dl, 9
    je hitpoint

    cmp dl, 18
    je hitpoint

    cmp dl, 19
    je hitpoint

    cmp dl, 20
    je hitpoint

    jmp endarea


    hitpoint:
    mov hit, 1
    ret

    endarea:
    
    cmp dh, 2
    jne finalwall

    cmp dl, 105
    jle finalwall

    cmp dl, 108
    jg finalwall

    jmp hitpoint

    finalwall:
    cmp dh, 24
    jne retarea

    cmp dl, 42
    jl retarea

    cmp dl, 78
    jg retarea

    jmp hitpoint



    retarea:
    ;retarea for level 1, now for level 2
    cmp level, 1
    je level1done


    cmp dh, 20
    jne secondaryw 

    cmp dl, 34
    jl secondaryw

    cmp dl, 95
    jg secondaryw

    jmp hitpoint


    secondaryw:
    cmp dh, 5
    jne level3

    cmp dl, 34
    jl level3

    cmp dl, 94
    jg level3

    jmp hitpoint



    level3:

    level1done:
    ret
downcollision endp

leftcollision proc

    mov hit, 0
    mov dl, xpos
    mov dh, ypos

    cmp dl, 10
    jne part2

    cmp dh, 2
    jl endarea

    

    
    cmp dh, 9
    jg part2

    mov hit, 1

    
    part2:
        cmp dl, 21
        jne endarea

        cmp dh, 2
        jle endarea

        cmp dh, 21
        jge endarea

        mov hit, 1

        jmp endarea

     
        


    endarea:
    ;now adding for third shape
    cmp dh, 2
    jl finalzone

    cmp dh, 4
    jge finalzone

    cmp dl, 102
    jne finalzone
    
    mov hit, 1
    

    finalzone:
    ;now wall 4
    cmp dl, 104
    jle wall5

    cmp dl, 108
    jle wall5
    
    cmp dl, 109
    jg wall5

    cmp dh, 3
    jl wall5

    cmp dh, 24
    jge wall5

    mov hit, 1



    wall5:
    cmp dl , 79
    jne returnarea

    cmp dh, 24
    jle returnarea

    cmp dh, 26
    jg returnarea

    mov hit,1 



    returnarea:
    ;return area for level 1
    cmp level, 1
    je level1over

    cmp dl, 95
    jne secondaryw

    cmp dh, 6
    jl secondaryw

    cmp dh, 7
    jg secondaryw

    mov hit,1
    ret



    secondaryw:
    cmp dl, 96
    jne level2over

    cmp dh, 21
    jl level2over

    cmp dh, 22
    jg level2over

    mov hit,1 
    ret

    level1over:
    level2over:
    ret
leftcollision endp

rightcollision proc
    
    mov dl, xpos
    mov dh, ypos

    cmp dl, 6
    jne obj2
    
    cmp dh, 2
    jle endarea

    cmp dh, 11
    jge obj2
     
    mov hit ,1
    jmp endarea
    
    

    obj2:

        cmp dl, 17
        jne endarea

        cmp dh, 2
        jle endarea

        cmp dh, 21
        jge endarea

        mov hit, 1

        jmp endarea


    





    endarea:
    ;checking third shape
    
    cmp dl, 24
    jl finalzone

    cmp dl, 25
    jg finalzone

    cmp dh, 2
    jl finalzone

    cmp dh, 4
    jge finalzone

    mov hit,1 
    


    finalzone:
    ;checking for 4th space now
    cmp dl, 104
    jl wall5
    
    cmp dl, 106
    jge wall5

    cmp dh, 3
    jl wall5

    cmp dh, 24
    jge wall5

    mov hit, 1




    wall5:
        cmp dl, 41
        jne returnzone

        cmp dh, 25
        jl returnzone

        cmp dh, 27
        jge returnzone
        mov hit, 1
        ret

        hitpoint:
        mov hit,1
        ret

returnzone:
;return zone for level1
    cmp level, 1
    je level1over

    cmp dl, 34
    jne secondaryw

    cmp dh, 21
    je hitpoint

    cmp dh, 22
    je hitpoint
    
    ;secondarywall
    secondaryw:
    
    cmp dl, 34
    jne level1over

    cmp dh, 6
    je hitpoint

    cmp dh, 7
    je hitpoint





level1over:

    ret
rightcollision endp



drawmaze proc uses edx ecx eax
    mov eax, green
    call settextcolor

    mov dl, 7
    mov dh, 4
    mov ecx, 7
    mov temp, dh
    mov edx, offset test2
    
    vert1:
        
        
        mov dl, 7
        mov dh, temp
        call Gotoxy
        
        mov edx, offset wall
        call writestring
        inc temp

    loop vert1
    
    dec temp
    mov dl, 8
    mov dh, temp
    call gotoxy
    mov edx, offset floor
    call writestring

    mov temp, 4
    mov ecx,7
    vert2:
        
        
        mov dl, 9
        mov dh, temp
        call Gotoxy
        
        mov edx, offset wall
        call writestring
        inc temp

    loop vert2

    mov dl, 8
    mov dh, 3
    call gotoxy
    mov edx, offset floor
    call writestring



    mov temp, 4

    mov dl, 20
    mov dh, 4

    mov ecx, 17
    mov temp, dh
    ;mov edx, offset test2
    
    vert21:
        
        
        mov dl, 18
        mov dh, temp
        call Gotoxy
        
        mov edx, offset wall
        call writestring
        inc temp

    loop vert21
    
    dec temp
    mov dl, 19
    mov dh, temp
    call gotoxy
    mov edx, offset floor
    call writestring

    mov temp, 4
    mov ecx,17
    vert22:
        
        
        mov dl, 20
        mov dh, temp
        call Gotoxy
        
        mov edx, offset wall
        call writestring
        inc temp

    loop vert22

    mov dl, 19
    mov dh, 3
    call gotoxy
    mov edx, offset floor
    call writestring


    mov dl, 26
    mov dh, 2
    mov temp, dl
    mov ecx, 75
    hori11:
        mov dh, 2
        mov dl, temp
        call Gotoxy
        
        mov edx, offset floor
        call writestring
        inc temp


    loop hori11

     mov dl, 26
    mov dh, 3
    mov temp, dl
    mov ecx, 75
    hori12:
        mov dh, 3
        mov dl, temp
        call Gotoxy
        
        mov edx, offset floor
        call writestring
        inc temp


    loop hori12

    mov dl, 25
    mov dh, 3

    call gotoxy
    mov edx, offset wall
    call writestring

    mov dl, temp
    mov dh, 3
    call gotoxy
    mov edx, offset wall
    call writestring

    
    mov dl, 106
    mov dh, 4
    mov temp, dh
    mov ecx, 20
    wall4:
    mov dl, 106
    mov dh, temp
    call gotoxy
    mov edx, offset wall
    call writestring
    inc temp
    loop wall4

    mov dl, 108
    mov dh, 4
    mov temp, dh
    mov ecx, 20
    wall41:
    mov dl, 108
    mov dh, temp
    inc temp
    call gotoxy
    mov edx, offset wall
    call writestring
    loop wall41

    mov dl, 107
    mov dh, 3
    call gotoxy
    mov edx, offset floor
    call writestring

    dec temp
    mov dl, 107
    mov dh, temp
    call gotoxy
    mov edx, offset floor
    call writestring


    mov dl, 43
    mov dh, 25
    mov temp, dl
    mov ecx, 35
    loopzone:
        mov dh, 25
        mov dl, temp
        call gotoxy
        mov edx, offset floor
        call writestring
        inc temp
    loop loopzone

    mov dl, 43
    mov dh, 26
    mov temp, dl
    mov ecx, 35
    loopzone2:
    mov dh, 26
    mov dl, temp
    inc temp
    call gotoxy
    mov edx, offset floor
    call writestring

    loop loopzone2

    mov dl, 42
    mov dh, 26
    call gotoxy
    mov edx, offset wall
    call writestring


    ;dec temp
    mov dl, temp
    mov dh, 26
    call gotoxy
    mov edx, offset wall
    call writestring


    call drawpellets


    ret



drawmaze endp 


drawpellets proc uses eax edx
    mov eax, red
    call settextcolor
    mov dh, 24
    mov dl, 2
    call gotoxy
    mov edx, offset pellets
    call writestring

    call drawfruit
    
    cmp level, 1
    je finishit

    mov eax, red
    call settextcolor

    mov dh, 20
    mov dl, 23
    call gotoxy
    mov edx, offset pellets3
    call writestring
    ;all writestring



finishit:
ret
drawpellets endp

drawfruit proc

    cmp level, 1
    je retarea
    cmp fruiteaten, 1
    je retarea

    mov dh, 22
    mov dl, 113
    mov eax, green + (yellow * 16)
    call settextcolor
    call gotoxy
    mov edx, offset fruit
    call writestring

    retarea:

ret
drawfruit endp


menumaker proc
     
    mov eax, red
    call settextcolor
    mwrite <"Welcome to pac-man, please press g to start the game">
    mwrite <0ah, 0dh>
    mwrite <"Press I for instructions">
    mwrite<0ah,0dh>
    mwrite <"Press H for Help Screen">
    mwrite<0ah,0dh>
    startarea:
    
    mov dl, 5
    mov dh, 5
    mov temp, dh
    mov ecx, 0
    mov cx, 42
    mov ebx, offset menu1
    drawingloop:
        mov dh, temp
        mov dl, 5
        call gotoxy
        mov ebx, offset menu1
        mov edx, ebx
        mov esi, edx
        mov temp2, cx
        mov edi, 42
        sub di, temp2
        mov temp2, di
        mov ax, temp2
        mov bx, 80
        mul bx
        mov edx, esi
        add dx, ax
        mov eax, blue
        call settextcolor
        cmp ecx, 42
        je skip
            sub edx, 10
            
        skip:
        call writestring

        inc temp





    loop drawingloop


    call readChar
    mov press, al

    cmp al, 'g'
    je cont

    cmp al, 'i'
    je ints



    cmp al, 'h' 
    je helps
    
    jmp startarea




    cont:
        call clrscr
        ret 

    ints:
     call clrscr
     call instructions
     ret

     helps:
     call clrscr
     call helparea
     ret



menumaker endp
pelleteat proc uses eax

    mov dh, ypos
    mov dl, xpos


    ;cmp level, 1
    ;jne after1

    cmp dh, 24
    jne after1


    
    
    level1_check:
        mov edx, offset pellets
        movzx eax, xpos
        dec eax
        dec eax
        add edx, eax
        mov al, [edx]
        cmp al, '.'
        jne after1
        
            mov eax, ' '
            mov [edx], al
            inc score




    after1:
    cmp level, 1
    je retarea

    cmp dh, 22
    jne line2

    cmp dl, 113
    jne line2

    cmp fruiteaten, 1
    je retarea

    call gotoxy
    mwrite<" ">

    add score, 20
    mov fruiteaten, 1

    line2:

    cmp dh, 20
    jne retarea

    cmp dl, 23
    jl retarea
    cmp dl, 89
    jg retarea

    movzx eax, dl
    mov edx, offset pellets3
    sub eax, 23
    add edx, eax
    mov al, [edx]
        cmp al, '.'
        jne after1
        
            mov eax, ' '
            mov [edx], al
            inc score


    retarea:
    


    ret

pelleteat endp
helparea proc
    mov eax, red
    call settextcolor
    mwrite<"Welcome to the help section">
    mwrite<0ah,0dh,0ah,0dh>
    mwrite<"The rules are quite simple">
    mwrite<0ah,0dh>
    mwrite<"Go through the maze and eat pellets">
    mwrite<0ah,0dh>
    mwrite<"Press W to go up, S to go down">
    mwrite<0ah,0dh>
    mwrite<"A to go left and D to go right">
    mwrite<0ah,0dh>
    mwrite<"The pellets you can eat are shown as .">
    mwrite<0ah,0dh>
    mwrite<"Player is shown as -> X">
    mwrite<0ah,0dh>
    mwrite<"Walls cant be crossed ">
    mwrite<0ah,0dh,0ah,0dh>
    mwrite<0ah,0dh,0ah,0dh>
    mwrite<0ah,0dh,0ah,0dh>
    mwrite<"But most importantly, press i to go to the instructions">
    mwrite<"Press g to return to the game">


    presskey:
    call readchar
    mov press, al

    cmp al, 'g'
    je endarea

    cmp al, 'i'
    je instructionzone
    jmp presskey
    
    
    instructionzone:
        call clrscr
        call instructions
        ret

    endarea:
    call clrscr

ret
helparea endp

instructions proc 

    mov eax, black + (gray * 16)
    call settextcolor
    mwrite<"                                 Welcome to the Instruction Screen                                 ">;,0ah, 0dh
    mwrite<0ah, 0dh, 0ah, 0dh>
    mwrite<"Your goal is to eat pellets to gain scores and proceed to the next Screen">
    mwrite<0ah, 0dh, 0ah, 0dh>
    mwrite<"Avoid ghosts and try to eat fruits that drop randomly">
    mwrite<0ah, 0dh, 0ah, 0dh>
    mwrite<"To visit the help screen, press h, and press g to return to the game ">
    mwrite<0ah, 0dh, 0ah, 0dh>
    
   presskey:
    call readchar
   mov press, al 

   cmp al, 'g'
   je endarea
   cmp al, 'h'
   je helpar

   jmp presskey

   helpar:
   call clrscr
   mov eax, red
   call settextcolor
   call clrscr
   call helparea
   ret
   
   endarea:
   call clrscr
   mov eax, blue
   call settextcolor
   call clrscr
   ret
instructions endp

showcoords proc 

  
   
    mov dl, 80
    mov dh, 40
    call gotoxy
    mwrite<"g">

    movzx eax, ghostx

    call writedec

    mov dl, 80
    mov dh, 41
    call gotoxy
    movzx eax, ghosty
    call writedec

   mov temp, dl
   mov press, dh
    mov dl, 72
   mov dh, 40
   call gotoxy
   movzx eax,  xpos
   cmp eax, 10
   jae aboveone
   
   onedigit:
   call writedec 
   inc dl
   call gotoxy
   mwrite<" ">
   jmp heightwrite

   aboveone:
   cmp eax, 100
   jae three
   call writedec
   inc dl
   inc dl
   mwrite<" ">
   jmp heightwrite
   
   three:
   call writedec




   heightwrite:
   mov dl, 72
   mov dh, 42
   call gotoxy
   movzx eax,  ypos
   cmp eax, 10
   jae twoo

   call writedec 
   inc dl
   mwrite<" ">
   jmp endarea
   twoo:
   call writedec


   endarea:
   mov dl, temp
   mov dh, press

    ret
showcoords endp
pausemenu proc uses eax
    mov eax, red
    call settextcolor
    call clrscr
    mwrite<"Pause menu entered, press q to exit pause and m to go back to the menu", 0ah, 0dh>
    call readchar
    
    cmp al, 'm'
    je mpress

    cmp al, 'q'
    je endarea

    mpress:
    call clrscr
    call menumaker
    mov eax, blue
    call settextcolor
    call endingareawalls
    mov eax, white
    call settextcolor
    call drawmaze
    ret



    endarea:
    call clrscr
    mov eax, white
    call settextcolor
    call drawmaze
    mov eax, blue
    call endingareawalls
    
    ret



pausemenu endp 

livesdraw proc uses eax edx
    
     mov eax, red
    mov dl, 109
    mov dh, 0
    call gotoxy
    call settextcolor
    mwrite<"Lives -> ">
    movzx eax, lives
    call writedec

    mov eax, green
    call settextcolor

    mov dl, 50
    mov dh,0
    call gotoxy
    mwrite<"Level number ->">
    movzx eax, level
    call writedec

    

    mov eax, yellow 
    call settextcolor

    ret
livesdraw endp

endingareawalls proc
   
    call livesdraw


    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,27
    mov dh,2
    mov dl,0
    mov temp, dh

    l1:
    mov dh, temp
    mov dl, 0
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    loop l1
    comment &
        mov dh, 13
        mov dl, 50
        call Gotoxy
        mov edx, offset test2
        call writestring
    &
    mov ecx,27
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2


    ret
endingareawalls endp


playernamescreen proc uses eax edx

    mov eax, Green 

    call settextcolor
    call clrscr
    mov dl, 0
    mov dh, 25
    call gotoxy
    mwrite<"Enter your name here-> ",0adh,0dh>
    mwrite<0ah, 0dh>
    
    mov dl, 25
    mov dh, 27
    call gotoxy
    
    mov ecx, 20
    mov edx, offset naam
    call readstring

    mwrite<0ah,0dh>
    mov edx, offset naam



    ;call readchar

    call clrscr


ret
playernamescreen endp
levelcheck proc
    mov al, score
    cmp al, 100
    jge lvl3
    
    cmp al, 20
    jge lvl2


    ret

    lvl2:
    mov level , 2
    cmp levelswitchto2, 1
    je skipcall

    call level2drawing
    mov levelswitchto2, 1
    skipcall:


    ret

    lvl3:
    mov level, 3
    cmp levelswitchto3,1
    je skipcall
    call level3drawing
    
ret
levelcheck endp
level3drawing proc
call clrscr 

mwrite<"Level 3 starting">

mov ecx,17
loop1:
mov dl, 150
mov dh, 250
call gotoxy

mov edx, offset ghost
call writestring
loop loop1

call level2drawing
mov levelswitchto3, 1


ret
level3drawing endp
level2drawing proc


    call clrscr 
    mov dl, 0
    mov dh, 0
    call gotoxy
    mov eax, magenta

    mwrite<"Level 1 over! Good Work ">
    call readchar

    call clrscr
    call drawmaze
    call endingareawalls
    
    mov xpos, 8
    mov ypos, 14

    mov ghostx, 113
    mov ghosty , 15



    mov eax, magenta 
    call settextcolor
    mov dl, 36
    mov dh, 21
    call gotoxy
    mov ecx, 59

    mov temp, dl
    mov edx, offset floor
    line1hori:
    mov dh, 21
    mov dl, temp
    call gotoxy

    mov edx, offset floor
    call writestring 
    inc temp



    loop line1hori

    mov temp, 35
    mov ecx, 61
    line1hori2:
    mov dh, 22
    mov dl, temp
    call gotoxy

    mov edx, offset floor
    call writestring 
    inc temp



    loop line1hori2

    dec temp
    mov dl, temp
    mov dh, 22
    call gotoxy
    mov edx, offset wall
    call writestring

    mov dl, 35
    mov dh, 22
    call gotoxy
    mov edx, offset wall
    call writestring
    

    mov dl, 36
    mov dh, 6
    mov temp,dl
    mov ecx, 58
    line2hori1:
    mov dl, temp
    mov dh, 6
    call gotoxy
    mov edx, offset floor
    call writestring
    inc temp
    loop line2hori1

    mov dl, temp
    mov dh, 7
    call gotoxy
    mov edx, offset wall
    call writestring

     mov dl, 35
    mov dh, 7
    mov temp,dl
    mov ecx, 59
    line2hori2:
    mov dl, temp
    mov dh, 7
    call gotoxy
    mov edx, offset floor
    call writestring
    inc temp
    loop line2hori2

    mov dl,35
    mov dh, 7
    call gotoxy
    mov edx, offset wall
    call writestring

    



    ret
level2drawing endp
movecheck2 proc uses eax


cmp level, 2
jle returnarea
mov al, ghostx
mov gx, al
mov al, ghosty
mov gy, al

mov al, ghost2x
mov ghostx, al

mov al, ghost2y
mov ghosty, al
call movecheck


mov al, ghostx
mov ghost2x, al
mov al, ghosty
mov ghost2y, al


mov al, gx
mov ghostx, al
mov al, gy
mov ghosty, al
call movecheck
call drawghost


returnarea:
call movecheck
ret
movecheck2 endp


main PROC
    ;INVOKE PlaySound, OFFSET pacman_beginning, NULL,11   
    call menumaker
    
    ; draw ground at (0,29):
    call playernamescreen

    call DrawPlayer

    ;call CreateRandomCoin
    call DrawCoin

    ;call Randomize

    call DrawMaze
    call endingareawalls
    gameLoop:
    call levelcheck
        call livesdraw
        call drawpellets
        call drawghost
        call movecheck2
        call drawplayer
        cmp lives, 0
        je exitGame
       call showcoords
       call ghosthit
        ; getting points:
        mov hit, 0
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        inc score
        call CreateRandomCoin
        call DrawCoin
        notCollecting:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

        ; gravity logic:
        ;gravity:
        ;cmp yPos,27
        ;jg onGround
        ; make player fall:
        ;call UpdatePlayer
        ;inc yPos
        ;call DrawPlayer
        ;mov eax,80
        ;call Delay
        ;jmp gravity
        ;onGround:

        ; get user key input:
        ;call gcheckset
        call ReadChar
        mov inputChar,al
        cmp al, 'p'
        jne skipp
        call pausemenu
        
        skipp:
        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame
        
        cmp inputChar,"w"
        jne skipup
        call upcollision
        cmp hit, 1
        je skipup
        cmp ypos, 2
        jbe skipup
        jmp moveUp

skipup:

        
        cmp inputChar,"s"
        jne skip
        call downcollision
        cmp hit, 1
        je skip
        mov al, ypos
        
        cmp yPos, 27
        ja skip
        jmp moveDown
 ;skipdown:
 skip:

        cmp inputChar,"a"
        jne skipleft
        call leftcollision
        cmp hit, 1
        je skipleft
        cmp xpos, 1
        jbe skipleft
        jmp moveLeft
skipleft:
        cmp inputChar,"d"
        jne skipdown
        mov hit, 0
        call rightcollision
        cmp hit, 1
        je skipdown
        cmp xpos, 117   
        jae skipdown
        jmp moveRight

        jmp skipdown
        moveUp:
        ; allow player to jump:
        mov ecx,1
        jumpLoop:
            dec ypos
            call pelleteat
            inc ypos
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            ;call drawmaze
            mov eax,70
            call Delay
        loop jumpLoop
        jmp gameLoop

        moveDown:
        inc ypos
        call pelleteat
        dec ypos
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        ;call drawmaze
        jmp gameLoop

        moveLeft:
        dec xpos
        call pelleteat
        inc xpos
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        ;call drawmaze
        jmp gameLoop

        moveRight:
        inc xpos
        call pelleteat
        dec xpos
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        ;call drawmaze
        jmp gameLoop

       

    skipdown:
   ;skip:
   

   
   
    jmp gameLoop

    exitGame:
    call gameoverscreen
    exit
main ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

UpdatePlayer PROC
    
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

DrawCoin PROC
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"."
    call WriteChar
    ret
DrawCoin ENDP

CreateRandomCoin PROC
    mov eax,55
    inc eax
    call RandomRange
    cmp al, 0
    jne keepval
    inc al
    keepval:
    mov xCoinPos,al
    mov yCoinPos,27
    ret
CreateRandomCoin ENDP

END main