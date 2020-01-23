module RamAndFlash(
	CLOCK_50,
	
	DRAM_CLK,
	DRAM_ADDR,
	DRAM_DQ,
	DRAM_BA_1,
	DRAM_BA_0,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CS_N,
	DRAM_UDQM,
	DRAM_LDQM,
	DRAM_RAS_N,
	DRAM_WE_N,
	
	FL_OE_N,
	FL_CE_N,
	FL_WE_N,
	FL_RST_N,
	FL_WP_N,
	FL_BYTE_N,
	FL_ADDR,
	FL_RY,
	FL_DATA,
	
	VGA_CLK,
	VGA_HS,
	VGA_VS,
	VGA_R,
	VGA_G,
	VGA_B,
	
	BTN,
	LED,
	SEG7,
	SW,
	RST,
	
		//PS2
	PS2_KBCLK,
	PS2_KBDAT,
	
	UART0_RX,
	UART0_TX,
	
	SPI_MISO,
	SPI_MOSI,
	SPI_CLK,
	SPI_SS,
	
	//mmc_spi
	MISO_to_the_mmc_spi,
	MOSI_from_the_mmc_spi,
	SCLK_from_the_mmc_spi,
	SS_n_from_the_mmc_spi,
	
	
);
	
input wire CLOCK_50;

output wire [11:0] DRAM_ADDR;
inout wire [15:0] DRAM_DQ;	
output wire DRAM_CLK;
output wire DRAM_BA_1;
output wire DRAM_BA_0;
output wire DRAM_CAS_N;
output wire DRAM_CKE;
output wire DRAM_CS_N;
output wire DRAM_UDQM;
output wire DRAM_LDQM;
output wire DRAM_RAS_N;
output wire DRAM_WE_N;

output wire [21:0] FL_ADDR;
inout wire 	[15:0] FL_DATA;
output wire FL_OE_N;
output wire FL_CE_N;
output wire FL_WE_N;
output wire FL_RST_N;
output wire FL_WP_N;
output wire FL_BYTE_N;
input wire FL_RY;

//vga

output VGA_CLK;
output VGA_HS;
output VGA_VS;
output [3:0] VGA_R;
output [3:0] VGA_G;
output [3:0] VGA_B;

//PIO
output wire [10:0] LED;
output wire [31:0] SEG7;
input wire [2:0]BTN;
input wire [9:0] SW;

//PS2
inout			PS2_KBCLK;
inout			PS2_KBDAT;

//UART0
input wire UART0_RX;
output wire UART0_TX;

//SPI
input wire SPI_MISO;
output wire SPI_MOSI;
output wire SPI_CLK;
output wire SPI_SS;
//mmc_spi
input wire MISO_to_the_mmc_spi;
output wire MOSI_from_the_mmc_spi;
output wire SCLK_from_the_mmc_spi;
output wire SS_n_from_the_mmc_spi;


wire	[1:0] SYNTHESIZED_WIRE_0;
wire	[1:0] SYNTHESIZED_WIRE_1;

assign DRAM_BA_1 = SYNTHESIZED_WIRE_0[1];
assign DRAM_BA_0 = SYNTHESIZED_WIRE_0[0];
assign DRAM_UDQM = SYNTHESIZED_WIRE_1[1];
assign DRAM_LDQM = SYNTHESIZED_WIRE_1[0];

wire system_reset_n;
assign system_reset_n = 1'b1;
assign FL_RST_N = system_reset_n;
assign FL_WP_N = 1'b1;
assign FL_BYTE_N = 1'b1;
wire FLASH_16BIT_IP_A0;

//Internal wire
wire [2:0] BTN_D;

//reset
input wire RST;

button_debouncer bd_btR(
	.clk(CLOCK_50),
	.rst_n(1'b1),
	.data_in(~BTN[0]),
	.data_out(BTN_D[0])
);

button_debouncer bd_btT(
	.clk(CLOCK_50),
	.rst_n(1'b1),
	.data_in(~BTN[1]),
	.data_out(BTN_D[1])
);

button_debouncer bd_btL(
	.clk(CLOCK_50),
	.rst_n(1'b1),
	.data_in(~BTN[2]),
	.data_out(BTN_D[2])
);

RamAndFlash_sopc	RamAndFlash_inst(
	.clk_0(CLOCK_50),
	//.reset_n(1'b1),
	.reset_n(RST),
	
	.clk_pllc0(DRAM_CLK),
	.zs_dq_to_and_from_the_sdram(DRAM_DQ),
	.zs_cas_n_from_the_sdram(DRAM_CAS_N),
	.zs_cke_from_the_sdram(DRAM_CKE),
	.zs_cs_n_from_the_sdram(DRAM_CS_N),
	.zs_ras_n_from_the_sdram(DRAM_RAS_N),
	.zs_we_n_from_the_sdram(DRAM_WE_N),
	.zs_addr_from_the_sdram(DRAM_ADDR),
	.zs_ba_from_the_sdram(SYNTHESIZED_WIRE_0),
	.zs_dqm_from_the_sdram(SYNTHESIZED_WIRE_1),
	
	.address_to_the_cfi_flash({FL_ADDR,FLASH_16BIT_IP_A0}),
	.data_to_and_from_the_cfi_flash(FL_DATA),
	.read_n_to_the_cfi_flash(FL_OE_N),
	.select_n_to_the_cfi_flash(FL_CE_N),
	.write_n_to_the_cfi_flash(FL_WE_N),
	
	//VGA
	.VGA_B_from_the_video_vga_controller(VGA_B),
	.VGA_CLK_from_the_video_vga_controller(VGA_CLK),
	.VGA_G_from_the_video_vga_controller(VGA_G),
	.VGA_HS_from_the_video_vga_controller(VGA_HS),
	.VGA_R_from_the_video_vga_controller(VGA_R),
	.VGA_VS_from_the_video_vga_controller(VGA_VS),
	
	//PIO
	.in_port_to_the_pio_btn0(BTN_D),
	.out_port_from_the_pio_led(LED),
  .out_port_from_the_pio_seg7(SEG7),
  .in_port_to_the_pio_sw(SW),
  
    //PS2
  .PS2_CLK_to_and_from_the_ps2_0		(PS2_KBCLK),
  .PS2_DAT_to_and_from_the_ps2_0		(PS2_KBDAT),
  
  //UART0
  .rxd_to_the_uart0(UART0_RX),
  .txd_from_the_uart0(UART0_TX),
  //mmc_spi
  .MISO_to_the_mmc_spi(MISO_to_the_mmc_spi),
  .MOSI_from_the_mmc_spi(MOSI_from_the_mmc_spi),
  .SCLK_from_the_mmc_spi(SCLK_from_the_mmc_spi),
  .SS_n_from_the_mmc_spi(SS_n_from_the_mmc_spi),
  
  .MISO_to_the_spi0(SPI_MISO),
  .MOSI_from_the_spi0(SPI_MOSI),
  .SCLK_from_the_spi0(SPI_CLK),
  .SS_n_from_the_spi0(SPI_SS)
);
endmodule
