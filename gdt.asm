gdt_null:
    dd 0
    dd 0
gdt_descode:
   dw 0xFFFF
   dw 0x0
   db 0x0
   db 10011010b
   db 11001111b
   db 0x0
gdt_descdata:
   dw 0xFFFF
   dw 0x0000
   db 0x00
   db 10010010b
   db 11001111b
   db 0x0
gdt_end:

gdt_descriptor:
    gdt_size:
       dw gdt_end - gdt_null -1 
       dd gdt_null 
codeseg equ gdt_descode - gdt_null
dataseg equ gdt_descdata - gdt_null

[bits 32]

EditarGdt:
  mov [gdt_descode + 6 ],byte  11001111b
  mov [gdt_descdata + 6] ,byte 11001111b

  ret 

