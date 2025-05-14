; Michael Obinomen - CMSC_313 - 'Print out data in ascii hex'
global _start

section .text
_start:
    mov esi, inputBuf       ; source pointer
    mov edi, outputBuf      ; destination pointer
    mov ecx, inputLen       ; number of bytes to process
convert_loop:
    lodsb                   ; move esi pointer to al address
    mov ah, al              ; copy contents of al to ah
    shr al, 4               ; isolate the leftmost hex digit
    call convert_to_ascii   ; convert the leftmost hex digit
    stosb                   ; store left digit into edi
    mov al, ah              ; restore two digit hex to al
    and al, 0xF             ; mask leftmost hex digit 
    call convert_to_ascii   ; convert rightmost hex digit
    stosb                   ; store right digit into edi
    mov al, ' '             ; add a space after each byte
    stosb                   ; store the space into edi 
    loop convert_loop       ; loop until all the input values are parsed
newline:
    dec edi                 ; remove space at the end of output buffer
    mov byte [edi], 10      ; add a newline at the end of output buffer
done:
    mov eax, 4              ; syscall for 'write'
    mov ebx, 1              ; still don't know what this does
    mov ecx, outputBuf 
    sub edi, ecx            ; calculate length of output buffer
    mov edx, edi               
    int 80h                 ; make system call to write
    mov eax, 1              ; syscall for 'exit'
    mov ebx, 0              ; exit code 0
    int 80h
convert_to_ascii:
    cmp al, 9               ; if hex is <= 9, it gets an ascii value '1'-'9'
    jbe num             
    add al, 55              ; hex is not <= 9, so it gets an ascii value 'A'-'F'
    ret                     ; return to convert_loop
num:
    add al, '0'             ; add 30h to hex value to get numbers '1'-'9'
    ret                     ; return to convert_loop
section .data
inputBuf: db  0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
inputLen: equ $ - inputBuf

section .bss
outputBuf: resb 80
