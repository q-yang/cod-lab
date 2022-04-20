# Lab Material for Computer Architecture

This repository provides lab material for the course 
[Computer Architecture](https://elearning.szu.edu.cn/webapps/blackboard/execute/modulepage/view?course_id=_51748_1&cmp_tab_id=_75567_1&editMode=true&mode=cpview) at SZU. 
This lab is customized for the SZU course, which is an optional course for the
elite class in the College of Electronics and Information Engineering.

The lab is based on COD: [Computer Organization and Design: The Hardware Software Interface RISC-V Edition](https://www.amazon.com/Computer-Organization-Design-RISC-V-Architecture/dp/0128122757),
by David A. Patterson (Author), John L. Hennessy (Author).

To use this material you can: (1) just browse it online on GitHub,
(2) clone the repo to have all material offline (using it also
for your solutions), or (3) fork the repo (and clone locally), to be able to contribute back with changes.

**Contributions:** We are happily accepting contributions in the form of
pull requests. Even the fix of a small typo is appreciated.

## Lab Overview

The following list gives an overview of all lab sessions and assignments.


 * L01: [Lab 1](lab1)
 * L02: [Lab 2](lab2)
 * L03: [Lab 3](lab3)
 * L04: [Lab 4](lab4)

## Resources

### RISC-V Simulator

In our labs we will use the RISCV pipeline simulator Ripes.
Download it from [here](https://github.com/mortbopet/Ripes/releases).
No installation is required, however, enable the file's execute bit to make it executable.
<p align="center">
    <img src="./ripes_doc/resources/images/animation.gif?raw=true" />
</p>

### RISC-V Tools

For later lab exercises and your final project we need the full RISC-V toolchain, including a port of gcc. You can either install the toolchain using the instructions below, or you can download prebuilt binaries of all necessary tools from SiFive's Freedom Tools. Note that you must use the [August 2020 version](https://github.com/sifive/freedom-tools/releases/tag/v2020.08.0). Download the riscv64-unknown-elf-gcc version suited for your OS. 

#### Ubuntu (Linux)

Install the tools by running the following command in the terminal:
```bash
sudo apt install gcc-riscv64-linux-gnu
```

#### Windows

The same commands that are used for Ubuntu can be used under Windows
by using the Windows Subsystem for Linux (WSL).
Activate it and install Ubuntu by following the guide
[here](https://ubuntu.com/tutorials/ubuntu-on-windows#1-overview).

Now follow the instructions for Ubuntu above. 

#### macOS

Under macOS you need a packet manager.
[Homebrew](https://brew.sh/) is one of the popular ones.
After installing homebrew, install the RISC-V tool bew package from
[here](https://github.com/riscv-software-src/homebrew-riscv).

Note that the name of the compiler and tools on macOS will be slightly different:
```
riscv64-unknown-elf-gcc
```

#### Linker file

We need a linker file when compiling bare metal programs, particularly
for the final project. Create it in the $HOME directory by running the following command:
```
echo -e 'SECTIONS {\n.text :{*(*)}\n}' > $HOME/linker.ld
```

Test the installation by opening a terminal and starting the compiler with:
```
riscv64-linux-gnu-gcc
```

You should get an error, similar to following
```
riscv64-linux-gnu-gcc: fatal error: no input files
compilation terminated.
```
which is good as you know the the compiler is installed.
You are now prepared for all RISC-V based lab work and projects.

## Links

 * [The RISC-V Instruction Set Manual](https://riscv.org/specifications/)
 * [Venus RV32I simulator](https://kvakil.github.io/venus/)
 * [RISC-V Green Card](https://inst.eecs.berkeley.edu/~cs61c/fa17/img/riscvcard.pdf)
 * [RISC-V Tools (GNU Toolchain, ISA Simulator, Tests)](https://github.com/riscv/riscv-tools)
 * [Rocket Chip Generator (including the RISC- tools)](https://github.com/freechipsproject/rocket-chip)
 * [Wildcat RV32I simulator](https://github.com/schoeberl/wildcat)
 * [SPIM system calls](https://www.doc.ic.ac.uk/lab/secondyear/spim/node8.html)
 * [Bare metal program on spike](https://github.com/schoeberl/cae-examples)

### Other University Courses using RISC-V

 * [UC Berkeley: CS61C: Great Ideas in Computer Architecture (Machine Structures)](http://inst.eecs.berkeley.edu/~cs61c/fa17/)
 * [MIT: 6.175: Constructive Computer Architecture](http://csg.csail.mit.edu/6.175/index.html)
 * [Cornell: ECE 4750: Computer Architecture](http://www.csl.cornell.edu/courses/ece4750/2016f/)

### Some More (Unchecked) Links

 * [Eclipse plugin](https://gnu-mcu-eclipse.github.io/plugins/features/)
 * <https://stackoverflow.com/questions/31390127/how-can-i-compile-c-code-to-get-a-bare-metal-skeleton-of-a-minimal-risc-v-assemb>
 * [Assembler appendix from H&P](http://pages.cs.wisc.edu/~larus/HP_AppA.pdf)
 * [MARS docu](http://courses.missouristate.edu/KenVollmar/mars/CCSC-CP%20material/MARS%20Tutorial.doc)
 * [CS61C summer lab 3](http://www-inst.eecs.berkeley.edu/~cs61c/su17/labs/03/)
