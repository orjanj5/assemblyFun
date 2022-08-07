# documentationLocations.md

## Author: Orjan Johansen
## Creation date: 07.08.2022
## Modified date: 

### Documentation locations
`man 2 [syscall]` - manual pages for syscalls
/usr/include/asm/unistd32.h - overview of syscalls IDs

### compiling
yasm -f elf32 -o [object filename] [asm filename] && ld -m elf_i386 -o [program filename] [object filename]
