data hex to ascii hex converter in ASM by Michael Obinomen, for Prof. Kidd's CMSC313 class (10:00AM-11:15AM)

This is an assembly program that will take an input  buffer of hexadecimal numbers and output those numbers into terminal

hw11translate2Ascii.s is the file containing the assembly code
makefile is the makefile that has the specific build instructions

to compile and link the program, simply type "make". To run the program, type "make run". 
If you do not want to do that (or cannot do that), do the following:
    compile with "nasm -f elf32 -g -F dwarf -o hw11translate2Ascii.o hw11translate2Ascii.s"
    link with "ld -m elf_i386 -o hw11translate2Ascii hw11translate2Ascii.o"
