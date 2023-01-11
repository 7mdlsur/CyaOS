ESPACIO equ 0x7e00

Leer:
  mov ah,0x02
  mov bx, ESPACIO
  mov al,2
  mov dl,[BOOT_D] 
  mov ch,0x00
  mov dh,0x00
  mov cl,0x02

  int 0x13

  jc ERROR_READ
  ret 
BOOT_D:
   db 0 


ERROR_STRING:
   db 'Error en leer en disco' ,0 
ERROR_READ:
   mov bx, ERROR_STRING
   call imprimir  
   jmp $