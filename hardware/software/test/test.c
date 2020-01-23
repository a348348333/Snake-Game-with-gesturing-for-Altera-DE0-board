#include "alt_types.h"
#include "sys/alt_stdio.h"
#include "io.h"
#include "system.h"
#include "sys/alt_cache.h"

#include"altera_avalon_spi.h"
#include"altera_avalon_spi_regs.h"

#include "sys/alt_irq.h"
#include <unistd.h>

int main(){
	int return_code;
	alt_u8 txData[2] = {0};
	alt_u8 rxData[15] = {0};

	txData[0] = 0x6B;
	txData[1] = 0x80;
	return_code = alt_avalon_spi_command(SPI0_BASE, 0, 2, txData, 0, rxData, 0);
	if(return_code < 0){
		alt_printf("ERROR SPI TX RET = %x \n", return_code);
	}
	usleep(1000);

	txData[0] = 0x75 | 0x80;
	return_code = alt_avalon_spi_command(SPI0_BASE, 0, 1, txData, 1, rxData, 0);
	if(return_code < 0)
		alt_printf("ERROR SPI TX RET = %x \n", return_code);
	usleep(1000);
	if(rxData[0] != 0x70){
		alt_printf("Test WHO_AM_I failed! rx: 0x%x\n", rxData[0]);
	}

	while(1){
		txData[0] = 0x3B | 0x80;

		return_code = alt_avalon_spi_command(SPI0_BASE, 0, 1, txData, 14, rxData, 0);

		if(return_code < 0)
			alt_printf("ERROR SPI TX RET = %x \n", return_code);
		static short val = 0, test_val = 0;
		val = rxData[0] << 8 | rxData[1];
		printf("ax: %f \n", (float) (val / 16384.0));

		test_val = rxData[2] << 8 | rxData[3];
		printf("ay: %f", (float) test_val / 16384.0);

		float n1 = val / 16384.0;
		unsigned short led = 0x10;

		if(n1 <0.039&& n1 > 0.02){
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < 0.3 && n1 > 0.1){
			led = 0x20;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < 0.5 && n1 > 0.39){
			led = 0x40;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < 0.7 && n1 > 0.5){
			led = 0x80;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < 0.8 && n1 > 0.7){
			led = 0x100;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < 0.9 && n1 > 0.8){
			led = 0x200;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < 1.3 && n1 > 0.9){
			led = 0x400;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < -0.3 && n1 > -0.4){
			led = 0x08;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < -0.4 && n1 > -0.5){
			led = 0x04;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < -0.5 && n1 > -0.6){
			led = 0x02;
			IOWR(PIO_LED_BASE, 0, led);
		}else if (n1 < -0.6 ){
			led = 0x01;
			IOWR(PIO_LED_BASE, 0, led);
		}





		printf("--------------------\n");
		usleep(500000);
	}
	return 0;
}
