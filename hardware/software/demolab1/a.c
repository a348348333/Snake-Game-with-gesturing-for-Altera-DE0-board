#include <stdlib.h>
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "system.h"
#include "sys/alt_irq.h"
#include "sys/alt_alarm.h"
#include "altera_avalon_pio_regs.h"
#include "io.h"

#define BTN_LEFT	0x04
#define BTN_MID		0x02
#define BTN_RIGHT	0x01
#define WIDTH	80
#define HEIGHT	60

static void btn_isr(void* context, alt_u32 id);
void set_background(alt_u8 side, alt_u8 color);
void flip_text();

alt_up_pixel_buffer_dma_dev *pixel_buf_dev;
alt_up_char_buffer_dev * char_buf_dev;

int main(){
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_BTN0_BASE, 0xf);

	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_BTN0_BASE, 0x7);

	if(alt_irq_register(PIO_BTN0_IRQ, 0, btn_isr)){
		printf("Interrupt setup failed\n");
		return 0;
	}

	pixel_buf_dev = alt_up_pixel_buffer_dma_open_dev("/dev/video_pixel_buffer_dma");
	char_buf_dev = alt_up_char_buffer_open_dev ("/dev/video_character_buffer_with_dma");
	alt_up_char_buffer_init(char_buf_dev);
	alt_up_char_buffer_clear(char_buf_dev);

	while(1);
	return 0;

}

static void btn_isr(void * context, alt_u32 id){
	static alt_u8 btn;
	static alt_u8 sw;
	btn = IORD_ALTERA_AVALON_PIO_EDGE_CAP(PIO_BTN0_BASE);
	sw = IORD(PIO_SW_BASE, 0) & 0xff;
	switch(btn){
		case BTN_RIGHT:
		case BTN_LEFT:
			set_background(btn, sw);
			break;
		case BTN_MID:
			flip_text();
			break;
		default:
			break;

	}
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_BTN0_BASE, btn);
}

void set_background(alt_u8 side, alt_u8 color){
	int x1 = (side == BTN_RIGHT ? WIDTH - 1: 0);
	int x2 = (side == BTN_RIGHT ? WIDTH / 2:WIDTH/2 -1);
	alt_up_pixel_buffer_dma_draw_box(pixel_buf_dev, x1, 0, x2, HEIGHT - 1, color, 0);
}

void flip_text(){
	static int is_show = 0;
	if(is_show == 0){
		alt_up_char_buffer_string(char_buf_dev, "This is an example of Color VGA.", 24, 28);
		alt_up_char_buffer_string(char_buf_dev, "=Micro-processor=", 30, 30);
		is_show = 1;
	}else{
		alt_up_char_buffer_clear(char_buf_dev);
		is_show = 0;
	}
}

