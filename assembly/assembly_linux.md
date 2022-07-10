# linux assembly

## nasm

[NASM - The Netwide Assembler](https://www.nasm.us/xdoc/2.15.05/html/nasmdoc0.html)

## doc

[Linux syscall过程分析](https://cloud.tencent.com/developer/article/1492374) 本文主要分析了Linux下的三种系统调用方式：int 0x80 ，sysenter 和 syscall.

[w3c school assembly](https://www.w3cschool.cn/assembly/assembly-structure.html) Assembly Language教程

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
[linux syscall table](https://x86.syscall.sh/)
[syscall table in linux source](https://elixir.bootlin.com/linux/v5.18.10/source/arch/x86/entry/syscalls) 

## notes

### register

16bit->32bit

* AX->EAX BX->EBX CX->ECX DX->EDX 通用寄存器
* SI->ESI DI->EDI 指针寄存器
* BP->EBP 基址寄存器
* SP->ESP 堆栈指针寄存器
* CS->CS 代码段
* DS->DS 数据段
* SS->SS 堆栈段
* ES->ES 附加段, 暂时段寄存器
* ->FS 32 bit 新段寄存器
* ->GS 32 bit 新段寄存器
* IP->EIP 指令指针寄存器. 当一条指令执行时，IP提前指向内存里的下一条指令


### 实模式和保护模式

实模式下，内存被限制为仅有1M字节(220 字节)。有效的地址从00000到FFFFF (十六进制)。这些地址需要用20位的数来表示。Intel通过利用两个16位数值来决定一个地址的方法来解决这个问题。开始的16位值称为段地址(selector)。

16位保护模式下, 一个段地址的值是一个指向描述符表的指针. 每一段都分配了一条描述符表里的条目。这个条目拥有系统想知道的关于这段的所有信息。这些信息包括：现在是否在内存中；如果在内存中，在哪；访问权限(例如： 只读)。段的条目的指针是储存在段寄存器里的段地址值。 段的大小依然限制为最大64K.

32位保护模式 偏移地址扩展成了32位, 段的大小也升至4G.  段可以分成较小的4K大小的单元，称为内存页。虚拟内存系统工作在页的方式下，代替了段方式。这就意味着一段在任何一个时刻只有部分可能在内存中。在286 16位保护模式下，要么整个段在内存中，要么整个不在.

