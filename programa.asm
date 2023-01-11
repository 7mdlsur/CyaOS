[org 0x7e00]

mov bx, funciona
call imprimir
jmp $
%include "imprimir.asm"

funciona:
   db 'estamos en espacio extendido',0
times 2048-($-$$) db 0