
# sudo apt-get install g++ binutils libc6-dev-i386
# sudo apt-get install grub-legacy xorriso

GCCPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o



%.o: %.cpp
	gcc $(GCCPARAMS) -c -o $@ $<

%.o: %.s
	as $(ASPARAMS) -o $@ $<

bilepterosthree.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

bilepterosthree.iso: bilepterosthree.bin
	mkdir iso
	mkdir iso/boot
	mkdir iso/boot/grub
	cp bilepterosthree.bin iso/boot/bilepterosthree.bin
	echo 'set timeout=0'                      > iso/boot/grub/grub.cfg
	echo 'set default=0'                     >> iso/boot/grub/grub.cfg
	echo ''                                  >> iso/boot/grub/grub.cfg
	echo 'menuentry "BilepterOS v3.0" {' >> iso/boot/grub/grub.cfg
	echo '  multiboot /boot/bilepterosthree.bin'    >> iso/boot/grub/grub.cfg
	echo '  boot'                            >> iso/boot/grub/grub.cfg
	echo '}'                                 >> iso/boot/grub/grub.cfg
	grub-mkrescue --output=bilepterosthree.iso iso
	rm -rf iso

run: bilepterosthree.iso
	qemu-system-i386 $<
