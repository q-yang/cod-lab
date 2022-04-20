# Lab 01

## Introduction to RISC-V ISA and the Ripes Simulator

The lab session uses the [Ripes RISC-V simulator](https://github.com/mortbopet/Ripes),
which is a visual computer architecture simulator and assembly code editor built for the RISC-V instruction set architecture.

After the lab you will have a good overview of the first RISC-V
instructions (RV32I).
You will be able to simulate small to medium size programs on a RISC-V
instruction set simulator.

## Usage of the Ripes

First of all, please download the latest version of the Ripes simulator from 
[Ripes Release Page](https://github.com/mortbopet/Ripes/releases) and make it work correctly.
Ripes may be used to explore concepts such as:

* How machine code is executed on a variety of microarchitectures (RV32IMC/RV64IMC based)
* How different cache designs influence performance
* How C and assembly code is compiled and assembled to executable machine code
* How a processor interacts with memory-mapped I/O

Before you start, go through the [Ripes Introduction](../ripes_doc/introduction.md) to learn the basic operation of this powerful simulator.


## A Minimal Assembler Program
#### (And How to Start Everything Off with Loading Constants)

Start by pasting following [minimal.s](./minimal.s) assembler program into Ripes,
in the Editor pane:
```asm
# As minimal RISC-V assembler example
addi x1, x0, 2
addi x2, x0, 3
add x3, x1, x2
```
Step through the code with the `Clock` button.
Watch how the register `x1`, `x2`, and `x3` change. Adding immediate values
to register `x0`, which is always 0, is one way to load constants (immediate values)
into registers. Loading immediate values is so basic to get a program started
that RISC-V defines a pseudo instruction, `li`, as a shortcut.
Enter following code into the editor and switch to the simulation pane.  
```asm
# minimal.s
# Use of pseudo instructions to load immediate values
li x1, 2
li x2, 3
add x3, x1, x2
```


RISC-V immediate values for ALU operations are 12-bit wide.
Try to use larger constants in your program (you can also use the 0xabcd
notion for hexadecimal values). What happens when the constant does
not fit into sign extended 12 bits?

Lookup the `lui` instruction in the [The RISC-V Instruction Set Manual](https://riscv.org/specifications/).

Why is immediate loading so fundamental?


## Computing with ALU Instructions

A computer can compute. "Of course!", you will say.
However, how do you compute on a RISC processor?

You compute with just a handful of instructions in the arithmetic logic unit (ALU).
Operations for ALU instructions are provided in registers and
the result is put into a register as well.

Locate all integer ALU instructions of RISC-V and explore them in the
simulator.

## Environment Calls: Talking to the World

Ripes contains a simulation of low level operating system functions. These system functions in RISC-V are invoked with the `ecall` instruction,
where `ecall` stands for _environment call_.
However, the concrete semantics of those functions is operating system
dependent.
Arguments to the system function are passed via the normal argument
register `a0` and `a7`, where `a7` contains the function code. Go through the 
document [Ripes ecall](../ripes_doc/ecalls.md) to learn all the supported environment calls by Ripes.
Explore the example [io.s](io.s) to print a variable's value and string.
You can use this simple print function for `printf` debugging.

## Assembler Directives

Beside instructions in assembler format, an assembler also accepts
so-called _assembler directives_. The code start is usually marked
with `.text`. You can initialize data in the data segment with `.data`.
Each assembler instruction can start with a label such as
`main`: or `loop:`.
This label can then be used as destination for a branch instruction.
Also data can be addressed by using a label. See below some examples:

```asm
# io.s
# Use ecall to print
# = poor man's debugger

.data
str: .string "hello, world!"

.text
li a0, 42
li a7, 1
ecall     # prints "42" to console

li a7, 11
ecall     # prints "*" to console (ASCII(42) = '*')

la a0, str
li a7, 4
ecall     # Prints "hello, world!" to console
```

Add a `main:` label to the start of your program and add following
instruction at the end of your program:

```
j main
```

What happens when you step through your code? What happens when
you press _Run_ 🤪?

## A RISC Machine is also Called a Load/Store Architecture

Operands for ALU instructions are always taken from registers and
the result is also put into registers in a RISC machine.
How can we then take operands from the memory or write results
into memory?

We need to use load and store instructions. That's why a RISC machine
is also called a load/store architecture.

Use a store instruction to store `0xdeadbeef` into the memory.
The simulator can display memory. Click on the _Memory_ field,
scroll down and _Jump to_ _Data_. The simulator choses to start
the data segment at `0x10000000`. Now write into that location
the `0xdeadbeef`.

How do you get that address into a register at first place?
Remember immediate values?

After storing that value into the main memory also read it back
into a register.

## Final Questions

Write the assembly code to calculate the addition of two complex numbers 1+2i and 3+4i,
and print its result into the console. The basic code is given in the following [complex_add.s](./complex_add.s),
please complete the code and show your result in Ripes.

```asm
# complex_add.s
# This example demonstrates an implementation of the addition of two
# complex numbers a = 1 + 2i, b = 3 + 4i. And print the result to the console.

.data
ar: .word 1 # Real part of a
ai: .word 2 # Imag. part of a
br: .word 3 # Real part of b
bi: .word 4 # Imag part of b
str: .string " + i* "

.text
main:
    ...
```

To summarize the lab try to answer the following questions:

* Can the computer execute an assembly instruction? 
* How does the computer know that a bit pattern is an instruction?
* How many bytes are used to store one instruction? 
* How can the computer jump to a symbolic label, such as it occurs in the instruction `j main`? 
* Which registers are affected by a jump instruction?
 
  





