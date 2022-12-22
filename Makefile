TRIPLE?=riscv32-none-elf

BASEFLAGS= -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 $(OPTIM_OPTS) -ffunction-sections -fdata-sections -Os -ffreestanding -flto
CFLAGS=$(BASEFLAGS) -Ivendor
LDFLAGS=-nostartfiles -Wl,--gc-sections -Wl,--print-memory-usage -Wl,-Map,"$(PROJECT).map"

GCC=$(TRIPLE)-gcc
OBJCOPY=$(TRIPLE)-objcopy

all: obj.bin

obj.bin: obj.elf
	$(OBJCOPY) -O binary $< $@

obj.elf: main.o vendor/startup_ch32v30x_D8.S vendor/system_ch32v30x.o vendor/debug.o vendor/core_riscv.o vendor/ch32v30x_misc.o vendor/ch32v30x_gpio.o vendor/ch32v30x_rcc.o vendor/ch32v30x_usart.o
	$(GCC) $(LDFLAGS) -T vendor/Link.ld $^ -o $@

%.o: %.c
	$(GCC) $(CFLAGS) -c -o $@ $<

%.o: %.S
	$(GCC) $(CFLAGS) -c -o $@ $<

.PHONY: clean

clean: 
	find . '(' -name '*.o' -or -name '*.bin' -or -name '*.elf' ')' -exec rm {} ';'
	rm -f .map
