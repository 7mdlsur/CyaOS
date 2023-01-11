[org 0x7e00]

jmp entrarModoProtegido



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
    out 0x92, al
    ret 
    
[bits 32]

%include "imprimir.asm"
%include "gdt.asm"
%include "CPUID.asm"
%include "paging.asm"
IniciarModoProtegido:
    mov ax, dataseg
    mov ds, ax
    mov ss,ax
    mov es,ax
    mov fs,ax 
    mov gs,ax

    mov [0xb8000],byte 'H'
    mov [0xb8002],byte 'o'
    mov [0xb8004],byte 'l'
    mov [0xb8006],byte 'a'
    
    call DetectarCPUID
    call DetectarLongMode
    call correrPaging
    call EditarGdt
    call codeseg:iniciar64bit
    
[bits 64]

[extern _iniciar]
iniciar64bit:
    mov edi, 0xb8000
    mov rax, 0x1f201f201f201f20
    mov ecx, 500 
    rep stosq 
    call _iniciar
    jmp $ 
times 2048-($-$$) db 0