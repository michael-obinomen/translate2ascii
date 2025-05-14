link: compile
	ld -m elf_i386 -o hw11translate2Ascii hw11translate2Ascii.o

compile: hw11translate2Ascii.s
	nasm -f elf32 -g -F dwarf -o hw11translate2Ascii.o hw11translate2Ascii.s

run:
	./hw11translate2Ascii
clean:
	rm *.o hw11translate2Ascii