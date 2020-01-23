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
		static short val = 0;
		val = rxData[0] << 8 | rxData[1];
		printf("ax: %f", (float) val / 16384.0);
		val = rxData[2] << 8 | rxData[3];
		printf("ay: %f", (float) val / 16384.0);
		val = rxData[4] << 8 | rxData[5];
		printf("az: %f", (float) val / 16384.0);
		val = rxData[8] << 8 | rxData[9];
		printf("gx: %f", (float) val / 131.0);
		val = rxData[10] << 8 | rxData[11];
		printf("gy: %f", (float) val / 131.0);
		val = rxData[12] << 8 | rxData[13];
		printf("gz: %f", (float) val / 131.0);
		printf("--------------------\n");
		usleep(500000);
	}
	return 0;
}
