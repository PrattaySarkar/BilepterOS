#include <stdio.h>

#include <kernel/tty.h>

void kernel_main(void) {
	terminal_initialize();
	printf("Waste of time :) BilepterOS v2.0-experiment");
}
