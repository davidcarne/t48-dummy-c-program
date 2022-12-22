# Introduction

This repository contains an example C project targeting the T48 programmer board with a CH32V307 processor.

It also should runs on the CH32V307V-R1-1v0 eval board.

It will blink a LED on pin PC1 - which is connected to the `run` LED on the T48, or can be connected with a jumper on the eval board.

# Prerequisites

You'll need a RISCV32-IMAC toolchain. Options:

  - Build your own: https://github.com/riscv-collab/riscv-gnu-toolchain using args `--with-arch=rv32imac --with-abi=ilp32`
  - NixOS: Use `nix-shell riscv32-embedded-dev.nix`
  - Download a prebuilt one: https://xpack.github.io/riscv-none-elf-gcc/

# Building

Building should only require:
```
make
```
If it can't find the compiler, you may need to set the variable TRIPLE, to riscv32-unknown-elf (for xpack, for example)
```
TRIPLE=riscv32-unknown-elf make
```

# Flashing

If the CH32V307 is in bootloader mode (BOOT0 strapped high, BOOT1 strapped low), use [wchisp](https://github.com/ch32-rs/wchisp)
```
wchisp program obj.bin
```

# Ownership / Copyright

All files in the `vendor/` tree are copyright WCH; and are drawn from the example project provided within their "MounRiverStudio" toolchain. They applied Apache 2.0 license identifiers to the files, so all of the vendor files are believed to be licensed Apache 2.0
