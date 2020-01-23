#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <string.h>

#include "alt_types.h"

#include "io.h"
#include "altera_up_avalon_ps2.h"
#include "altera_up_ps2_keyboard.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"

#include "system.h"
#include "sys/alt_irq.h"
#include "sys/alt_alarm.h"
#include "sys/alt_stdio.h"




#define BTN_LEFT	0x04
#define BTN_MID		0x02
#define BTN_RIGHT	0x01
#define WIDTH	80
#define HEIGHT	60

#define KEY_ENTER		0x5A
#define KEY_BACKSPACE	0x66
#define KEY_ESC			0x76

#define KEY_UP		0x1D
#define KEY_DOWN	0x1B
#define KEY_LEFT	0x1C
#define KEY_RIGHT	0x23


const int W = 52;
const int H  = 22;

char map[22][52];
alt_u8 key = 0;

int direct = 4;
int food[2] = {9,11};
int head;

int snake[400][3];
unsigned int get_x(alt_up_char_buffer_dev * char_buff, int position);
unsigned int get_y(alt_up_char_buffer_dev * char_buff, int position);
void add2charbuffer(alt_up_char_buffer_dev * char_buff, int position, char ch);
void del2charbuffer(alt_up_char_buffer_dev * char_buff, int position);
int next_line(alt_up_char_buffer_dev * char_buff, int position);

void init(char map[22][52], int snake[400][3]);
void makeMap(char map[22][52],int snake[400][3],int food[]);
void move(int snake[400][3],int direct);
void makeFood();
void showView(char map[22][52], alt_up_char_buffer_dev * char_buff, int);
int ifEat(int head, int food[2]);
int ifReprat(int snake[400][3], int x, int y);
int ifBump(int head);
//void getKey(alt_up_ps2_dev * keyboard_ps2 );

int num = 0;
int btime= 0;

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

	alt_up_char_buffer_dev * char_buff;
	char_buff = alt_up_char_buffer_open_dev ("/dev/video_character_buffer_with_dma");
	alt_up_char_buffer_init(char_buff);
	alt_up_char_buffer_clear(char_buff);

	alt_up_ps2_dev * keyboard_ps2 = alt_up_ps2_open_dev("/dev/ps2_0");
	keyboard_ps2 -> device_type = PS2_KEYBOARD;

	KB_CODE_TYPE decode_mode;
	char ascii;
	//int position = 0;
	//alt_u8 key = 0;
/*
	char max[40] = "Wellcom my racing game!";
	alt_up_char_buffer_string(char_buff, max, 1 , 1);
	char max1[40] = "Press any key to enter!";
	alt_up_char_buffer_string(char_buff, max1, 2 , 3);
*/
	init(map, snake);
	while(1){
		txData[0] = 0x3B | 0x80;
		return_code = alt_avalon_spi_command(SPI0_BASE, 0, 1, txData, 14, rxData, 0);
		static short val = 0, val1 = 0;

		val =( rxData[0] << 8 | rxData[1]);//ax
		val1 = rxData[2] << 8 | rxData[3];//ay

		float val_right_left = val / 16384.0;
		float val_up_down = val1 / 16384.0;
		if(val_right_left > 0.5){ //left
			if (direct != 4)
				direct = 3;
		}else if (val_right_left < -0.5){//right
			if (direct != 3)
				direct = 4;
		}else if (val_up_down > 0.6){ //down
			if (direct != 1)
				direct = 2;
		}else if (val_up_down < -0.6){//up
			if (direct != 2)
				direct = 1;
		}

		//printf("ax: %f \n", (float) (val_right_left));

		if(decode_scancode(keyboard_ps2, &decode_mode, &key, &ascii) == 0){
			switch (key) {
						case KEY_UP:
							if (direct != 2)
								direct = 1;
							break;
						case KEY_DOWN:
							if (direct != 1)
								direct = 2;
							break;
						case KEY_LEFT:
							if (direct != 4)
								direct = 3;
							break;
						case KEY_RIGHT:
							if (direct != 3)
								direct = 4;
							break;
					}
		}
		usleep(5000);
		move(snake, direct);
		if(!food[0] && !food[1]){
			makeFood(food);
		}
		makeMap(map, snake, food);
		alt_up_char_buffer_clear(char_buff);
		showView(map, char_buff, btime);
		btime++;
		if (ifBump(head)) {
			alt_up_char_buffer_clear(char_buff);
			char *c = "BOOOOMMMMM";
			c += head;
			alt_up_char_buffer_string(char_buff, c, (char_buff -> x_resolution)/2, (char_buff -> y_resolution)/2);
			printf("Game Over your money:%d", head);
			break;
		}
	}

/*
		//position = next_line(char_buff, position);
	do{
		if(decode_scancode(keyboard_ps2, &decode_mode, &key, &ascii) == 0){
			switch(key){
				case KEY_ENTER:
					position = next_line(char_buff, position);
					break;
				case KEY_BACKSPACE:
					del2charbuffer(char_buff, --position);
					break;
				case KEY_ESC:
					alt_up_char_buffer_clear(char_buff);
					position = 0;
					break;
				default:
					add2charbuffer(char_buff, position++, ascii);
			}
			while(decode_scancode(keyboard_ps2, &decode_mode, &key, &ascii) != 0);
		}
	}
	while(1);
	*/
	return 0;
}

void init(char map[22][52], int snake[400][3]) {
	snake[0][0] = 0, snake[0][1] = 9, snake[0][2] = 7;
	snake[1][0] = 0, snake[1][1] = 9, snake[1][2] = 8;
	snake[2][0] = 1, snake[2][1] = 9, snake[2][2] = 9;
	int i = 0;
	int j = 0;
	for (i = 0;i<H;i++) {
		for (j = 0;j<W;j++) {
			if (i == 0 || j == 0 || i == H - 1 || j == W - 1) {
				map[i][j] = '*';
			}
			else {
				map[i][j] = ' ';
			}
		}
	}
}

void showView(char map[22][52], alt_up_char_buffer_dev * char_buff, int btime) {
	int i = 0;
	int j = 0;
	int position = 0;
	for (i = 0;i<H;i++) {
		for (j = 0;j<W;j++) {
				//printf("%c", map[i][j]);
				position++;
				//if((map[i][j] == '*' || map[i][j] == ' ') && btime >= 1){
				//	continue;
				//}
				unsigned int x = get_x(char_buff, position);
				unsigned int y = get_y(char_buff, position);
				alt_up_char_buffer_draw(char_buff, map[i][j], x, y);
		}
		//printf("\n");

		unsigned int x = get_x(char_buff, position);
		position = position + (char_buff -> x_resolution) - x;
	}


}

void move(int snake[400][3],int direct) {
	int x, y;
	int i = 0;
	for (i = 0;i < 400;i++) {
		if (snake[i][0] == 1) {
			head = i;
			break;
		}
	}

	x = snake[head][1];
	y = snake[head][2];
	switch (direct){
		case 1:
			snake[head][1]--;
			break;
		case 2:
			snake[head][1]++;
			break;
		case 3:
			snake[head][2]--;
			break;
		case 4:
			snake[head][2]++;
			break;
	}

	if (ifEat(head, food)) {
		snake[head + 1][0] = 1, snake[head + 1][1] = food[0], snake[head + 1][2] = food[1];
		snake[head][0] = 0;
		food[0] = 0, food[1] = 0;
	}
	int j = head - 1;
		for (j = head - 1;j >= 0;j--) {
			int temp;
			temp = x, x = snake[j][1], snake[j][1] = temp;
			temp = y, y = snake[j][2], snake[j][2] = temp;
		}
}

void makeFood() {
	srand(time(0));
	int x = rand() % 49 + 2, y = rand() % 19 + 2;
	while (ifReprat(snake,x,y)) {
		x = rand() % 49 + 2, y = rand() % 19 + 2;
	}
	food[0] = y;
	food[1] = x;
}

void makeMap(char map[22][52], int snake[400][3], int food[]) {
	int i = 0;
	int j = 0;
	for (i = 0;i<H;i++) {
		for (j = 0;j<W;j++) {
			if (i == 0 || j == 0 || i == H - 1 || j == W - 1) {
				map[i][j] = '*';
			}
			else {
				map[i][j] = ' ';
			}
		}
	}
	for (i = 0;i < 400;i++) {
		if (snake[i][0] == 1) break;
		map[snake[i][1]][snake[i][2]] = '#';
	}

	map[snake[i][1]][snake[i][2]] = '@';
	map[food[0]][food[1]] = 'o';
}

int ifEat(int head,int food[2]) {
	if (snake[head][1] == food[0] && snake[head][2] == food[1])
		return 1;
	else
		return 0;
}

int ifReprat(int snake[400][3],int x,int y) {
	int i = 0;
	for (i = 0; i < 400;i++) {
		if (snake[i][0] == 1) break;
		if ((snake[i][1] == x&&snake[i][2] == y)) {
			return 1;
		}
	}
	return 0;
}

int ifBump(int head) {
		if ((snake[head][2]==0|| snake[head][2] == 51)  ||  (snake[head][1] == 0|| snake[head][1] == 21))
			return 1;
		int i = 0;
		for (i = 0; i < head-1; i++) {
			if ((snake[i][1] == snake[head][1]&&snake[i][2] == snake[head][2])) {
				return 1;
			}
		}
		return 0;
}



unsigned int get_x(alt_up_char_buffer_dev * char_buff, int position){
	return (position % (char_buff -> x_resolution));
}

unsigned int get_y(alt_up_char_buffer_dev * char_buff, int position){
	return (position / (char_buff -> x_resolution)) % char_buff -> y_resolution;
}

void add2charbuffer(alt_up_char_buffer_dev * char_buff , int position, char ch){
	unsigned int x = get_x(char_buff, position);
	unsigned int y = get_y(char_buff, position);

	printf("%c\n",ch);
	printf("%d\n",ch);
	int num = ch - '0';
	printf("%d\n",num);
	char abc = num + '0';
	printf("%c\n",abc);

	int ans = 50;



	alt_up_char_buffer_draw(char_buff, abc, x, y);

}

void del2charbuffer(alt_up_char_buffer_dev * char_buff, int position){
	unsigned int x = get_x(char_buff, position);
	unsigned int y = get_y(char_buff, position);
	alt_up_char_buffer_draw(char_buff, ' ',x, y);
}

int next_line (alt_up_char_buffer_dev * char_buff, int position){
	unsigned int x = get_x(char_buff, position);
	return position + (char_buff -> x_resolution) - x;
}

