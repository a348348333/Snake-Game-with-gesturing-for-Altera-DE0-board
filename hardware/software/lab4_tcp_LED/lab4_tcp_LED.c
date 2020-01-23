#include <stdio.h>
#include <stdlib.h>

#include <string.h>


#include "alt_types.h"
#include "altera_avalon_uart_regs.h"
#include "priv\alt_legacy_irq.h"

#include <unsitd.h>

#define UART_BASE UART0_BASE
#define UART_IRQ UART0_IRQ

static alt_u8 rxdata = 0;
static alt_u8 txdata = 0;
static char txbuf[30] = {0};
static char rxbuf[30] = {0};
volatile static alt_u16 led = 0x0000;

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
	static alt_u8 *rxptr = rxbuf;
	IORD_ALTERA_AVALON_UART_STATUS(UART_BASE);
	rxdata = IORD_ALTERA_AVALON_UART_RXDATA(UART_BASE);
	*rxptr++ = rxdata;
	if(rxdata == '\n'){
		*rxptr = '\0';
		printf("%s", rxbuf);
		char *datastr = strstr(rxbuf , "+IPD");
		if(datastr != NULL){
			char *delim = strstr (datastr, ":");
			int val = atoi(++delim);
			printf("%d", val);
			if(val >= 2048){
				val = 0x7FF;
			}
			IOWR(PIO_LED_BASE, 0, val);
			unsigned short ret = IORD(PIO_SW_BASE, 0) & 0x3FF;
			char sendcmd[25] = {0};
			sprintf(txbuf, "%d", ret);
			sprintf(sendcmd, "AT+CIPSEND=0,%d\r\n", strlen(txbuf));
			uart_write(sendcmd);
		}
		rxptr = rxbuf;
	}else if(rxdata == '>'){
		*rxptr = '\0';
		printf("%s", rxbuf);
		uart_write(txbuf);
		rxptr = rxbuf;
	}
}

void uart_init(){
	IOWR_ALTERA_AVALON_UART_STATUS(UART_BASE, 0);
	IOWR_ALTERA_AVALON_UART_CONTROL(UART_BASE, 0x80);
}

void startServer(){
	uart_write("AT+CIPMUX=1\r\n");
	usleep(500000);
	uart_write("AT+CIPSERVER=1,5566\r\n");
	usleep(500000);
	uart_write("AT+CIFSR\r\n");
	usleep(500000);
}

int main(){
	alt_irq_register(UART_IRQ, NULL, uart_isr);
	uart_init();
	startServer();
	while(1){
	}
	return 0;
}

