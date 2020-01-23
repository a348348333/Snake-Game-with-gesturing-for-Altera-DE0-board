#include<stdio.h>
#include<stdlib.h>
#include"system.h"
#include"altera_avalon_spi_regs.h"
#include"altera_avalon_pio_regs.h"
#include"alt_types.h"
#include "priv\alt_legacy_irq.h"
#include <unistd.h>

void spi_isr(void * context, alt_u32 id){
	static alt_u8 rxdata = 0;
	IORD_ALTERA_AVALON_SPI_STATUS(SPI0_BASE);
	rxdata = IORD_ALTERA_AVALON_SPI_RXDATA(SPI0_BASE);
	putchar(rxdata);
}

int main(void)
{
	alt_irq_register(SPI0_IRQ, NULL, spi_isr);
	IOWR_ALTERA_AVALON_SPI_STATUS(SPI0_BASE, 0);
	IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(SPI0_BASE, 1);
	IOWR_ALTERA_AVALON_SPI_CONTROL(SPI0_BASE, 0x80);

	char keyin;
	while(1){
		keyin = getchar();
		while(!(IORD_ALTERA_AVALON_SPI_STATUS(SPI0_BASE) & ALTERA_AVALON_SPI_STATUS_TRDY_MSK));
		IOWR_ALTERA_AVALON_SPI_TXDATA(SPI0_BASE, keyin);
		usleep(50000);
	}
	return 0;
}
