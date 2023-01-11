[org 0x7c00]

mov [BOOT_D], dl 
mov bp, 0x7c00
mov sp,bp
mov bx,texto
call imprimir
call Leer

mov ah,0x0e
mov al,[ESPACIO]
int 0x10
jmp $

%include "imprimir.asm"
   
%include "leerdisco.asm"

times 510-($-$$) db 0

dw 0xaa55