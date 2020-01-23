#include "system.h"
#include "io.h"
#include <stdio.h>
#include <unistd.h>

int main(){
	unsigned short led = 0x01;
	while(1){
		IOWR(PIO_LED_BASE, 0, led);
		led <<= 1;
		if(led & 0x800)
			led = 0x01;
		usleep(100000);
	}
	return 0;
}
