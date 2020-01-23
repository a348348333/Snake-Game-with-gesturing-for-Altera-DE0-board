/*
 * tco.c
 *
 *  Created on: 2018/5/25
 *      Author: pc01
 */

#include <stdio.h>
#include <stdlib.h>

#include <string.h>


#include "alt_types.h"
#include "altera_avalon_uart_regs.h"
#include "priv\alt_legacy_irq.h"

#define UART_BASE UART0_BASE
#define UART_IRQ UART0_IRQ

static alt_u8 rxdata = 0;

void uart_write(char *str){
	while(*str){
		while(!((IORD_ALTERA_AVALON_UART_STATUS(UART_BASE)&ALTERA_AVALON_UART_STATUS_TRDY_MSK)));
		IOWR_ALTERA_AVALON_UART_TXDATA(UART_BASE, *str);
		str++;
	}
}

void uart_putc(char ch){
	while(!((IORD_ALTERA_AVALON_UART_STATUS(UART_BASE)&ALTERA_AVALON_UART_STATUS_TRDY_MSK)));
	IOWR_ALTERA_AVALON_UART_TXDATA(UART0_BASE, ch);
}
void uart_isr(void *context, alt_u32 id)
{
	IORD_ALTERA_AVALON_UART_STATUS(UART_BASE);
	rxdata = IORD_ALTERA_AVALON_UART_RXDATA(UART_BASE);
	putchar(rxdata);
}

void uart_init(){
	IOWR_ALTERA_AVALON_UART_STATUS(UART_BASE, 0);
	IOWR_ALTERA_AVALON_UART_CONTROL(UART_BASE, 0x80);
}

int main(){
	alt_irq_register(UART_IRQ, NULL, (alt_isr_func) uart_isr);
	uart_init();
	char ch[30] = {0};
	while(1){
		scanf("%s", ch);
		strcat(ch, "\r\n\0");
		uart_write(ch);
	}
	return 0;
}


