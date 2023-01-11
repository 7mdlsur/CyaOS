nasm bootloader.asm -f bin -o bootloader.bin 

nasm programa.asm -f bin -o programa.bin 

copy /b bootloader.bin+programa.bin bootloader.flp

pause