# linux assembly

## nasm

[NASM - The Netwide Assembler](https://www.nasm.us/xdoc/2.15.05/html/nasmdoc0.html)

## Example

### x86

[hello.asm](hello.asm)

```
nasm -f elf64 hello.asm
ld -o hello hello.o
./hello
```

### x86_64

[hello_64.asm](hello.asm)

```
nasm -f elf64 hello_64.asm
ld -o hello_64 hello_64.o
./hello_64
```

### list of Linux sys call 


## doc

[Linux syscall过程分析](https://cloud.tencent.com/developer/article/1492374) 本文主要分析了Linux下的三种系统调用方式：int 0x80 ，sysenter 和 syscall.

[linux syscall table](https://x86.syscall.sh/)

[syscall table in linux source](https://elixir.bootlin.com/linux/v5.18.10/source/arch/x86/entry/syscalls) 