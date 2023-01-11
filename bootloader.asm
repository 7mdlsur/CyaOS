[org 0x7c00]

mov [BOOT_D], dl 
mov bp, 0x7c00
mov sp,bp
call Leer

jmp ESPACIO


%include "imprimir.asm"
   
%include "leerdisco.asm"

times 510-($-$$) db 0

dw 0xaa55