# asmcalc
This is an x86-64 **Linux** simple calculator

# To compile:

1. Use NASM to create a `.o` file
```
nasm main.asm -f elf64
```
2. Use a linker (`ld`) to link files
```
ld main.o -o main
```

# Features:

1. Single-core program
2. Linux-based
3. Using registers `rbx`, `rbp`, `r12`, `rdx`, `r13` to avoid `syscall` interference
