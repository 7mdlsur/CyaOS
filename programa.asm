[org 0x7e00]

jmp entrarModoProtegido

%include "imprimir.asm"
%include "gdt.asm"
entrarModoProtegido:
    call EnableA20
    cli 
    lgdt[gdt_descriptor]
    mov eax,cr0 
    or eax,1
    mov cr0,eax 
    jmp codeseg:IniciarModoProtegido

EnableA20:
    in al,0x92
    or al,2
    out 0x92 al
    ret 
[bits 32]



IniciarModoProtegido:
    mov ax, dataseg
    mov ds, ax
    mov ss,ax
    mov es,ax
    mov fs,ax 
    mov gs,ax

    mov [0xb8000],byte 'H'
    mov [0xb8000],byte 'o'
    mov [0xb8000],byte 'l'
    mov [0xb8000],byte 'a'

    jmp $
    

times 2048-($-$$) db 0