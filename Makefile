DRIVER = keystone-driver.ko

ifneq ($(KERNELRELEASE),)
	keystone-driver-y := \
		keystone.o \
		keystone-page.o \
		keystone-ioctl.o \
		keystone-enclave.o
	obj-m += keystone-driver.o
else

PWD := $(shell pwd)
LINUXSRC := $(PWD)/../linux
CROSS_COMPILE ?= riscv-nuclei-linux-gnu-

default:
	$(MAKE) -C $(LINUXSRC) ARCH=riscv CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD)

endif

clean:
	rm -rvf *.o *.ko *.order *.symvers *.mod.c .tmp_versions .*o.cmd
