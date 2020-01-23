  //Example instantiation for system 'DE0_base1_sopc'
  DE0_base1_sopc DE0_base1_sopc_inst
    (
      .address_to_the_cfi_flash       (address_to_the_cfi_flash),
      .clk_0                          (clk_0),
      .clk_pllc0                      (clk_pllc0),
      .data_to_and_from_the_cfi_flash (data_to_and_from_the_cfi_flash),
      .locked_from_the_pll            (locked_from_the_pll),
      .phasedone_from_the_pll         (phasedone_from_the_pll),
      .read_n_to_the_cfi_flash        (read_n_to_the_cfi_flash),
      .reset_n                        (reset_n),
      .select_n_to_the_cfi_flash      (select_n_to_the_cfi_flash),
      .write_n_to_the_cfi_flash       (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram         (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram           (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram        (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram          (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram         (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram    (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram          (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram        (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram         (zs_we_n_from_the_sdram)
    );

