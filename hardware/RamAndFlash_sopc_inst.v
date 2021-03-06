  //Example instantiation for system 'RamAndFlash_sopc'
  RamAndFlash_sopc RamAndFlash_sopc_inst
    (
      .MISO_to_the_mmc_spi                   (MISO_to_the_mmc_spi),
      .MISO_to_the_spi0                      (MISO_to_the_spi0),
      .MOSI_from_the_mmc_spi                 (MOSI_from_the_mmc_spi),
      .MOSI_from_the_spi0                    (MOSI_from_the_spi0),
      .PS2_CLK_to_and_from_the_ps2_0         (PS2_CLK_to_and_from_the_ps2_0),
      .PS2_DAT_to_and_from_the_ps2_0         (PS2_DAT_to_and_from_the_ps2_0),
      .SCLK_from_the_mmc_spi                 (SCLK_from_the_mmc_spi),
      .SCLK_from_the_spi0                    (SCLK_from_the_spi0),
      .SS_n_from_the_mmc_spi                 (SS_n_from_the_mmc_spi),
      .SS_n_from_the_spi0                    (SS_n_from_the_spi0),
      .VGA_B_from_the_video_vga_controller   (VGA_B_from_the_video_vga_controller),
      .VGA_CLK_from_the_video_vga_controller (VGA_CLK_from_the_video_vga_controller),
      .VGA_G_from_the_video_vga_controller   (VGA_G_from_the_video_vga_controller),
      .VGA_HS_from_the_video_vga_controller  (VGA_HS_from_the_video_vga_controller),
      .VGA_R_from_the_video_vga_controller   (VGA_R_from_the_video_vga_controller),
      .VGA_VS_from_the_video_vga_controller  (VGA_VS_from_the_video_vga_controller),
      .address_to_the_cfi_flash              (address_to_the_cfi_flash),
      .clk_0                                 (clk_0),
      .clk_pllc0                             (clk_pllc0),
      .clk_pllc1                             (clk_pllc1),
      .data_to_and_from_the_cfi_flash        (data_to_and_from_the_cfi_flash),
      .in_port_to_the_pio_btn0               (in_port_to_the_pio_btn0),
      .in_port_to_the_pio_sw                 (in_port_to_the_pio_sw),
      .locked_from_the_pll                   (locked_from_the_pll),
      .out_port_from_the_pio_led             (out_port_from_the_pio_led),
      .out_port_from_the_pio_seg7            (out_port_from_the_pio_seg7),
      .phasedone_from_the_pll                (phasedone_from_the_pll),
      .read_n_to_the_cfi_flash               (read_n_to_the_cfi_flash),
      .reset_n                               (reset_n),
      .rxd_to_the_uart0                      (rxd_to_the_uart0),
      .select_n_to_the_cfi_flash             (select_n_to_the_cfi_flash),
      .txd_from_the_uart0                    (txd_from_the_uart0),
      .write_n_to_the_cfi_flash              (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram                (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram                  (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram               (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram                 (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram                (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram           (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram                 (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram               (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram                (zs_we_n_from_the_sdram)
    );

