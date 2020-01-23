//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2018 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc_clock_0_in_arbitrator (
                                                // inputs:
                                                 RamAndFlash_sopc_clock_0_in_endofpacket,
                                                 RamAndFlash_sopc_clock_0_in_readdata,
                                                 RamAndFlash_sopc_clock_0_in_waitrequest,
                                                 clk,
                                                 cpu_instruction_master_address_to_slave,
                                                 cpu_instruction_master_dbs_address,
                                                 cpu_instruction_master_latency_counter,
                                                 cpu_instruction_master_read,
                                                 reset_n,

                                                // outputs:
                                                 RamAndFlash_sopc_clock_0_in_address,
                                                 RamAndFlash_sopc_clock_0_in_byteenable,
                                                 RamAndFlash_sopc_clock_0_in_endofpacket_from_sa,
                                                 RamAndFlash_sopc_clock_0_in_nativeaddress,
                                                 RamAndFlash_sopc_clock_0_in_read,
                                                 RamAndFlash_sopc_clock_0_in_readdata_from_sa,
                                                 RamAndFlash_sopc_clock_0_in_reset_n,
                                                 RamAndFlash_sopc_clock_0_in_waitrequest_from_sa,
                                                 RamAndFlash_sopc_clock_0_in_write,
                                                 cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in,
                                                 cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in,
                                                 cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in,
                                                 cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in,
                                                 d1_RamAndFlash_sopc_clock_0_in_end_xfer
                                              )
;

  output  [ 22: 0] RamAndFlash_sopc_clock_0_in_address;
  output  [  1: 0] RamAndFlash_sopc_clock_0_in_byteenable;
  output           RamAndFlash_sopc_clock_0_in_endofpacket_from_sa;
  output  [ 21: 0] RamAndFlash_sopc_clock_0_in_nativeaddress;
  output           RamAndFlash_sopc_clock_0_in_read;
  output  [ 15: 0] RamAndFlash_sopc_clock_0_in_readdata_from_sa;
  output           RamAndFlash_sopc_clock_0_in_reset_n;
  output           RamAndFlash_sopc_clock_0_in_waitrequest_from_sa;
  output           RamAndFlash_sopc_clock_0_in_write;
  output           cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in;
  output           cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in;
  output           cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in;
  output           cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in;
  output           d1_RamAndFlash_sopc_clock_0_in_end_xfer;
  input            RamAndFlash_sopc_clock_0_in_endofpacket;
  input   [ 15: 0] RamAndFlash_sopc_clock_0_in_readdata;
  input            RamAndFlash_sopc_clock_0_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;

  wire    [ 22: 0] RamAndFlash_sopc_clock_0_in_address;
  wire             RamAndFlash_sopc_clock_0_in_allgrants;
  wire             RamAndFlash_sopc_clock_0_in_allow_new_arb_cycle;
  wire             RamAndFlash_sopc_clock_0_in_any_bursting_master_saved_grant;
  wire             RamAndFlash_sopc_clock_0_in_any_continuerequest;
  wire             RamAndFlash_sopc_clock_0_in_arb_counter_enable;
  reg     [  1: 0] RamAndFlash_sopc_clock_0_in_arb_share_counter;
  wire    [  1: 0] RamAndFlash_sopc_clock_0_in_arb_share_counter_next_value;
  wire    [  1: 0] RamAndFlash_sopc_clock_0_in_arb_share_set_values;
  wire             RamAndFlash_sopc_clock_0_in_beginbursttransfer_internal;
  wire             RamAndFlash_sopc_clock_0_in_begins_xfer;
  wire    [  1: 0] RamAndFlash_sopc_clock_0_in_byteenable;
  wire             RamAndFlash_sopc_clock_0_in_end_xfer;
  wire             RamAndFlash_sopc_clock_0_in_endofpacket_from_sa;
  wire             RamAndFlash_sopc_clock_0_in_firsttransfer;
  wire             RamAndFlash_sopc_clock_0_in_grant_vector;
  wire             RamAndFlash_sopc_clock_0_in_in_a_read_cycle;
  wire             RamAndFlash_sopc_clock_0_in_in_a_write_cycle;
  wire             RamAndFlash_sopc_clock_0_in_master_qreq_vector;
  wire    [ 21: 0] RamAndFlash_sopc_clock_0_in_nativeaddress;
  wire             RamAndFlash_sopc_clock_0_in_non_bursting_master_requests;
  wire             RamAndFlash_sopc_clock_0_in_read;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_in_readdata_from_sa;
  reg              RamAndFlash_sopc_clock_0_in_reg_firsttransfer;
  wire             RamAndFlash_sopc_clock_0_in_reset_n;
  reg              RamAndFlash_sopc_clock_0_in_slavearbiterlockenable;
  wire             RamAndFlash_sopc_clock_0_in_slavearbiterlockenable2;
  wire             RamAndFlash_sopc_clock_0_in_unreg_firsttransfer;
  wire             RamAndFlash_sopc_clock_0_in_waitrequest_from_sa;
  wire             RamAndFlash_sopc_clock_0_in_waits_for_read;
  wire             RamAndFlash_sopc_clock_0_in_waits_for_write;
  wire             RamAndFlash_sopc_clock_0_in_write;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_saved_grant_RamAndFlash_sopc_clock_0_in;
  reg              d1_RamAndFlash_sopc_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_RamAndFlash_sopc_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~RamAndFlash_sopc_clock_0_in_end_xfer;
    end


  assign RamAndFlash_sopc_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in));
  //assign RamAndFlash_sopc_clock_0_in_readdata_from_sa = RamAndFlash_sopc_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_readdata_from_sa = RamAndFlash_sopc_clock_0_in_readdata;

  assign cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in = (({cpu_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //assign RamAndFlash_sopc_clock_0_in_waitrequest_from_sa = RamAndFlash_sopc_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_waitrequest_from_sa = RamAndFlash_sopc_clock_0_in_waitrequest;

  //RamAndFlash_sopc_clock_0_in_arb_share_counter set values, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_arb_share_set_values = (cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in)? 2 :
    1;

  //RamAndFlash_sopc_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_non_bursting_master_requests = cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in;

  //RamAndFlash_sopc_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_any_bursting_master_saved_grant = 0;

  //RamAndFlash_sopc_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_arb_share_counter_next_value = RamAndFlash_sopc_clock_0_in_firsttransfer ? (RamAndFlash_sopc_clock_0_in_arb_share_set_values - 1) : |RamAndFlash_sopc_clock_0_in_arb_share_counter ? (RamAndFlash_sopc_clock_0_in_arb_share_counter - 1) : 0;

  //RamAndFlash_sopc_clock_0_in_allgrants all slave grants, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_allgrants = |RamAndFlash_sopc_clock_0_in_grant_vector;

  //RamAndFlash_sopc_clock_0_in_end_xfer assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_end_xfer = ~(RamAndFlash_sopc_clock_0_in_waits_for_read | RamAndFlash_sopc_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_0_in = RamAndFlash_sopc_clock_0_in_end_xfer & (~RamAndFlash_sopc_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //RamAndFlash_sopc_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_0_in & RamAndFlash_sopc_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_0_in & ~RamAndFlash_sopc_clock_0_in_non_bursting_master_requests);

  //RamAndFlash_sopc_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_in_arb_share_counter <= 0;
      else if (RamAndFlash_sopc_clock_0_in_arb_counter_enable)
          RamAndFlash_sopc_clock_0_in_arb_share_counter <= RamAndFlash_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //RamAndFlash_sopc_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|RamAndFlash_sopc_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_0_in) | (end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_0_in & ~RamAndFlash_sopc_clock_0_in_non_bursting_master_requests))
          RamAndFlash_sopc_clock_0_in_slavearbiterlockenable <= |RamAndFlash_sopc_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/instruction_master RamAndFlash_sopc_clock_0/in arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = RamAndFlash_sopc_clock_0_in_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //RamAndFlash_sopc_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_slavearbiterlockenable2 = |RamAndFlash_sopc_clock_0_in_arb_share_counter_next_value;

  //cpu/instruction_master RamAndFlash_sopc_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = RamAndFlash_sopc_clock_0_in_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //RamAndFlash_sopc_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_any_continuerequest = 1;

  //cpu_instruction_master_continuerequest continued request, which is an e_assign
  assign cpu_instruction_master_continuerequest = 1;

  assign cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in = cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))));
  //local readdatavalid cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in, which is an e_mux
  assign cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in = cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in & cpu_instruction_master_read & ~RamAndFlash_sopc_clock_0_in_waits_for_read;

  //assign RamAndFlash_sopc_clock_0_in_endofpacket_from_sa = RamAndFlash_sopc_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_endofpacket_from_sa = RamAndFlash_sopc_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in = cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in;

  //cpu/instruction_master saved-grant RamAndFlash_sopc_clock_0/in, which is an e_assign
  assign cpu_instruction_master_saved_grant_RamAndFlash_sopc_clock_0_in = cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in;

  //allow new arb cycle for RamAndFlash_sopc_clock_0/in, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign RamAndFlash_sopc_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign RamAndFlash_sopc_clock_0_in_master_qreq_vector = 1;

  //RamAndFlash_sopc_clock_0_in_reset_n assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_reset_n = reset_n;

  //RamAndFlash_sopc_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_firsttransfer = RamAndFlash_sopc_clock_0_in_begins_xfer ? RamAndFlash_sopc_clock_0_in_unreg_firsttransfer : RamAndFlash_sopc_clock_0_in_reg_firsttransfer;

  //RamAndFlash_sopc_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_unreg_firsttransfer = ~(RamAndFlash_sopc_clock_0_in_slavearbiterlockenable & RamAndFlash_sopc_clock_0_in_any_continuerequest);

  //RamAndFlash_sopc_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (RamAndFlash_sopc_clock_0_in_begins_xfer)
          RamAndFlash_sopc_clock_0_in_reg_firsttransfer <= RamAndFlash_sopc_clock_0_in_unreg_firsttransfer;
    end


  //RamAndFlash_sopc_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_beginbursttransfer_internal = RamAndFlash_sopc_clock_0_in_begins_xfer;

  //RamAndFlash_sopc_clock_0_in_read assignment, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_read = cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in & cpu_instruction_master_read;

  //RamAndFlash_sopc_clock_0_in_write assignment, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_write = 0;

  //RamAndFlash_sopc_clock_0_in_address mux, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_address = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //slaveid RamAndFlash_sopc_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_nativeaddress = cpu_instruction_master_address_to_slave >> 2;

  //d1_RamAndFlash_sopc_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_RamAndFlash_sopc_clock_0_in_end_xfer <= 1;
      else 
        d1_RamAndFlash_sopc_clock_0_in_end_xfer <= RamAndFlash_sopc_clock_0_in_end_xfer;
    end


  //RamAndFlash_sopc_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_waits_for_read = RamAndFlash_sopc_clock_0_in_in_a_read_cycle & RamAndFlash_sopc_clock_0_in_waitrequest_from_sa;

  //RamAndFlash_sopc_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_in_a_read_cycle = cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in & cpu_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = RamAndFlash_sopc_clock_0_in_in_a_read_cycle;

  //RamAndFlash_sopc_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_waits_for_write = RamAndFlash_sopc_clock_0_in_in_a_write_cycle & RamAndFlash_sopc_clock_0_in_waitrequest_from_sa;

  //RamAndFlash_sopc_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_0_in_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = RamAndFlash_sopc_clock_0_in_in_a_write_cycle;

  assign wait_for_RamAndFlash_sopc_clock_0_in_counter = 0;
  //RamAndFlash_sopc_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign RamAndFlash_sopc_clock_0_in_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //RamAndFlash_sopc_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc_clock_0_out_arbitrator (
                                                 // inputs:
                                                  RamAndFlash_sopc_clock_0_out_address,
                                                  RamAndFlash_sopc_clock_0_out_byteenable,
                                                  RamAndFlash_sopc_clock_0_out_granted_sdram_s1,
                                                  RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1,
                                                  RamAndFlash_sopc_clock_0_out_read,
                                                  RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1,
                                                  RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register,
                                                  RamAndFlash_sopc_clock_0_out_requests_sdram_s1,
                                                  RamAndFlash_sopc_clock_0_out_write,
                                                  RamAndFlash_sopc_clock_0_out_writedata,
                                                  clk,
                                                  d1_sdram_s1_end_xfer,
                                                  reset_n,
                                                  sdram_s1_readdata_from_sa,
                                                  sdram_s1_waitrequest_from_sa,

                                                 // outputs:
                                                  RamAndFlash_sopc_clock_0_out_address_to_slave,
                                                  RamAndFlash_sopc_clock_0_out_readdata,
                                                  RamAndFlash_sopc_clock_0_out_reset_n,
                                                  RamAndFlash_sopc_clock_0_out_waitrequest
                                               )
;

  output  [ 22: 0] RamAndFlash_sopc_clock_0_out_address_to_slave;
  output  [ 15: 0] RamAndFlash_sopc_clock_0_out_readdata;
  output           RamAndFlash_sopc_clock_0_out_reset_n;
  output           RamAndFlash_sopc_clock_0_out_waitrequest;
  input   [ 22: 0] RamAndFlash_sopc_clock_0_out_address;
  input   [  1: 0] RamAndFlash_sopc_clock_0_out_byteenable;
  input            RamAndFlash_sopc_clock_0_out_granted_sdram_s1;
  input            RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1;
  input            RamAndFlash_sopc_clock_0_out_read;
  input            RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1;
  input            RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  input            RamAndFlash_sopc_clock_0_out_requests_sdram_s1;
  input            RamAndFlash_sopc_clock_0_out_write;
  input   [ 15: 0] RamAndFlash_sopc_clock_0_out_writedata;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg     [ 22: 0] RamAndFlash_sopc_clock_0_out_address_last_time;
  wire    [ 22: 0] RamAndFlash_sopc_clock_0_out_address_to_slave;
  reg     [  1: 0] RamAndFlash_sopc_clock_0_out_byteenable_last_time;
  reg              RamAndFlash_sopc_clock_0_out_read_last_time;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_out_readdata;
  wire             RamAndFlash_sopc_clock_0_out_reset_n;
  wire             RamAndFlash_sopc_clock_0_out_run;
  wire             RamAndFlash_sopc_clock_0_out_waitrequest;
  reg              RamAndFlash_sopc_clock_0_out_write_last_time;
  reg     [ 15: 0] RamAndFlash_sopc_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1 | RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1 | ~RamAndFlash_sopc_clock_0_out_requests_sdram_s1) & (RamAndFlash_sopc_clock_0_out_granted_sdram_s1 | ~RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1) & ((~RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1 | ~RamAndFlash_sopc_clock_0_out_read | (RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1 & RamAndFlash_sopc_clock_0_out_read))) & ((~RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1 | ~(RamAndFlash_sopc_clock_0_out_read | RamAndFlash_sopc_clock_0_out_write) | (1 & ~sdram_s1_waitrequest_from_sa & (RamAndFlash_sopc_clock_0_out_read | RamAndFlash_sopc_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_0_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign RamAndFlash_sopc_clock_0_out_address_to_slave = RamAndFlash_sopc_clock_0_out_address;

  //RamAndFlash_sopc_clock_0/out readdata mux, which is an e_mux
  assign RamAndFlash_sopc_clock_0_out_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign RamAndFlash_sopc_clock_0_out_waitrequest = ~RamAndFlash_sopc_clock_0_out_run;

  //RamAndFlash_sopc_clock_0_out_reset_n assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //RamAndFlash_sopc_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_out_address_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_0_out_address_last_time <= RamAndFlash_sopc_clock_0_out_address;
    end


  //RamAndFlash_sopc_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= RamAndFlash_sopc_clock_0_out_waitrequest & (RamAndFlash_sopc_clock_0_out_read | RamAndFlash_sopc_clock_0_out_write);
    end


  //RamAndFlash_sopc_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_0_out_address != RamAndFlash_sopc_clock_0_out_address_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_out_byteenable_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_0_out_byteenable_last_time <= RamAndFlash_sopc_clock_0_out_byteenable;
    end


  //RamAndFlash_sopc_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_0_out_byteenable != RamAndFlash_sopc_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_out_read_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_0_out_read_last_time <= RamAndFlash_sopc_clock_0_out_read;
    end


  //RamAndFlash_sopc_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_0_out_read != RamAndFlash_sopc_clock_0_out_read_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_out_write_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_0_out_write_last_time <= RamAndFlash_sopc_clock_0_out_write;
    end


  //RamAndFlash_sopc_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_0_out_write != RamAndFlash_sopc_clock_0_out_write_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_0_out_writedata_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_0_out_writedata_last_time <= RamAndFlash_sopc_clock_0_out_writedata;
    end


  //RamAndFlash_sopc_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_0_out_writedata != RamAndFlash_sopc_clock_0_out_writedata_last_time) & RamAndFlash_sopc_clock_0_out_write)
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc_clock_1_in_arbitrator (
                                                // inputs:
                                                 RamAndFlash_sopc_clock_1_in_endofpacket,
                                                 RamAndFlash_sopc_clock_1_in_readdata,
                                                 RamAndFlash_sopc_clock_1_in_waitrequest,
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_byteenable,
                                                 cpu_data_master_dbs_address,
                                                 cpu_data_master_dbs_write_16,
                                                 cpu_data_master_latency_counter,
                                                 cpu_data_master_read,
                                                 cpu_data_master_write,
                                                 reset_n,

                                                // outputs:
                                                 RamAndFlash_sopc_clock_1_in_address,
                                                 RamAndFlash_sopc_clock_1_in_byteenable,
                                                 RamAndFlash_sopc_clock_1_in_endofpacket_from_sa,
                                                 RamAndFlash_sopc_clock_1_in_nativeaddress,
                                                 RamAndFlash_sopc_clock_1_in_read,
                                                 RamAndFlash_sopc_clock_1_in_readdata_from_sa,
                                                 RamAndFlash_sopc_clock_1_in_reset_n,
                                                 RamAndFlash_sopc_clock_1_in_waitrequest_from_sa,
                                                 RamAndFlash_sopc_clock_1_in_write,
                                                 RamAndFlash_sopc_clock_1_in_writedata,
                                                 cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in,
                                                 cpu_data_master_granted_RamAndFlash_sopc_clock_1_in,
                                                 cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in,
                                                 cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in,
                                                 cpu_data_master_requests_RamAndFlash_sopc_clock_1_in,
                                                 d1_RamAndFlash_sopc_clock_1_in_end_xfer
                                              )
;

  output  [ 22: 0] RamAndFlash_sopc_clock_1_in_address;
  output  [  1: 0] RamAndFlash_sopc_clock_1_in_byteenable;
  output           RamAndFlash_sopc_clock_1_in_endofpacket_from_sa;
  output  [ 21: 0] RamAndFlash_sopc_clock_1_in_nativeaddress;
  output           RamAndFlash_sopc_clock_1_in_read;
  output  [ 15: 0] RamAndFlash_sopc_clock_1_in_readdata_from_sa;
  output           RamAndFlash_sopc_clock_1_in_reset_n;
  output           RamAndFlash_sopc_clock_1_in_waitrequest_from_sa;
  output           RamAndFlash_sopc_clock_1_in_write;
  output  [ 15: 0] RamAndFlash_sopc_clock_1_in_writedata;
  output  [  1: 0] cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in;
  output           cpu_data_master_granted_RamAndFlash_sopc_clock_1_in;
  output           cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in;
  output           cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in;
  output           cpu_data_master_requests_RamAndFlash_sopc_clock_1_in;
  output           d1_RamAndFlash_sopc_clock_1_in_end_xfer;
  input            RamAndFlash_sopc_clock_1_in_endofpacket;
  input   [ 15: 0] RamAndFlash_sopc_clock_1_in_readdata;
  input            RamAndFlash_sopc_clock_1_in_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;

  wire    [ 22: 0] RamAndFlash_sopc_clock_1_in_address;
  wire             RamAndFlash_sopc_clock_1_in_allgrants;
  wire             RamAndFlash_sopc_clock_1_in_allow_new_arb_cycle;
  wire             RamAndFlash_sopc_clock_1_in_any_bursting_master_saved_grant;
  wire             RamAndFlash_sopc_clock_1_in_any_continuerequest;
  wire             RamAndFlash_sopc_clock_1_in_arb_counter_enable;
  reg     [  2: 0] RamAndFlash_sopc_clock_1_in_arb_share_counter;
  wire    [  2: 0] RamAndFlash_sopc_clock_1_in_arb_share_counter_next_value;
  wire    [  2: 0] RamAndFlash_sopc_clock_1_in_arb_share_set_values;
  wire             RamAndFlash_sopc_clock_1_in_beginbursttransfer_internal;
  wire             RamAndFlash_sopc_clock_1_in_begins_xfer;
  wire    [  1: 0] RamAndFlash_sopc_clock_1_in_byteenable;
  wire             RamAndFlash_sopc_clock_1_in_end_xfer;
  wire             RamAndFlash_sopc_clock_1_in_endofpacket_from_sa;
  wire             RamAndFlash_sopc_clock_1_in_firsttransfer;
  wire             RamAndFlash_sopc_clock_1_in_grant_vector;
  wire             RamAndFlash_sopc_clock_1_in_in_a_read_cycle;
  wire             RamAndFlash_sopc_clock_1_in_in_a_write_cycle;
  wire             RamAndFlash_sopc_clock_1_in_master_qreq_vector;
  wire    [ 21: 0] RamAndFlash_sopc_clock_1_in_nativeaddress;
  wire             RamAndFlash_sopc_clock_1_in_non_bursting_master_requests;
  wire             RamAndFlash_sopc_clock_1_in_read;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_in_readdata_from_sa;
  reg              RamAndFlash_sopc_clock_1_in_reg_firsttransfer;
  wire             RamAndFlash_sopc_clock_1_in_reset_n;
  reg              RamAndFlash_sopc_clock_1_in_slavearbiterlockenable;
  wire             RamAndFlash_sopc_clock_1_in_slavearbiterlockenable2;
  wire             RamAndFlash_sopc_clock_1_in_unreg_firsttransfer;
  wire             RamAndFlash_sopc_clock_1_in_waitrequest_from_sa;
  wire             RamAndFlash_sopc_clock_1_in_waits_for_read;
  wire             RamAndFlash_sopc_clock_1_in_waits_for_write;
  wire             RamAndFlash_sopc_clock_1_in_write;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in;
  wire    [  1: 0] cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_requests_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_saved_grant_RamAndFlash_sopc_clock_1_in;
  reg              d1_RamAndFlash_sopc_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_RamAndFlash_sopc_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~RamAndFlash_sopc_clock_1_in_end_xfer;
    end


  assign RamAndFlash_sopc_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in));
  //assign RamAndFlash_sopc_clock_1_in_readdata_from_sa = RamAndFlash_sopc_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_readdata_from_sa = RamAndFlash_sopc_clock_1_in_readdata;

  assign cpu_data_master_requests_RamAndFlash_sopc_clock_1_in = ({cpu_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_data_master_read | cpu_data_master_write);
  //assign RamAndFlash_sopc_clock_1_in_waitrequest_from_sa = RamAndFlash_sopc_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_waitrequest_from_sa = RamAndFlash_sopc_clock_1_in_waitrequest;

  //RamAndFlash_sopc_clock_1_in_arb_share_counter set values, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_arb_share_set_values = (cpu_data_master_granted_RamAndFlash_sopc_clock_1_in)? 2 :
    1;

  //RamAndFlash_sopc_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_non_bursting_master_requests = cpu_data_master_requests_RamAndFlash_sopc_clock_1_in;

  //RamAndFlash_sopc_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_any_bursting_master_saved_grant = 0;

  //RamAndFlash_sopc_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_arb_share_counter_next_value = RamAndFlash_sopc_clock_1_in_firsttransfer ? (RamAndFlash_sopc_clock_1_in_arb_share_set_values - 1) : |RamAndFlash_sopc_clock_1_in_arb_share_counter ? (RamAndFlash_sopc_clock_1_in_arb_share_counter - 1) : 0;

  //RamAndFlash_sopc_clock_1_in_allgrants all slave grants, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_allgrants = |RamAndFlash_sopc_clock_1_in_grant_vector;

  //RamAndFlash_sopc_clock_1_in_end_xfer assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_end_xfer = ~(RamAndFlash_sopc_clock_1_in_waits_for_read | RamAndFlash_sopc_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_1_in = RamAndFlash_sopc_clock_1_in_end_xfer & (~RamAndFlash_sopc_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //RamAndFlash_sopc_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_1_in & RamAndFlash_sopc_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_1_in & ~RamAndFlash_sopc_clock_1_in_non_bursting_master_requests);

  //RamAndFlash_sopc_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_in_arb_share_counter <= 0;
      else if (RamAndFlash_sopc_clock_1_in_arb_counter_enable)
          RamAndFlash_sopc_clock_1_in_arb_share_counter <= RamAndFlash_sopc_clock_1_in_arb_share_counter_next_value;
    end


  //RamAndFlash_sopc_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|RamAndFlash_sopc_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_1_in) | (end_xfer_arb_share_counter_term_RamAndFlash_sopc_clock_1_in & ~RamAndFlash_sopc_clock_1_in_non_bursting_master_requests))
          RamAndFlash_sopc_clock_1_in_slavearbiterlockenable <= |RamAndFlash_sopc_clock_1_in_arb_share_counter_next_value;
    end


  //cpu/data_master RamAndFlash_sopc_clock_1/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = RamAndFlash_sopc_clock_1_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //RamAndFlash_sopc_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_slavearbiterlockenable2 = |RamAndFlash_sopc_clock_1_in_arb_share_counter_next_value;

  //cpu/data_master RamAndFlash_sopc_clock_1/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = RamAndFlash_sopc_clock_1_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //RamAndFlash_sopc_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in = cpu_data_master_requests_RamAndFlash_sopc_clock_1_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))) | ((!cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in) & cpu_data_master_write));
  //local readdatavalid cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in, which is an e_mux
  assign cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in = cpu_data_master_granted_RamAndFlash_sopc_clock_1_in & cpu_data_master_read & ~RamAndFlash_sopc_clock_1_in_waits_for_read;

  //RamAndFlash_sopc_clock_1_in_writedata mux, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_writedata = cpu_data_master_dbs_write_16;

  //assign RamAndFlash_sopc_clock_1_in_endofpacket_from_sa = RamAndFlash_sopc_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_endofpacket_from_sa = RamAndFlash_sopc_clock_1_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_RamAndFlash_sopc_clock_1_in = cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in;

  //cpu/data_master saved-grant RamAndFlash_sopc_clock_1/in, which is an e_assign
  assign cpu_data_master_saved_grant_RamAndFlash_sopc_clock_1_in = cpu_data_master_requests_RamAndFlash_sopc_clock_1_in;

  //allow new arb cycle for RamAndFlash_sopc_clock_1/in, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign RamAndFlash_sopc_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign RamAndFlash_sopc_clock_1_in_master_qreq_vector = 1;

  //RamAndFlash_sopc_clock_1_in_reset_n assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_reset_n = reset_n;

  //RamAndFlash_sopc_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_firsttransfer = RamAndFlash_sopc_clock_1_in_begins_xfer ? RamAndFlash_sopc_clock_1_in_unreg_firsttransfer : RamAndFlash_sopc_clock_1_in_reg_firsttransfer;

  //RamAndFlash_sopc_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_unreg_firsttransfer = ~(RamAndFlash_sopc_clock_1_in_slavearbiterlockenable & RamAndFlash_sopc_clock_1_in_any_continuerequest);

  //RamAndFlash_sopc_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (RamAndFlash_sopc_clock_1_in_begins_xfer)
          RamAndFlash_sopc_clock_1_in_reg_firsttransfer <= RamAndFlash_sopc_clock_1_in_unreg_firsttransfer;
    end


  //RamAndFlash_sopc_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_beginbursttransfer_internal = RamAndFlash_sopc_clock_1_in_begins_xfer;

  //RamAndFlash_sopc_clock_1_in_read assignment, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_read = cpu_data_master_granted_RamAndFlash_sopc_clock_1_in & cpu_data_master_read;

  //RamAndFlash_sopc_clock_1_in_write assignment, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_write = cpu_data_master_granted_RamAndFlash_sopc_clock_1_in & cpu_data_master_write;

  //RamAndFlash_sopc_clock_1_in_address mux, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_address = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //slaveid RamAndFlash_sopc_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_RamAndFlash_sopc_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_RamAndFlash_sopc_clock_1_in_end_xfer <= 1;
      else 
        d1_RamAndFlash_sopc_clock_1_in_end_xfer <= RamAndFlash_sopc_clock_1_in_end_xfer;
    end


  //RamAndFlash_sopc_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_waits_for_read = RamAndFlash_sopc_clock_1_in_in_a_read_cycle & RamAndFlash_sopc_clock_1_in_waitrequest_from_sa;

  //RamAndFlash_sopc_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_in_a_read_cycle = cpu_data_master_granted_RamAndFlash_sopc_clock_1_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = RamAndFlash_sopc_clock_1_in_in_a_read_cycle;

  //RamAndFlash_sopc_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_waits_for_write = RamAndFlash_sopc_clock_1_in_in_a_write_cycle & RamAndFlash_sopc_clock_1_in_waitrequest_from_sa;

  //RamAndFlash_sopc_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_1_in_in_a_write_cycle = cpu_data_master_granted_RamAndFlash_sopc_clock_1_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = RamAndFlash_sopc_clock_1_in_in_a_write_cycle;

  assign wait_for_RamAndFlash_sopc_clock_1_in_counter = 0;
  //RamAndFlash_sopc_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign RamAndFlash_sopc_clock_1_in_byteenable = (cpu_data_master_granted_RamAndFlash_sopc_clock_1_in)? cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in :
    -1;

  assign {cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in_segment_1,
cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in_segment_0 :
    cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //RamAndFlash_sopc_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc_clock_1_out_arbitrator (
                                                 // inputs:
                                                  RamAndFlash_sopc_clock_1_out_address,
                                                  RamAndFlash_sopc_clock_1_out_byteenable,
                                                  RamAndFlash_sopc_clock_1_out_granted_sdram_s1,
                                                  RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1,
                                                  RamAndFlash_sopc_clock_1_out_read,
                                                  RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1,
                                                  RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register,
                                                  RamAndFlash_sopc_clock_1_out_requests_sdram_s1,
                                                  RamAndFlash_sopc_clock_1_out_write,
                                                  RamAndFlash_sopc_clock_1_out_writedata,
                                                  clk,
                                                  d1_sdram_s1_end_xfer,
                                                  reset_n,
                                                  sdram_s1_readdata_from_sa,
                                                  sdram_s1_waitrequest_from_sa,

                                                 // outputs:
                                                  RamAndFlash_sopc_clock_1_out_address_to_slave,
                                                  RamAndFlash_sopc_clock_1_out_readdata,
                                                  RamAndFlash_sopc_clock_1_out_reset_n,
                                                  RamAndFlash_sopc_clock_1_out_waitrequest
                                               )
;

  output  [ 22: 0] RamAndFlash_sopc_clock_1_out_address_to_slave;
  output  [ 15: 0] RamAndFlash_sopc_clock_1_out_readdata;
  output           RamAndFlash_sopc_clock_1_out_reset_n;
  output           RamAndFlash_sopc_clock_1_out_waitrequest;
  input   [ 22: 0] RamAndFlash_sopc_clock_1_out_address;
  input   [  1: 0] RamAndFlash_sopc_clock_1_out_byteenable;
  input            RamAndFlash_sopc_clock_1_out_granted_sdram_s1;
  input            RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1;
  input            RamAndFlash_sopc_clock_1_out_read;
  input            RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1;
  input            RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  input            RamAndFlash_sopc_clock_1_out_requests_sdram_s1;
  input            RamAndFlash_sopc_clock_1_out_write;
  input   [ 15: 0] RamAndFlash_sopc_clock_1_out_writedata;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg     [ 22: 0] RamAndFlash_sopc_clock_1_out_address_last_time;
  wire    [ 22: 0] RamAndFlash_sopc_clock_1_out_address_to_slave;
  reg     [  1: 0] RamAndFlash_sopc_clock_1_out_byteenable_last_time;
  reg              RamAndFlash_sopc_clock_1_out_read_last_time;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_out_readdata;
  wire             RamAndFlash_sopc_clock_1_out_reset_n;
  wire             RamAndFlash_sopc_clock_1_out_run;
  wire             RamAndFlash_sopc_clock_1_out_waitrequest;
  reg              RamAndFlash_sopc_clock_1_out_write_last_time;
  reg     [ 15: 0] RamAndFlash_sopc_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1 | RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1 | ~RamAndFlash_sopc_clock_1_out_requests_sdram_s1) & (RamAndFlash_sopc_clock_1_out_granted_sdram_s1 | ~RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1) & ((~RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1 | ~RamAndFlash_sopc_clock_1_out_read | (RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1 & RamAndFlash_sopc_clock_1_out_read))) & ((~RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1 | ~(RamAndFlash_sopc_clock_1_out_read | RamAndFlash_sopc_clock_1_out_write) | (1 & ~sdram_s1_waitrequest_from_sa & (RamAndFlash_sopc_clock_1_out_read | RamAndFlash_sopc_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_1_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign RamAndFlash_sopc_clock_1_out_address_to_slave = RamAndFlash_sopc_clock_1_out_address;

  //RamAndFlash_sopc_clock_1/out readdata mux, which is an e_mux
  assign RamAndFlash_sopc_clock_1_out_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign RamAndFlash_sopc_clock_1_out_waitrequest = ~RamAndFlash_sopc_clock_1_out_run;

  //RamAndFlash_sopc_clock_1_out_reset_n assignment, which is an e_assign
  assign RamAndFlash_sopc_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //RamAndFlash_sopc_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_out_address_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_1_out_address_last_time <= RamAndFlash_sopc_clock_1_out_address;
    end


  //RamAndFlash_sopc_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= RamAndFlash_sopc_clock_1_out_waitrequest & (RamAndFlash_sopc_clock_1_out_read | RamAndFlash_sopc_clock_1_out_write);
    end


  //RamAndFlash_sopc_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_1_out_address != RamAndFlash_sopc_clock_1_out_address_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_out_byteenable_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_1_out_byteenable_last_time <= RamAndFlash_sopc_clock_1_out_byteenable;
    end


  //RamAndFlash_sopc_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_1_out_byteenable != RamAndFlash_sopc_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_out_read_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_1_out_read_last_time <= RamAndFlash_sopc_clock_1_out_read;
    end


  //RamAndFlash_sopc_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_1_out_read != RamAndFlash_sopc_clock_1_out_read_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_out_write_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_1_out_write_last_time <= RamAndFlash_sopc_clock_1_out_write;
    end


  //RamAndFlash_sopc_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_1_out_write != RamAndFlash_sopc_clock_1_out_write_last_time))
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //RamAndFlash_sopc_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          RamAndFlash_sopc_clock_1_out_writedata_last_time <= 0;
      else 
        RamAndFlash_sopc_clock_1_out_writedata_last_time <= RamAndFlash_sopc_clock_1_out_writedata;
    end


  //RamAndFlash_sopc_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (RamAndFlash_sopc_clock_1_out_writedata != RamAndFlash_sopc_clock_1_out_writedata_last_time) & RamAndFlash_sopc_clock_1_out_write)
        begin
          $write("%0d ns: RamAndFlash_sopc_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 24: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1804800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_jtag_debug_module = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1804800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     RamAndFlash_sopc_clock_1_in_readdata_from_sa,
                                     RamAndFlash_sopc_clock_1_in_waitrequest_from_sa,
                                     cfi_flash_s1_wait_counter_eq_0,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable,
                                     cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in,
                                     cpu_data_master_byteenable_cfi_flash_s1,
                                     cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                     cpu_data_master_granted_RamAndFlash_sopc_clock_1_in,
                                     cpu_data_master_granted_cfi_flash_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_mmc_spi_spi_control_port,
                                     cpu_data_master_granted_onchip_memory_s1,
                                     cpu_data_master_granted_pio_btn0_s1,
                                     cpu_data_master_granted_pio_led_s1,
                                     cpu_data_master_granted_pio_seg7_s1,
                                     cpu_data_master_granted_pio_sw_s1,
                                     cpu_data_master_granted_pll_pll_slave,
                                     cpu_data_master_granted_ps2_0_avalon_ps2_slave,
                                     cpu_data_master_granted_spi0_spi_control_port,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_granted_timer_s1,
                                     cpu_data_master_granted_uart0_s1,
                                     cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                     cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave,
                                     cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave,
                                     cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in,
                                     cpu_data_master_qualified_request_cfi_flash_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_mmc_spi_spi_control_port,
                                     cpu_data_master_qualified_request_onchip_memory_s1,
                                     cpu_data_master_qualified_request_pio_btn0_s1,
                                     cpu_data_master_qualified_request_pio_led_s1,
                                     cpu_data_master_qualified_request_pio_seg7_s1,
                                     cpu_data_master_qualified_request_pio_sw_s1,
                                     cpu_data_master_qualified_request_pll_pll_slave,
                                     cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave,
                                     cpu_data_master_qualified_request_spi0_spi_control_port,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_qualified_request_timer_s1,
                                     cpu_data_master_qualified_request_uart0_s1,
                                     cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                     cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave,
                                     cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in,
                                     cpu_data_master_read_data_valid_cfi_flash_s1,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_mmc_spi_spi_control_port,
                                     cpu_data_master_read_data_valid_onchip_memory_s1,
                                     cpu_data_master_read_data_valid_pio_btn0_s1,
                                     cpu_data_master_read_data_valid_pio_led_s1,
                                     cpu_data_master_read_data_valid_pio_seg7_s1,
                                     cpu_data_master_read_data_valid_pio_sw_s1,
                                     cpu_data_master_read_data_valid_pll_pll_slave,
                                     cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave,
                                     cpu_data_master_read_data_valid_spi0_spi_control_port,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_read_data_valid_timer_s1,
                                     cpu_data_master_read_data_valid_uart0_s1,
                                     cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                     cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave,
                                     cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave,
                                     cpu_data_master_requests_RamAndFlash_sopc_clock_1_in,
                                     cpu_data_master_requests_cfi_flash_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_mmc_spi_spi_control_port,
                                     cpu_data_master_requests_onchip_memory_s1,
                                     cpu_data_master_requests_pio_btn0_s1,
                                     cpu_data_master_requests_pio_led_s1,
                                     cpu_data_master_requests_pio_seg7_s1,
                                     cpu_data_master_requests_pio_sw_s1,
                                     cpu_data_master_requests_pll_pll_slave,
                                     cpu_data_master_requests_ps2_0_avalon_ps2_slave,
                                     cpu_data_master_requests_spi0_spi_control_port,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_requests_timer_s1,
                                     cpu_data_master_requests_uart0_s1,
                                     cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                     cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave,
                                     cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_RamAndFlash_sopc_clock_1_in_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_mmc_spi_spi_control_port_end_xfer,
                                     d1_onchip_memory_s1_end_xfer,
                                     d1_pio_btn0_s1_end_xfer,
                                     d1_pio_led_s1_end_xfer,
                                     d1_pio_seg7_s1_end_xfer,
                                     d1_pio_sw_s1_end_xfer,
                                     d1_pll_pll_slave_end_xfer,
                                     d1_ps2_0_avalon_ps2_slave_end_xfer,
                                     d1_spi0_spi_control_port_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_timer_s1_end_xfer,
                                     d1_tri_state_bridge_avalon_slave_end_xfer,
                                     d1_uart0_s1_end_xfer,
                                     d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer,
                                     d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer,
                                     d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer,
                                     incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     mmc_spi_spi_control_port_irq_from_sa,
                                     mmc_spi_spi_control_port_readdata_from_sa,
                                     onchip_memory_s1_readdata_from_sa,
                                     pio_btn0_s1_irq_from_sa,
                                     pio_btn0_s1_readdata_from_sa,
                                     pio_led_s1_readdata_from_sa,
                                     pio_seg7_s1_readdata_from_sa,
                                     pio_sw_s1_readdata_from_sa,
                                     pll_pll_slave_readdata_from_sa,
                                     ps2_0_avalon_ps2_slave_irq_from_sa,
                                     ps2_0_avalon_ps2_slave_readdata_from_sa,
                                     ps2_0_avalon_ps2_slave_waitrequest_from_sa,
                                     reset_n,
                                     spi0_spi_control_port_irq_from_sa,
                                     spi0_spi_control_port_readdata_from_sa,
                                     sysid_control_slave_readdata_from_sa,
                                     timer_s1_irq_from_sa,
                                     timer_s1_readdata_from_sa,
                                     uart0_s1_irq_from_sa,
                                     uart0_s1_readdata_from_sa,
                                     video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa,
                                     video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa,
                                     video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa,
                                     video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_dbs_write_8,
                                     cpu_data_master_irq,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_readdata,
                                     cpu_data_master_readdatavalid,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 24: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [  7: 0] cpu_data_master_dbs_write_8;
  output  [ 31: 0] cpu_data_master_irq;
  output  [  1: 0] cpu_data_master_latency_counter;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_readdatavalid;
  output           cpu_data_master_waitrequest;
  input   [ 15: 0] RamAndFlash_sopc_clock_1_in_readdata_from_sa;
  input            RamAndFlash_sopc_clock_1_in_waitrequest_from_sa;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input   [ 24: 0] cpu_data_master_address;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in;
  input   [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  input            cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave;
  input            cpu_data_master_granted_RamAndFlash_sopc_clock_1_in;
  input            cpu_data_master_granted_cfi_flash_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_mmc_spi_spi_control_port;
  input            cpu_data_master_granted_onchip_memory_s1;
  input            cpu_data_master_granted_pio_btn0_s1;
  input            cpu_data_master_granted_pio_led_s1;
  input            cpu_data_master_granted_pio_seg7_s1;
  input            cpu_data_master_granted_pio_sw_s1;
  input            cpu_data_master_granted_pll_pll_slave;
  input            cpu_data_master_granted_ps2_0_avalon_ps2_slave;
  input            cpu_data_master_granted_spi0_spi_control_port;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_granted_timer_s1;
  input            cpu_data_master_granted_uart0_s1;
  input            cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave;
  input            cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave;
  input            cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave;
  input            cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in;
  input            cpu_data_master_qualified_request_cfi_flash_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_mmc_spi_spi_control_port;
  input            cpu_data_master_qualified_request_onchip_memory_s1;
  input            cpu_data_master_qualified_request_pio_btn0_s1;
  input            cpu_data_master_qualified_request_pio_led_s1;
  input            cpu_data_master_qualified_request_pio_seg7_s1;
  input            cpu_data_master_qualified_request_pio_sw_s1;
  input            cpu_data_master_qualified_request_pll_pll_slave;
  input            cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave;
  input            cpu_data_master_qualified_request_spi0_spi_control_port;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_qualified_request_timer_s1;
  input            cpu_data_master_qualified_request_uart0_s1;
  input            cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave;
  input            cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave;
  input            cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in;
  input            cpu_data_master_read_data_valid_cfi_flash_s1;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_mmc_spi_spi_control_port;
  input            cpu_data_master_read_data_valid_onchip_memory_s1;
  input            cpu_data_master_read_data_valid_pio_btn0_s1;
  input            cpu_data_master_read_data_valid_pio_led_s1;
  input            cpu_data_master_read_data_valid_pio_seg7_s1;
  input            cpu_data_master_read_data_valid_pio_sw_s1;
  input            cpu_data_master_read_data_valid_pll_pll_slave;
  input            cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave;
  input            cpu_data_master_read_data_valid_spi0_spi_control_port;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_read_data_valid_timer_s1;
  input            cpu_data_master_read_data_valid_uart0_s1;
  input            cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave;
  input            cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave;
  input            cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave;
  input            cpu_data_master_requests_RamAndFlash_sopc_clock_1_in;
  input            cpu_data_master_requests_cfi_flash_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_mmc_spi_spi_control_port;
  input            cpu_data_master_requests_onchip_memory_s1;
  input            cpu_data_master_requests_pio_btn0_s1;
  input            cpu_data_master_requests_pio_led_s1;
  input            cpu_data_master_requests_pio_seg7_s1;
  input            cpu_data_master_requests_pio_sw_s1;
  input            cpu_data_master_requests_pll_pll_slave;
  input            cpu_data_master_requests_ps2_0_avalon_ps2_slave;
  input            cpu_data_master_requests_spi0_spi_control_port;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_requests_timer_s1;
  input            cpu_data_master_requests_uart0_s1;
  input            cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave;
  input            cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave;
  input            cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_RamAndFlash_sopc_clock_1_in_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_mmc_spi_spi_control_port_end_xfer;
  input            d1_onchip_memory_s1_end_xfer;
  input            d1_pio_btn0_s1_end_xfer;
  input            d1_pio_led_s1_end_xfer;
  input            d1_pio_seg7_s1_end_xfer;
  input            d1_pio_sw_s1_end_xfer;
  input            d1_pll_pll_slave_end_xfer;
  input            d1_ps2_0_avalon_ps2_slave_end_xfer;
  input            d1_spi0_spi_control_port_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_s1_end_xfer;
  input            d1_tri_state_bridge_avalon_slave_end_xfer;
  input            d1_uart0_s1_end_xfer;
  input            d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer;
  input            d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer;
  input            d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input            mmc_spi_spi_control_port_irq_from_sa;
  input   [ 15: 0] mmc_spi_spi_control_port_readdata_from_sa;
  input   [ 31: 0] onchip_memory_s1_readdata_from_sa;
  input            pio_btn0_s1_irq_from_sa;
  input   [  2: 0] pio_btn0_s1_readdata_from_sa;
  input   [ 10: 0] pio_led_s1_readdata_from_sa;
  input   [ 31: 0] pio_seg7_s1_readdata_from_sa;
  input   [  9: 0] pio_sw_s1_readdata_from_sa;
  input   [ 31: 0] pll_pll_slave_readdata_from_sa;
  input            ps2_0_avalon_ps2_slave_irq_from_sa;
  input   [ 31: 0] ps2_0_avalon_ps2_slave_readdata_from_sa;
  input            ps2_0_avalon_ps2_slave_waitrequest_from_sa;
  input            reset_n;
  input            spi0_spi_control_port_irq_from_sa;
  input   [ 15: 0] spi0_spi_control_port_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            timer_s1_irq_from_sa;
  input   [ 15: 0] timer_s1_readdata_from_sa;
  input            uart0_s1_irq_from_sa;
  input   [ 15: 0] uart0_s1_readdata_from_sa;
  input   [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa;
  input            video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa;
  input   [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa;
  input   [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_data_master_address_last_time;
  wire    [ 24: 0] cpu_data_master_address_to_slave;
  reg     [  3: 0] cpu_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  reg     [  1: 0] cpu_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_is_granted_some_slave;
  reg     [  1: 0] cpu_data_master_latency_counter;
  wire    [  1: 0] cpu_data_master_next_dbs_rdv_counter;
  reg              cpu_data_master_read_but_no_slave_selected;
  reg              cpu_data_master_read_last_time;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_run;
  wire             cpu_data_master_waitrequest;
  reg              cpu_data_master_write_last_time;
  reg     [ 31: 0] cpu_data_master_writedata_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in | (cpu_data_master_write & !cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_RamAndFlash_sopc_clock_1_in) & ((~cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in | ~cpu_data_master_read | (1 & ~RamAndFlash_sopc_clock_1_in_waitrequest_from_sa & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in | ~cpu_data_master_write | (1 & ~RamAndFlash_sopc_clock_1_in_waitrequest_from_sa & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_mmc_spi_spi_control_port | ~cpu_data_master_requests_mmc_spi_spi_control_port) & ((~cpu_data_master_qualified_request_mmc_spi_spi_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_mmc_spi_spi_control_port_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_mmc_spi_spi_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_mmc_spi_spi_control_port_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_onchip_memory_s1 | ~cpu_data_master_requests_onchip_memory_s1) & ((~cpu_data_master_qualified_request_onchip_memory_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_onchip_memory_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_pio_btn0_s1 | ~cpu_data_master_requests_pio_btn0_s1) & ((~cpu_data_master_qualified_request_pio_btn0_s1 | ~cpu_data_master_read | (1 & ~d1_pio_btn0_s1_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_pio_btn0_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_pio_led_s1 | ~cpu_data_master_requests_pio_led_s1) & ((~cpu_data_master_qualified_request_pio_led_s1 | ~cpu_data_master_read | (1 & ~d1_pio_led_s1_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_pio_led_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_pio_seg7_s1 | ~cpu_data_master_requests_pio_seg7_s1) & ((~cpu_data_master_qualified_request_pio_seg7_s1 | ~cpu_data_master_read | (1 & ~d1_pio_seg7_s1_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_pio_seg7_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_pio_sw_s1 | ~cpu_data_master_requests_pio_sw_s1) & ((~cpu_data_master_qualified_request_pio_sw_s1 | ~cpu_data_master_read | (1 & ~d1_pio_sw_s1_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_pio_sw_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_pll_pll_slave | ~cpu_data_master_requests_pll_pll_slave) & ((~cpu_data_master_qualified_request_pll_pll_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_data_master_qualified_request_pll_pll_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave | ~cpu_data_master_requests_ps2_0_avalon_ps2_slave) & ((~cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~ps2_0_avalon_ps2_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~ps2_0_avalon_ps2_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_spi0_spi_control_port | ~cpu_data_master_requests_spi0_spi_control_port) & ((~cpu_data_master_qualified_request_spi0_spi_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_spi0_spi_control_port_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_spi0_spi_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_spi0_spi_control_port_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_requests_sysid_control_slave) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & ~d1_sysid_control_slave_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_requests_timer_s1) & ((~cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_read | (1 & ~d1_timer_s1_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cfi_flash_s1 | (cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_cfi_flash_s1) & (cpu_data_master_granted_cfi_flash_s1 | ~cpu_data_master_qualified_request_cfi_flash_s1);

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_write | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_uart0_s1 | ~cpu_data_master_requests_uart0_s1) & ((~cpu_data_master_qualified_request_uart0_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_uart0_s1_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_uart0_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_uart0_s1_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & 1 & ((cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave | ((cpu_data_master_write & !cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0])) | ~cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave)) & ((~cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave | ~cpu_data_master_read | (1 & ~video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave | ~cpu_data_master_write | (1 & ~video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave | ~cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave) & ((~cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave | ~cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave) & ((~cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[24 : 0];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_data_master_requests_RamAndFlash_sopc_clock_1_in & cpu_data_master_write & !cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in)) |
    (cpu_data_master_granted_RamAndFlash_sopc_clock_1_in & cpu_data_master_read & 1 & 1 & ~RamAndFlash_sopc_clock_1_in_waitrequest_from_sa) |
    (cpu_data_master_granted_RamAndFlash_sopc_clock_1_in & cpu_data_master_write & 1 & 1 & ~RamAndFlash_sopc_clock_1_in_waitrequest_from_sa) |
    (((~0) & cpu_data_master_requests_cfi_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1)) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer}))) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer}))) |
    (((~0) & cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_write & !cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave)) |
    (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_read & 1 & 1 & ~video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa) |
    (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_write & 1 & 1 & ~video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa);

  //cpu_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_data_master_read_but_no_slave_selected <= cpu_data_master_read & cpu_data_master_run & ~cpu_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_data_master_is_granted_some_slave = cpu_data_master_granted_RamAndFlash_sopc_clock_1_in |
    cpu_data_master_granted_cpu_jtag_debug_module |
    cpu_data_master_granted_jtag_uart_avalon_jtag_slave |
    cpu_data_master_granted_mmc_spi_spi_control_port |
    cpu_data_master_granted_onchip_memory_s1 |
    cpu_data_master_granted_pio_btn0_s1 |
    cpu_data_master_granted_pio_led_s1 |
    cpu_data_master_granted_pio_seg7_s1 |
    cpu_data_master_granted_pio_sw_s1 |
    cpu_data_master_granted_pll_pll_slave |
    cpu_data_master_granted_ps2_0_avalon_ps2_slave |
    cpu_data_master_granted_spi0_spi_control_port |
    cpu_data_master_granted_sysid_control_slave |
    cpu_data_master_granted_timer_s1 |
    cpu_data_master_granted_cfi_flash_s1 |
    cpu_data_master_granted_uart0_s1 |
    cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave |
    cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave |
    cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_data_master_readdatavalid = cpu_data_master_read_data_valid_onchip_memory_s1 |
    cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave |
    (cpu_data_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow) |
    (cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave & dbs_rdv_counter_overflow) |
    cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave |
    cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_data_master_readdatavalid = cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    (cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in & dbs_counter_overflow) |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_cpu_jtag_debug_module |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_mmc_spi_spi_control_port |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_pio_btn0_s1 |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_pio_led_s1 |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_pio_seg7_s1 |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_pio_sw_s1 |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_pll_pll_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_spi0_spi_control_port |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_sysid_control_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_timer_s1 |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_uart0_s1 |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = RamAndFlash_sopc_clock_1_in_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~(cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in & cpu_data_master_read)}} | {RamAndFlash_sopc_clock_1_in_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~(cpu_data_master_qualified_request_cpu_jtag_debug_module & cpu_data_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave & cpu_data_master_read)}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_mmc_spi_spi_control_port & cpu_data_master_read)}} | mmc_spi_spi_control_port_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_onchip_memory_s1}} | onchip_memory_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_pio_btn0_s1 & cpu_data_master_read)}} | pio_btn0_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_pio_led_s1 & cpu_data_master_read)}} | pio_led_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_pio_seg7_s1 & cpu_data_master_read)}} | pio_seg7_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_pio_sw_s1 & cpu_data_master_read)}} | pio_sw_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_pll_pll_slave & cpu_data_master_read)}} | pll_pll_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave}} | ps2_0_avalon_ps2_slave_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_spi0_spi_control_port & cpu_data_master_read)}} | spi0_spi_control_port_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_sysid_control_slave & cpu_data_master_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_timer_s1 & cpu_data_master_read)}} | timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(cpu_data_master_qualified_request_uart0_s1 & cpu_data_master_read)}} | uart0_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave}} | {video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0}) &
    ({32 {~cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave}} | video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave}} | video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa);

  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    (~(cpu_data_master_dbs_address[1]))? cpu_data_master_writedata[15 : 0] :
    (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //actual waitrequest port, which is an e_assign
  assign cpu_data_master_waitrequest = ~cpu_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_latency_counter <= 0;
      else 
        cpu_data_master_latency_counter <= p1_cpu_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_data_master_latency_counter = ((cpu_data_master_run & cpu_data_master_read))? latency_load_value :
    (cpu_data_master_latency_counter)? cpu_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({2 {cpu_data_master_requests_onchip_memory_s1}} & 1) |
    ({2 {cpu_data_master_requests_ps2_0_avalon_ps2_slave}} & 1) |
    ({2 {cpu_data_master_requests_cfi_flash_s1}} & 2) |
    ({2 {cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave}} & 1) |
    ({2 {cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave}} & 1) |
    ({2 {cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave}} & 1);

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_RamAndFlash_sopc_clock_1_in)? 2 :
    (cpu_data_master_requests_cfi_flash_s1)? 2 :
    (cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    mmc_spi_spi_control_port_irq_from_sa,
    ps2_0_avalon_ps2_slave_irq_from_sa,
    spi0_spi_control_port_irq_from_sa,
    uart0_s1_irq_from_sa,
    pio_btn0_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    timer_s1_irq_from_sa};

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_data_master_next_dbs_rdv_counter = cpu_data_master_dbs_rdv_counter + cpu_data_master_dbs_rdv_counter_inc;

  //cpu_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_data_master_dbs_rdv_counter_inc = (cpu_data_master_read_data_valid_cfi_flash_s1)? 2 :
    1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_data_master_read_data_valid_cfi_flash_s1 |
    cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_data_master_dbs_rdv_counter <= cpu_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_data_master_dbs_rdv_counter[1] & ~cpu_data_master_next_dbs_rdv_counter[1];

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_data_master_dbs_write_8 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_writedata[7 : 0] :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_writedata[15 : 8] :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_writedata[23 : 16] :
    cpu_data_master_writedata[31 : 24];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_address_last_time <= 0;
      else 
        cpu_data_master_address_last_time <= cpu_data_master_address;
    end


  //cpu/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_data_master_waitrequest & (cpu_data_master_read | cpu_data_master_write);
    end


  //cpu_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_address != cpu_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_byteenable_last_time <= 0;
      else 
        cpu_data_master_byteenable_last_time <= cpu_data_master_byteenable;
    end


  //cpu_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_byteenable != cpu_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_last_time <= 0;
      else 
        cpu_data_master_read_last_time <= cpu_data_master_read;
    end


  //cpu_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_read != cpu_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_write_last_time <= 0;
      else 
        cpu_data_master_write_last_time <= cpu_data_master_write;
    end


  //cpu_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_write != cpu_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_writedata_last_time <= 0;
      else 
        cpu_data_master_writedata_last_time <= cpu_data_master_writedata;
    end


  //cpu_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_writedata != cpu_data_master_writedata_last_time) & cpu_data_master_write)
        begin
          $write("%0d ns: cpu_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            RamAndFlash_sopc_clock_0_in_readdata_from_sa,
                                            RamAndFlash_sopc_clock_0_in_waitrequest_from_sa,
                                            cfi_flash_s1_wait_counter_eq_0,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in,
                                            cpu_instruction_master_granted_cfi_flash_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in,
                                            cpu_instruction_master_qualified_request_cfi_flash_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in,
                                            cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in,
                                            cpu_instruction_master_requests_cfi_flash_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_RamAndFlash_sopc_clock_0_in_end_xfer,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_tri_state_bridge_avalon_slave_end_xfer,
                                            incoming_data_to_and_from_the_cfi_flash,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 24: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [  1: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input   [ 15: 0] RamAndFlash_sopc_clock_0_in_readdata_from_sa;
  input            RamAndFlash_sopc_clock_0_in_waitrequest_from_sa;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input   [ 24: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in;
  input            cpu_instruction_master_granted_cfi_flash_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in;
  input            cpu_instruction_master_qualified_request_cfi_flash_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in;
  input            cpu_instruction_master_read_data_valid_cfi_flash_s1;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in;
  input            cpu_instruction_master_requests_cfi_flash_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_RamAndFlash_sopc_clock_0_in_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_tri_state_bridge_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_instruction_master_latency_counter;
  wire    [  1: 0] cpu_instruction_master_next_dbs_rdv_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in | ~cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in) & ((~cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in | ~cpu_instruction_master_read | (1 & ~RamAndFlash_sopc_clock_0_in_waitrequest_from_sa & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_2 & r_3;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_requests_cfi_flash_s1);

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = (cpu_instruction_master_granted_cfi_flash_s1 | ~cpu_instruction_master_qualified_request_cfi_flash_s1) & ((~cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[24 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in |
    cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    (cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in & dbs_counter_overflow) |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = RamAndFlash_sopc_clock_0_in_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in & cpu_instruction_master_read)}} | {RamAndFlash_sopc_clock_0_in_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_instruction_master_requests_cfi_flash_s1}} & 2;

  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in)? 2 :
    (cpu_instruction_master_requests_cfi_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in & cpu_instruction_master_read & 1 & 1 & ~RamAndFlash_sopc_clock_0_in_waitrequest_from_sa) |
    ((cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer})));

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_data_to_and_from_the_cfi_flash;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_instruction_master_next_dbs_rdv_counter = cpu_instruction_master_dbs_rdv_counter + cpu_instruction_master_dbs_rdv_counter_inc;

  //cpu_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_instruction_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_instruction_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_instruction_master_dbs_rdv_counter[1] & ~cpu_instruction_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_latency_counter,
                                                 cpu_data_master_read,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 24: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h18050e0) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read & ~jtag_uart_avalon_jtag_slave_waits_for_read;

  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module mmc_spi_spi_control_port_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_data_master_address_to_slave,
                                              cpu_data_master_latency_counter,
                                              cpu_data_master_read,
                                              cpu_data_master_write,
                                              cpu_data_master_writedata,
                                              mmc_spi_spi_control_port_dataavailable,
                                              mmc_spi_spi_control_port_endofpacket,
                                              mmc_spi_spi_control_port_irq,
                                              mmc_spi_spi_control_port_readdata,
                                              mmc_spi_spi_control_port_readyfordata,
                                              reset_n,

                                             // outputs:
                                              cpu_data_master_granted_mmc_spi_spi_control_port,
                                              cpu_data_master_qualified_request_mmc_spi_spi_control_port,
                                              cpu_data_master_read_data_valid_mmc_spi_spi_control_port,
                                              cpu_data_master_requests_mmc_spi_spi_control_port,
                                              d1_mmc_spi_spi_control_port_end_xfer,
                                              mmc_spi_spi_control_port_address,
                                              mmc_spi_spi_control_port_chipselect,
                                              mmc_spi_spi_control_port_dataavailable_from_sa,
                                              mmc_spi_spi_control_port_endofpacket_from_sa,
                                              mmc_spi_spi_control_port_irq_from_sa,
                                              mmc_spi_spi_control_port_read_n,
                                              mmc_spi_spi_control_port_readdata_from_sa,
                                              mmc_spi_spi_control_port_readyfordata_from_sa,
                                              mmc_spi_spi_control_port_reset_n,
                                              mmc_spi_spi_control_port_write_n,
                                              mmc_spi_spi_control_port_writedata
                                           )
;

  output           cpu_data_master_granted_mmc_spi_spi_control_port;
  output           cpu_data_master_qualified_request_mmc_spi_spi_control_port;
  output           cpu_data_master_read_data_valid_mmc_spi_spi_control_port;
  output           cpu_data_master_requests_mmc_spi_spi_control_port;
  output           d1_mmc_spi_spi_control_port_end_xfer;
  output  [  2: 0] mmc_spi_spi_control_port_address;
  output           mmc_spi_spi_control_port_chipselect;
  output           mmc_spi_spi_control_port_dataavailable_from_sa;
  output           mmc_spi_spi_control_port_endofpacket_from_sa;
  output           mmc_spi_spi_control_port_irq_from_sa;
  output           mmc_spi_spi_control_port_read_n;
  output  [ 15: 0] mmc_spi_spi_control_port_readdata_from_sa;
  output           mmc_spi_spi_control_port_readyfordata_from_sa;
  output           mmc_spi_spi_control_port_reset_n;
  output           mmc_spi_spi_control_port_write_n;
  output  [ 15: 0] mmc_spi_spi_control_port_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            mmc_spi_spi_control_port_dataavailable;
  input            mmc_spi_spi_control_port_endofpacket;
  input            mmc_spi_spi_control_port_irq;
  input   [ 15: 0] mmc_spi_spi_control_port_readdata;
  input            mmc_spi_spi_control_port_readyfordata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_mmc_spi_spi_control_port;
  wire             cpu_data_master_qualified_request_mmc_spi_spi_control_port;
  wire             cpu_data_master_read_data_valid_mmc_spi_spi_control_port;
  wire             cpu_data_master_requests_mmc_spi_spi_control_port;
  wire             cpu_data_master_saved_grant_mmc_spi_spi_control_port;
  reg              d1_mmc_spi_spi_control_port_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_mmc_spi_spi_control_port;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] mmc_spi_spi_control_port_address;
  wire             mmc_spi_spi_control_port_allgrants;
  wire             mmc_spi_spi_control_port_allow_new_arb_cycle;
  wire             mmc_spi_spi_control_port_any_bursting_master_saved_grant;
  wire             mmc_spi_spi_control_port_any_continuerequest;
  wire             mmc_spi_spi_control_port_arb_counter_enable;
  reg     [  2: 0] mmc_spi_spi_control_port_arb_share_counter;
  wire    [  2: 0] mmc_spi_spi_control_port_arb_share_counter_next_value;
  wire    [  2: 0] mmc_spi_spi_control_port_arb_share_set_values;
  wire             mmc_spi_spi_control_port_beginbursttransfer_internal;
  wire             mmc_spi_spi_control_port_begins_xfer;
  wire             mmc_spi_spi_control_port_chipselect;
  wire             mmc_spi_spi_control_port_dataavailable_from_sa;
  wire             mmc_spi_spi_control_port_end_xfer;
  wire             mmc_spi_spi_control_port_endofpacket_from_sa;
  wire             mmc_spi_spi_control_port_firsttransfer;
  wire             mmc_spi_spi_control_port_grant_vector;
  wire             mmc_spi_spi_control_port_in_a_read_cycle;
  wire             mmc_spi_spi_control_port_in_a_write_cycle;
  wire             mmc_spi_spi_control_port_irq_from_sa;
  wire             mmc_spi_spi_control_port_master_qreq_vector;
  wire             mmc_spi_spi_control_port_non_bursting_master_requests;
  wire             mmc_spi_spi_control_port_read_n;
  wire    [ 15: 0] mmc_spi_spi_control_port_readdata_from_sa;
  wire             mmc_spi_spi_control_port_readyfordata_from_sa;
  reg              mmc_spi_spi_control_port_reg_firsttransfer;
  wire             mmc_spi_spi_control_port_reset_n;
  reg              mmc_spi_spi_control_port_slavearbiterlockenable;
  wire             mmc_spi_spi_control_port_slavearbiterlockenable2;
  wire             mmc_spi_spi_control_port_unreg_firsttransfer;
  wire             mmc_spi_spi_control_port_waits_for_read;
  wire             mmc_spi_spi_control_port_waits_for_write;
  wire             mmc_spi_spi_control_port_write_n;
  wire    [ 15: 0] mmc_spi_spi_control_port_writedata;
  wire    [ 24: 0] shifted_address_to_mmc_spi_spi_control_port_from_cpu_data_master;
  wire             wait_for_mmc_spi_spi_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~mmc_spi_spi_control_port_end_xfer;
    end


  assign mmc_spi_spi_control_port_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_mmc_spi_spi_control_port));
  //assign mmc_spi_spi_control_port_readdata_from_sa = mmc_spi_spi_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mmc_spi_spi_control_port_readdata_from_sa = mmc_spi_spi_control_port_readdata;

  assign cpu_data_master_requests_mmc_spi_spi_control_port = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1805060) & (cpu_data_master_read | cpu_data_master_write);
  //assign mmc_spi_spi_control_port_dataavailable_from_sa = mmc_spi_spi_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mmc_spi_spi_control_port_dataavailable_from_sa = mmc_spi_spi_control_port_dataavailable;

  //assign mmc_spi_spi_control_port_readyfordata_from_sa = mmc_spi_spi_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mmc_spi_spi_control_port_readyfordata_from_sa = mmc_spi_spi_control_port_readyfordata;

  //mmc_spi_spi_control_port_arb_share_counter set values, which is an e_mux
  assign mmc_spi_spi_control_port_arb_share_set_values = 1;

  //mmc_spi_spi_control_port_non_bursting_master_requests mux, which is an e_mux
  assign mmc_spi_spi_control_port_non_bursting_master_requests = cpu_data_master_requests_mmc_spi_spi_control_port;

  //mmc_spi_spi_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign mmc_spi_spi_control_port_any_bursting_master_saved_grant = 0;

  //mmc_spi_spi_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign mmc_spi_spi_control_port_arb_share_counter_next_value = mmc_spi_spi_control_port_firsttransfer ? (mmc_spi_spi_control_port_arb_share_set_values - 1) : |mmc_spi_spi_control_port_arb_share_counter ? (mmc_spi_spi_control_port_arb_share_counter - 1) : 0;

  //mmc_spi_spi_control_port_allgrants all slave grants, which is an e_mux
  assign mmc_spi_spi_control_port_allgrants = |mmc_spi_spi_control_port_grant_vector;

  //mmc_spi_spi_control_port_end_xfer assignment, which is an e_assign
  assign mmc_spi_spi_control_port_end_xfer = ~(mmc_spi_spi_control_port_waits_for_read | mmc_spi_spi_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_mmc_spi_spi_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_mmc_spi_spi_control_port = mmc_spi_spi_control_port_end_xfer & (~mmc_spi_spi_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //mmc_spi_spi_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign mmc_spi_spi_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_mmc_spi_spi_control_port & mmc_spi_spi_control_port_allgrants) | (end_xfer_arb_share_counter_term_mmc_spi_spi_control_port & ~mmc_spi_spi_control_port_non_bursting_master_requests);

  //mmc_spi_spi_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mmc_spi_spi_control_port_arb_share_counter <= 0;
      else if (mmc_spi_spi_control_port_arb_counter_enable)
          mmc_spi_spi_control_port_arb_share_counter <= mmc_spi_spi_control_port_arb_share_counter_next_value;
    end


  //mmc_spi_spi_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mmc_spi_spi_control_port_slavearbiterlockenable <= 0;
      else if ((|mmc_spi_spi_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_mmc_spi_spi_control_port) | (end_xfer_arb_share_counter_term_mmc_spi_spi_control_port & ~mmc_spi_spi_control_port_non_bursting_master_requests))
          mmc_spi_spi_control_port_slavearbiterlockenable <= |mmc_spi_spi_control_port_arb_share_counter_next_value;
    end


  //cpu/data_master mmc_spi/spi_control_port arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = mmc_spi_spi_control_port_slavearbiterlockenable & cpu_data_master_continuerequest;

  //mmc_spi_spi_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign mmc_spi_spi_control_port_slavearbiterlockenable2 = |mmc_spi_spi_control_port_arb_share_counter_next_value;

  //cpu/data_master mmc_spi/spi_control_port arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = mmc_spi_spi_control_port_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //mmc_spi_spi_control_port_any_continuerequest at least one master continues requesting, which is an e_assign
  assign mmc_spi_spi_control_port_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_mmc_spi_spi_control_port = cpu_data_master_requests_mmc_spi_spi_control_port & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_mmc_spi_spi_control_port, which is an e_mux
  assign cpu_data_master_read_data_valid_mmc_spi_spi_control_port = cpu_data_master_granted_mmc_spi_spi_control_port & cpu_data_master_read & ~mmc_spi_spi_control_port_waits_for_read;

  //mmc_spi_spi_control_port_writedata mux, which is an e_mux
  assign mmc_spi_spi_control_port_writedata = cpu_data_master_writedata;

  //assign mmc_spi_spi_control_port_endofpacket_from_sa = mmc_spi_spi_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mmc_spi_spi_control_port_endofpacket_from_sa = mmc_spi_spi_control_port_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_mmc_spi_spi_control_port = cpu_data_master_qualified_request_mmc_spi_spi_control_port;

  //cpu/data_master saved-grant mmc_spi/spi_control_port, which is an e_assign
  assign cpu_data_master_saved_grant_mmc_spi_spi_control_port = cpu_data_master_requests_mmc_spi_spi_control_port;

  //allow new arb cycle for mmc_spi/spi_control_port, which is an e_assign
  assign mmc_spi_spi_control_port_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign mmc_spi_spi_control_port_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign mmc_spi_spi_control_port_master_qreq_vector = 1;

  //mmc_spi_spi_control_port_reset_n assignment, which is an e_assign
  assign mmc_spi_spi_control_port_reset_n = reset_n;

  assign mmc_spi_spi_control_port_chipselect = cpu_data_master_granted_mmc_spi_spi_control_port;
  //mmc_spi_spi_control_port_firsttransfer first transaction, which is an e_assign
  assign mmc_spi_spi_control_port_firsttransfer = mmc_spi_spi_control_port_begins_xfer ? mmc_spi_spi_control_port_unreg_firsttransfer : mmc_spi_spi_control_port_reg_firsttransfer;

  //mmc_spi_spi_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign mmc_spi_spi_control_port_unreg_firsttransfer = ~(mmc_spi_spi_control_port_slavearbiterlockenable & mmc_spi_spi_control_port_any_continuerequest);

  //mmc_spi_spi_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mmc_spi_spi_control_port_reg_firsttransfer <= 1'b1;
      else if (mmc_spi_spi_control_port_begins_xfer)
          mmc_spi_spi_control_port_reg_firsttransfer <= mmc_spi_spi_control_port_unreg_firsttransfer;
    end


  //mmc_spi_spi_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign mmc_spi_spi_control_port_beginbursttransfer_internal = mmc_spi_spi_control_port_begins_xfer;

  //~mmc_spi_spi_control_port_read_n assignment, which is an e_mux
  assign mmc_spi_spi_control_port_read_n = ~(cpu_data_master_granted_mmc_spi_spi_control_port & cpu_data_master_read);

  //~mmc_spi_spi_control_port_write_n assignment, which is an e_mux
  assign mmc_spi_spi_control_port_write_n = ~(cpu_data_master_granted_mmc_spi_spi_control_port & cpu_data_master_write);

  assign shifted_address_to_mmc_spi_spi_control_port_from_cpu_data_master = cpu_data_master_address_to_slave;
  //mmc_spi_spi_control_port_address mux, which is an e_mux
  assign mmc_spi_spi_control_port_address = shifted_address_to_mmc_spi_spi_control_port_from_cpu_data_master >> 2;

  //d1_mmc_spi_spi_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_mmc_spi_spi_control_port_end_xfer <= 1;
      else 
        d1_mmc_spi_spi_control_port_end_xfer <= mmc_spi_spi_control_port_end_xfer;
    end


  //mmc_spi_spi_control_port_waits_for_read in a cycle, which is an e_mux
  assign mmc_spi_spi_control_port_waits_for_read = mmc_spi_spi_control_port_in_a_read_cycle & mmc_spi_spi_control_port_begins_xfer;

  //mmc_spi_spi_control_port_in_a_read_cycle assignment, which is an e_assign
  assign mmc_spi_spi_control_port_in_a_read_cycle = cpu_data_master_granted_mmc_spi_spi_control_port & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = mmc_spi_spi_control_port_in_a_read_cycle;

  //mmc_spi_spi_control_port_waits_for_write in a cycle, which is an e_mux
  assign mmc_spi_spi_control_port_waits_for_write = mmc_spi_spi_control_port_in_a_write_cycle & mmc_spi_spi_control_port_begins_xfer;

  //mmc_spi_spi_control_port_in_a_write_cycle assignment, which is an e_assign
  assign mmc_spi_spi_control_port_in_a_write_cycle = cpu_data_master_granted_mmc_spi_spi_control_port & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = mmc_spi_spi_control_port_in_a_write_cycle;

  assign wait_for_mmc_spi_spi_control_port_counter = 0;
  //assign mmc_spi_spi_control_port_irq_from_sa = mmc_spi_spi_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign mmc_spi_spi_control_port_irq_from_sa = mmc_spi_spi_control_port_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //mmc_spi/spi_control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_memory_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_data_master_address_to_slave,
                                      cpu_data_master_byteenable,
                                      cpu_data_master_latency_counter,
                                      cpu_data_master_read,
                                      cpu_data_master_write,
                                      cpu_data_master_writedata,
                                      onchip_memory_s1_readdata,
                                      reset_n,

                                     // outputs:
                                      cpu_data_master_granted_onchip_memory_s1,
                                      cpu_data_master_qualified_request_onchip_memory_s1,
                                      cpu_data_master_read_data_valid_onchip_memory_s1,
                                      cpu_data_master_requests_onchip_memory_s1,
                                      d1_onchip_memory_s1_end_xfer,
                                      onchip_memory_s1_address,
                                      onchip_memory_s1_byteenable,
                                      onchip_memory_s1_chipselect,
                                      onchip_memory_s1_clken,
                                      onchip_memory_s1_readdata_from_sa,
                                      onchip_memory_s1_reset,
                                      onchip_memory_s1_write,
                                      onchip_memory_s1_writedata
                                   )
;

  output           cpu_data_master_granted_onchip_memory_s1;
  output           cpu_data_master_qualified_request_onchip_memory_s1;
  output           cpu_data_master_read_data_valid_onchip_memory_s1;
  output           cpu_data_master_requests_onchip_memory_s1;
  output           d1_onchip_memory_s1_end_xfer;
  output  [ 10: 0] onchip_memory_s1_address;
  output  [  3: 0] onchip_memory_s1_byteenable;
  output           onchip_memory_s1_chipselect;
  output           onchip_memory_s1_clken;
  output  [ 31: 0] onchip_memory_s1_readdata_from_sa;
  output           onchip_memory_s1_reset;
  output           onchip_memory_s1_write;
  output  [ 31: 0] onchip_memory_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] onchip_memory_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_memory_s1;
  wire             cpu_data_master_qualified_request_onchip_memory_s1;
  wire             cpu_data_master_read_data_valid_onchip_memory_s1;
  reg              cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_memory_s1;
  wire             cpu_data_master_saved_grant_onchip_memory_s1;
  reg              d1_onchip_memory_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 10: 0] onchip_memory_s1_address;
  wire             onchip_memory_s1_allgrants;
  wire             onchip_memory_s1_allow_new_arb_cycle;
  wire             onchip_memory_s1_any_bursting_master_saved_grant;
  wire             onchip_memory_s1_any_continuerequest;
  wire             onchip_memory_s1_arb_counter_enable;
  reg     [  2: 0] onchip_memory_s1_arb_share_counter;
  wire    [  2: 0] onchip_memory_s1_arb_share_counter_next_value;
  wire    [  2: 0] onchip_memory_s1_arb_share_set_values;
  wire             onchip_memory_s1_beginbursttransfer_internal;
  wire             onchip_memory_s1_begins_xfer;
  wire    [  3: 0] onchip_memory_s1_byteenable;
  wire             onchip_memory_s1_chipselect;
  wire             onchip_memory_s1_clken;
  wire             onchip_memory_s1_end_xfer;
  wire             onchip_memory_s1_firsttransfer;
  wire             onchip_memory_s1_grant_vector;
  wire             onchip_memory_s1_in_a_read_cycle;
  wire             onchip_memory_s1_in_a_write_cycle;
  wire             onchip_memory_s1_master_qreq_vector;
  wire             onchip_memory_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory_s1_readdata_from_sa;
  reg              onchip_memory_s1_reg_firsttransfer;
  wire             onchip_memory_s1_reset;
  reg              onchip_memory_s1_slavearbiterlockenable;
  wire             onchip_memory_s1_slavearbiterlockenable2;
  wire             onchip_memory_s1_unreg_firsttransfer;
  wire             onchip_memory_s1_waits_for_read;
  wire             onchip_memory_s1_waits_for_write;
  wire             onchip_memory_s1_write;
  wire    [ 31: 0] onchip_memory_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;
  wire    [ 24: 0] shifted_address_to_onchip_memory_s1_from_cpu_data_master;
  wire             wait_for_onchip_memory_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory_s1_end_xfer;
    end


  assign onchip_memory_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_memory_s1));
  //assign onchip_memory_s1_readdata_from_sa = onchip_memory_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory_s1_readdata_from_sa = onchip_memory_s1_readdata;

  assign cpu_data_master_requests_onchip_memory_s1 = ({cpu_data_master_address_to_slave[24 : 13] , 13'b0} == 25'h1800000) & (cpu_data_master_read | cpu_data_master_write);
  //onchip_memory_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory_s1_arb_share_set_values = 1;

  //onchip_memory_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_memory_s1;

  //onchip_memory_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory_s1_arb_share_counter_next_value = onchip_memory_s1_firsttransfer ? (onchip_memory_s1_arb_share_set_values - 1) : |onchip_memory_s1_arb_share_counter ? (onchip_memory_s1_arb_share_counter - 1) : 0;

  //onchip_memory_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory_s1_allgrants = |onchip_memory_s1_grant_vector;

  //onchip_memory_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory_s1_end_xfer = ~(onchip_memory_s1_waits_for_read | onchip_memory_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory_s1 = onchip_memory_s1_end_xfer & (~onchip_memory_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory_s1 & onchip_memory_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory_s1 & ~onchip_memory_s1_non_bursting_master_requests);

  //onchip_memory_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_arb_share_counter <= 0;
      else if (onchip_memory_s1_arb_counter_enable)
          onchip_memory_s1_arb_share_counter <= onchip_memory_s1_arb_share_counter_next_value;
    end


  //onchip_memory_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory_s1) | (end_xfer_arb_share_counter_term_onchip_memory_s1 & ~onchip_memory_s1_non_bursting_master_requests))
          onchip_memory_s1_slavearbiterlockenable <= |onchip_memory_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_memory/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_memory_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_memory_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory_s1_slavearbiterlockenable2 = |onchip_memory_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_memory/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_memory_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //onchip_memory_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign onchip_memory_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_onchip_memory_s1 = cpu_data_master_requests_onchip_memory_s1 & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter))));
  //cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in = cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_read & ~onchip_memory_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_onchip_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_memory_s1_shift_register = {cpu_data_master_read_data_valid_onchip_memory_s1_shift_register, cpu_data_master_read_data_valid_onchip_memory_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_memory_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_onchip_memory_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_memory_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_memory_s1 = cpu_data_master_read_data_valid_onchip_memory_s1_shift_register;

  //onchip_memory_s1_writedata mux, which is an e_mux
  assign onchip_memory_s1_writedata = cpu_data_master_writedata;

  //mux onchip_memory_s1_clken, which is an e_mux
  assign onchip_memory_s1_clken = 1'b1;

  //master is always granted when requested
  assign cpu_data_master_granted_onchip_memory_s1 = cpu_data_master_qualified_request_onchip_memory_s1;

  //cpu/data_master saved-grant onchip_memory/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_memory_s1 = cpu_data_master_requests_onchip_memory_s1;

  //allow new arb cycle for onchip_memory/s1, which is an e_assign
  assign onchip_memory_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign onchip_memory_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign onchip_memory_s1_master_qreq_vector = 1;

  //~onchip_memory_s1_reset assignment, which is an e_assign
  assign onchip_memory_s1_reset = ~reset_n;

  assign onchip_memory_s1_chipselect = cpu_data_master_granted_onchip_memory_s1;
  //onchip_memory_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_s1_firsttransfer = onchip_memory_s1_begins_xfer ? onchip_memory_s1_unreg_firsttransfer : onchip_memory_s1_reg_firsttransfer;

  //onchip_memory_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_s1_unreg_firsttransfer = ~(onchip_memory_s1_slavearbiterlockenable & onchip_memory_s1_any_continuerequest);

  //onchip_memory_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory_s1_begins_xfer)
          onchip_memory_s1_reg_firsttransfer <= onchip_memory_s1_unreg_firsttransfer;
    end


  //onchip_memory_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory_s1_beginbursttransfer_internal = onchip_memory_s1_begins_xfer;

  //onchip_memory_s1_write assignment, which is an e_mux
  assign onchip_memory_s1_write = cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_memory_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_memory_s1_address mux, which is an e_mux
  assign onchip_memory_s1_address = shifted_address_to_onchip_memory_s1_from_cpu_data_master >> 2;

  //d1_onchip_memory_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory_s1_end_xfer <= 1;
      else 
        d1_onchip_memory_s1_end_xfer <= onchip_memory_s1_end_xfer;
    end


  //onchip_memory_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory_s1_waits_for_read = onchip_memory_s1_in_a_read_cycle & 0;

  //onchip_memory_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory_s1_in_a_read_cycle = cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory_s1_in_a_read_cycle;

  //onchip_memory_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory_s1_waits_for_write = onchip_memory_s1_in_a_write_cycle & 0;

  //onchip_memory_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory_s1_in_a_write_cycle = cpu_data_master_granted_onchip_memory_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory_s1_in_a_write_cycle;

  assign wait_for_onchip_memory_s1_counter = 0;
  //onchip_memory_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory_s1_byteenable = (cpu_data_master_granted_onchip_memory_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_memory_s2_arbitrator (
                                     // inputs:
                                      clk,
                                      onchip_memory_s2_readdata,
                                      reset_n,
                                      video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave,
                                      video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter,
                                      video_pixel_buffer_dma_avalon_pixel_dma_master_read,

                                     // outputs:
                                      d1_onchip_memory_s2_end_xfer,
                                      onchip_memory_s2_address,
                                      onchip_memory_s2_byteenable,
                                      onchip_memory_s2_chipselect,
                                      onchip_memory_s2_clken,
                                      onchip_memory_s2_readdata_from_sa,
                                      onchip_memory_s2_reset,
                                      onchip_memory_s2_write,
                                      onchip_memory_s2_writedata,
                                      video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2,
                                      video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2,
                                      video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2,
                                      video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2
                                   )
;

  output           d1_onchip_memory_s2_end_xfer;
  output  [ 10: 0] onchip_memory_s2_address;
  output  [  3: 0] onchip_memory_s2_byteenable;
  output           onchip_memory_s2_chipselect;
  output           onchip_memory_s2_clken;
  output  [ 31: 0] onchip_memory_s2_readdata_from_sa;
  output           onchip_memory_s2_reset;
  output           onchip_memory_s2_write;
  output  [ 31: 0] onchip_memory_s2_writedata;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2;
  input            clk;
  input   [ 31: 0] onchip_memory_s2_readdata;
  input            reset_n;
  input   [ 31: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave;
  input            video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter;
  input            video_pixel_buffer_dma_avalon_pixel_dma_master_read;

  reg              d1_onchip_memory_s2_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 10: 0] onchip_memory_s2_address;
  wire             onchip_memory_s2_allow_new_arb_cycle;
  wire             onchip_memory_s2_any_continuerequest;
  wire             onchip_memory_s2_beginbursttransfer_internal;
  wire             onchip_memory_s2_begins_xfer;
  wire    [  3: 0] onchip_memory_s2_byteenable;
  wire             onchip_memory_s2_chipselect;
  wire             onchip_memory_s2_clken;
  wire             onchip_memory_s2_end_xfer;
  wire             onchip_memory_s2_firsttransfer;
  wire             onchip_memory_s2_grant_vector;
  wire             onchip_memory_s2_in_a_read_cycle;
  wire             onchip_memory_s2_in_a_write_cycle;
  wire             onchip_memory_s2_master_qreq_vector;
  wire    [ 31: 0] onchip_memory_s2_readdata_from_sa;
  reg              onchip_memory_s2_reg_firsttransfer;
  wire             onchip_memory_s2_reset;
  wire             onchip_memory_s2_slavearbiterlockenable;
  wire             onchip_memory_s2_unreg_firsttransfer;
  wire             onchip_memory_s2_waits_for_read;
  wire             onchip_memory_s2_waits_for_write;
  wire             onchip_memory_s2_write;
  wire    [ 31: 0] onchip_memory_s2_writedata;
  wire             p1_video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register;
  wire             saved_chosen_master_btw_video_pixel_buffer_dma_avalon_pixel_dma_master_and_onchip_memory_s2;
  wire    [ 31: 0] shifted_address_to_onchip_memory_s2_from_video_pixel_buffer_dma_avalon_pixel_dma_master;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_continuerequest;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2;
  reg              video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register_in;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_saved_grant_onchip_memory_s2;
  wire             wait_for_onchip_memory_s2_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory_s2_end_xfer;
    end


  assign onchip_memory_s2_begins_xfer = ~d1_reasons_to_wait & ((video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2));
  //assign onchip_memory_s2_readdata_from_sa = onchip_memory_s2_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory_s2_readdata_from_sa = onchip_memory_s2_readdata;

  assign video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2 = (({video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave[31 : 13] , 13'b0} == 32'h1800000) & (video_pixel_buffer_dma_avalon_pixel_dma_master_read)) & video_pixel_buffer_dma_avalon_pixel_dma_master_read;
  //dummy onchip_memory_s2_slavearbiterlockenable, which is an e_assign
  assign onchip_memory_s2_slavearbiterlockenable = 0;

  //onchip_memory_s2_any_continuerequest at least one master continues requesting, which is an e_assign
  assign onchip_memory_s2_any_continuerequest = 1;

  //video_pixel_buffer_dma_avalon_pixel_dma_master_continuerequest continued request, which is an e_assign
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_continuerequest = 1;

  assign video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2 = video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2;
  //video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register_in mux for readlatency shift register, which is an e_mux
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register_in = video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2 & video_pixel_buffer_dma_avalon_pixel_dma_master_read & ~onchip_memory_s2_waits_for_read;

  //shift register p1 video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register = {video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register, video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register_in};

  //video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register <= 0;
      else 
        video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register <= p1_video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register;
    end


  //local readdatavalid video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2, which is an e_mux
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2 = video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2_shift_register;

  //mux onchip_memory_s2_clken, which is an e_mux
  assign onchip_memory_s2_clken = 1'b1;

  //master is always granted when requested
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2 = video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2;

  //video_pixel_buffer_dma/avalon_pixel_dma_master saved-grant onchip_memory/s2, which is an e_assign
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_saved_grant_onchip_memory_s2 = video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2;

  //saved chosen master btw video_pixel_buffer_dma/avalon_pixel_dma_master and onchip_memory/s2, which is an e_assign
  assign saved_chosen_master_btw_video_pixel_buffer_dma_avalon_pixel_dma_master_and_onchip_memory_s2 = video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2;

  //allow new arb cycle for onchip_memory/s2, which is an e_assign
  assign onchip_memory_s2_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign onchip_memory_s2_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign onchip_memory_s2_master_qreq_vector = 1;

  //~onchip_memory_s2_reset assignment, which is an e_assign
  assign onchip_memory_s2_reset = ~reset_n;

  assign onchip_memory_s2_chipselect = video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2;
  //onchip_memory_s2_end_xfer assignment, which is an e_assign
  assign onchip_memory_s2_end_xfer = ~(onchip_memory_s2_waits_for_read | onchip_memory_s2_waits_for_write);

  //onchip_memory_s2_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_s2_firsttransfer = onchip_memory_s2_begins_xfer ? onchip_memory_s2_unreg_firsttransfer : onchip_memory_s2_reg_firsttransfer;

  //onchip_memory_s2_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory_s2_unreg_firsttransfer = ~(onchip_memory_s2_slavearbiterlockenable & onchip_memory_s2_any_continuerequest);

  //onchip_memory_s2_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory_s2_reg_firsttransfer <= 1'b1;
      else if (onchip_memory_s2_begins_xfer)
          onchip_memory_s2_reg_firsttransfer <= onchip_memory_s2_unreg_firsttransfer;
    end


  //onchip_memory_s2_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory_s2_beginbursttransfer_internal = onchip_memory_s2_begins_xfer;

  //onchip_memory_s2_write assignment, which is an e_mux
  assign onchip_memory_s2_write = 0;

  assign shifted_address_to_onchip_memory_s2_from_video_pixel_buffer_dma_avalon_pixel_dma_master = video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave;
  //onchip_memory_s2_address mux, which is an e_mux
  assign onchip_memory_s2_address = shifted_address_to_onchip_memory_s2_from_video_pixel_buffer_dma_avalon_pixel_dma_master >> 2;

  //d1_onchip_memory_s2_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory_s2_end_xfer <= 1;
      else 
        d1_onchip_memory_s2_end_xfer <= onchip_memory_s2_end_xfer;
    end


  //onchip_memory_s2_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory_s2_waits_for_read = onchip_memory_s2_in_a_read_cycle & 0;

  //onchip_memory_s2_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory_s2_in_a_read_cycle = video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2 & video_pixel_buffer_dma_avalon_pixel_dma_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory_s2_in_a_read_cycle;

  //onchip_memory_s2_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory_s2_waits_for_write = onchip_memory_s2_in_a_write_cycle & 0;

  //onchip_memory_s2_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory_s2_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory_s2_in_a_write_cycle;

  assign wait_for_onchip_memory_s2_counter = 0;
  //onchip_memory_s2_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory_s2_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory/s2 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_btn0_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_latency_counter,
                                 cpu_data_master_read,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 pio_btn0_s1_irq,
                                 pio_btn0_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_pio_btn0_s1,
                                 cpu_data_master_qualified_request_pio_btn0_s1,
                                 cpu_data_master_read_data_valid_pio_btn0_s1,
                                 cpu_data_master_requests_pio_btn0_s1,
                                 d1_pio_btn0_s1_end_xfer,
                                 pio_btn0_s1_address,
                                 pio_btn0_s1_chipselect,
                                 pio_btn0_s1_irq_from_sa,
                                 pio_btn0_s1_readdata_from_sa,
                                 pio_btn0_s1_reset_n,
                                 pio_btn0_s1_write_n,
                                 pio_btn0_s1_writedata
                              )
;

  output           cpu_data_master_granted_pio_btn0_s1;
  output           cpu_data_master_qualified_request_pio_btn0_s1;
  output           cpu_data_master_read_data_valid_pio_btn0_s1;
  output           cpu_data_master_requests_pio_btn0_s1;
  output           d1_pio_btn0_s1_end_xfer;
  output  [  1: 0] pio_btn0_s1_address;
  output           pio_btn0_s1_chipselect;
  output           pio_btn0_s1_irq_from_sa;
  output  [  2: 0] pio_btn0_s1_readdata_from_sa;
  output           pio_btn0_s1_reset_n;
  output           pio_btn0_s1_write_n;
  output  [  2: 0] pio_btn0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            pio_btn0_s1_irq;
  input   [  2: 0] pio_btn0_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pio_btn0_s1;
  wire             cpu_data_master_qualified_request_pio_btn0_s1;
  wire             cpu_data_master_read_data_valid_pio_btn0_s1;
  wire             cpu_data_master_requests_pio_btn0_s1;
  wire             cpu_data_master_saved_grant_pio_btn0_s1;
  reg              d1_pio_btn0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_btn0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_btn0_s1_address;
  wire             pio_btn0_s1_allgrants;
  wire             pio_btn0_s1_allow_new_arb_cycle;
  wire             pio_btn0_s1_any_bursting_master_saved_grant;
  wire             pio_btn0_s1_any_continuerequest;
  wire             pio_btn0_s1_arb_counter_enable;
  reg     [  2: 0] pio_btn0_s1_arb_share_counter;
  wire    [  2: 0] pio_btn0_s1_arb_share_counter_next_value;
  wire    [  2: 0] pio_btn0_s1_arb_share_set_values;
  wire             pio_btn0_s1_beginbursttransfer_internal;
  wire             pio_btn0_s1_begins_xfer;
  wire             pio_btn0_s1_chipselect;
  wire             pio_btn0_s1_end_xfer;
  wire             pio_btn0_s1_firsttransfer;
  wire             pio_btn0_s1_grant_vector;
  wire             pio_btn0_s1_in_a_read_cycle;
  wire             pio_btn0_s1_in_a_write_cycle;
  wire             pio_btn0_s1_irq_from_sa;
  wire             pio_btn0_s1_master_qreq_vector;
  wire             pio_btn0_s1_non_bursting_master_requests;
  wire    [  2: 0] pio_btn0_s1_readdata_from_sa;
  reg              pio_btn0_s1_reg_firsttransfer;
  wire             pio_btn0_s1_reset_n;
  reg              pio_btn0_s1_slavearbiterlockenable;
  wire             pio_btn0_s1_slavearbiterlockenable2;
  wire             pio_btn0_s1_unreg_firsttransfer;
  wire             pio_btn0_s1_waits_for_read;
  wire             pio_btn0_s1_waits_for_write;
  wire             pio_btn0_s1_write_n;
  wire    [  2: 0] pio_btn0_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_btn0_s1_from_cpu_data_master;
  wire             wait_for_pio_btn0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_btn0_s1_end_xfer;
    end


  assign pio_btn0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pio_btn0_s1));
  //assign pio_btn0_s1_readdata_from_sa = pio_btn0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_btn0_s1_readdata_from_sa = pio_btn0_s1_readdata;

  assign cpu_data_master_requests_pio_btn0_s1 = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18050b0) & (cpu_data_master_read | cpu_data_master_write);
  //pio_btn0_s1_arb_share_counter set values, which is an e_mux
  assign pio_btn0_s1_arb_share_set_values = 1;

  //pio_btn0_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_btn0_s1_non_bursting_master_requests = cpu_data_master_requests_pio_btn0_s1;

  //pio_btn0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_btn0_s1_any_bursting_master_saved_grant = 0;

  //pio_btn0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_btn0_s1_arb_share_counter_next_value = pio_btn0_s1_firsttransfer ? (pio_btn0_s1_arb_share_set_values - 1) : |pio_btn0_s1_arb_share_counter ? (pio_btn0_s1_arb_share_counter - 1) : 0;

  //pio_btn0_s1_allgrants all slave grants, which is an e_mux
  assign pio_btn0_s1_allgrants = |pio_btn0_s1_grant_vector;

  //pio_btn0_s1_end_xfer assignment, which is an e_assign
  assign pio_btn0_s1_end_xfer = ~(pio_btn0_s1_waits_for_read | pio_btn0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_btn0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_btn0_s1 = pio_btn0_s1_end_xfer & (~pio_btn0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_btn0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_btn0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_btn0_s1 & pio_btn0_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_btn0_s1 & ~pio_btn0_s1_non_bursting_master_requests);

  //pio_btn0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_btn0_s1_arb_share_counter <= 0;
      else if (pio_btn0_s1_arb_counter_enable)
          pio_btn0_s1_arb_share_counter <= pio_btn0_s1_arb_share_counter_next_value;
    end


  //pio_btn0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_btn0_s1_slavearbiterlockenable <= 0;
      else if ((|pio_btn0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_btn0_s1) | (end_xfer_arb_share_counter_term_pio_btn0_s1 & ~pio_btn0_s1_non_bursting_master_requests))
          pio_btn0_s1_slavearbiterlockenable <= |pio_btn0_s1_arb_share_counter_next_value;
    end


  //cpu/data_master pio_btn0/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pio_btn0_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pio_btn0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_btn0_s1_slavearbiterlockenable2 = |pio_btn0_s1_arb_share_counter_next_value;

  //cpu/data_master pio_btn0/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pio_btn0_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pio_btn0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_btn0_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pio_btn0_s1 = cpu_data_master_requests_pio_btn0_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_pio_btn0_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_pio_btn0_s1 = cpu_data_master_granted_pio_btn0_s1 & cpu_data_master_read & ~pio_btn0_s1_waits_for_read;

  //pio_btn0_s1_writedata mux, which is an e_mux
  assign pio_btn0_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_pio_btn0_s1 = cpu_data_master_qualified_request_pio_btn0_s1;

  //cpu/data_master saved-grant pio_btn0/s1, which is an e_assign
  assign cpu_data_master_saved_grant_pio_btn0_s1 = cpu_data_master_requests_pio_btn0_s1;

  //allow new arb cycle for pio_btn0/s1, which is an e_assign
  assign pio_btn0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_btn0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_btn0_s1_master_qreq_vector = 1;

  //pio_btn0_s1_reset_n assignment, which is an e_assign
  assign pio_btn0_s1_reset_n = reset_n;

  assign pio_btn0_s1_chipselect = cpu_data_master_granted_pio_btn0_s1;
  //pio_btn0_s1_firsttransfer first transaction, which is an e_assign
  assign pio_btn0_s1_firsttransfer = pio_btn0_s1_begins_xfer ? pio_btn0_s1_unreg_firsttransfer : pio_btn0_s1_reg_firsttransfer;

  //pio_btn0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_btn0_s1_unreg_firsttransfer = ~(pio_btn0_s1_slavearbiterlockenable & pio_btn0_s1_any_continuerequest);

  //pio_btn0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_btn0_s1_reg_firsttransfer <= 1'b1;
      else if (pio_btn0_s1_begins_xfer)
          pio_btn0_s1_reg_firsttransfer <= pio_btn0_s1_unreg_firsttransfer;
    end


  //pio_btn0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_btn0_s1_beginbursttransfer_internal = pio_btn0_s1_begins_xfer;

  //~pio_btn0_s1_write_n assignment, which is an e_mux
  assign pio_btn0_s1_write_n = ~(cpu_data_master_granted_pio_btn0_s1 & cpu_data_master_write);

  assign shifted_address_to_pio_btn0_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pio_btn0_s1_address mux, which is an e_mux
  assign pio_btn0_s1_address = shifted_address_to_pio_btn0_s1_from_cpu_data_master >> 2;

  //d1_pio_btn0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_btn0_s1_end_xfer <= 1;
      else 
        d1_pio_btn0_s1_end_xfer <= pio_btn0_s1_end_xfer;
    end


  //pio_btn0_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_btn0_s1_waits_for_read = pio_btn0_s1_in_a_read_cycle & pio_btn0_s1_begins_xfer;

  //pio_btn0_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_btn0_s1_in_a_read_cycle = cpu_data_master_granted_pio_btn0_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_btn0_s1_in_a_read_cycle;

  //pio_btn0_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_btn0_s1_waits_for_write = pio_btn0_s1_in_a_write_cycle & 0;

  //pio_btn0_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_btn0_s1_in_a_write_cycle = cpu_data_master_granted_pio_btn0_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_btn0_s1_in_a_write_cycle;

  assign wait_for_pio_btn0_s1_counter = 0;
  //assign pio_btn0_s1_irq_from_sa = pio_btn0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_btn0_s1_irq_from_sa = pio_btn0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_btn0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_led_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_data_master_address_to_slave,
                                cpu_data_master_latency_counter,
                                cpu_data_master_read,
                                cpu_data_master_write,
                                cpu_data_master_writedata,
                                pio_led_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_data_master_granted_pio_led_s1,
                                cpu_data_master_qualified_request_pio_led_s1,
                                cpu_data_master_read_data_valid_pio_led_s1,
                                cpu_data_master_requests_pio_led_s1,
                                d1_pio_led_s1_end_xfer,
                                pio_led_s1_address,
                                pio_led_s1_chipselect,
                                pio_led_s1_readdata_from_sa,
                                pio_led_s1_reset_n,
                                pio_led_s1_write_n,
                                pio_led_s1_writedata
                             )
;

  output           cpu_data_master_granted_pio_led_s1;
  output           cpu_data_master_qualified_request_pio_led_s1;
  output           cpu_data_master_read_data_valid_pio_led_s1;
  output           cpu_data_master_requests_pio_led_s1;
  output           d1_pio_led_s1_end_xfer;
  output  [  1: 0] pio_led_s1_address;
  output           pio_led_s1_chipselect;
  output  [ 10: 0] pio_led_s1_readdata_from_sa;
  output           pio_led_s1_reset_n;
  output           pio_led_s1_write_n;
  output  [ 10: 0] pio_led_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 10: 0] pio_led_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pio_led_s1;
  wire             cpu_data_master_qualified_request_pio_led_s1;
  wire             cpu_data_master_read_data_valid_pio_led_s1;
  wire             cpu_data_master_requests_pio_led_s1;
  wire             cpu_data_master_saved_grant_pio_led_s1;
  reg              d1_pio_led_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_led_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_led_s1_address;
  wire             pio_led_s1_allgrants;
  wire             pio_led_s1_allow_new_arb_cycle;
  wire             pio_led_s1_any_bursting_master_saved_grant;
  wire             pio_led_s1_any_continuerequest;
  wire             pio_led_s1_arb_counter_enable;
  reg     [  2: 0] pio_led_s1_arb_share_counter;
  wire    [  2: 0] pio_led_s1_arb_share_counter_next_value;
  wire    [  2: 0] pio_led_s1_arb_share_set_values;
  wire             pio_led_s1_beginbursttransfer_internal;
  wire             pio_led_s1_begins_xfer;
  wire             pio_led_s1_chipselect;
  wire             pio_led_s1_end_xfer;
  wire             pio_led_s1_firsttransfer;
  wire             pio_led_s1_grant_vector;
  wire             pio_led_s1_in_a_read_cycle;
  wire             pio_led_s1_in_a_write_cycle;
  wire             pio_led_s1_master_qreq_vector;
  wire             pio_led_s1_non_bursting_master_requests;
  wire    [ 10: 0] pio_led_s1_readdata_from_sa;
  reg              pio_led_s1_reg_firsttransfer;
  wire             pio_led_s1_reset_n;
  reg              pio_led_s1_slavearbiterlockenable;
  wire             pio_led_s1_slavearbiterlockenable2;
  wire             pio_led_s1_unreg_firsttransfer;
  wire             pio_led_s1_waits_for_read;
  wire             pio_led_s1_waits_for_write;
  wire             pio_led_s1_write_n;
  wire    [ 10: 0] pio_led_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_led_s1_from_cpu_data_master;
  wire             wait_for_pio_led_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_led_s1_end_xfer;
    end


  assign pio_led_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pio_led_s1));
  //assign pio_led_s1_readdata_from_sa = pio_led_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_led_s1_readdata_from_sa = pio_led_s1_readdata;

  assign cpu_data_master_requests_pio_led_s1 = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1805090) & (cpu_data_master_read | cpu_data_master_write);
  //pio_led_s1_arb_share_counter set values, which is an e_mux
  assign pio_led_s1_arb_share_set_values = 1;

  //pio_led_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_led_s1_non_bursting_master_requests = cpu_data_master_requests_pio_led_s1;

  //pio_led_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_led_s1_any_bursting_master_saved_grant = 0;

  //pio_led_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_led_s1_arb_share_counter_next_value = pio_led_s1_firsttransfer ? (pio_led_s1_arb_share_set_values - 1) : |pio_led_s1_arb_share_counter ? (pio_led_s1_arb_share_counter - 1) : 0;

  //pio_led_s1_allgrants all slave grants, which is an e_mux
  assign pio_led_s1_allgrants = |pio_led_s1_grant_vector;

  //pio_led_s1_end_xfer assignment, which is an e_assign
  assign pio_led_s1_end_xfer = ~(pio_led_s1_waits_for_read | pio_led_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_led_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_led_s1 = pio_led_s1_end_xfer & (~pio_led_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_led_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_led_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_led_s1 & pio_led_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_led_s1 & ~pio_led_s1_non_bursting_master_requests);

  //pio_led_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_arb_share_counter <= 0;
      else if (pio_led_s1_arb_counter_enable)
          pio_led_s1_arb_share_counter <= pio_led_s1_arb_share_counter_next_value;
    end


  //pio_led_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_slavearbiterlockenable <= 0;
      else if ((|pio_led_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_led_s1) | (end_xfer_arb_share_counter_term_pio_led_s1 & ~pio_led_s1_non_bursting_master_requests))
          pio_led_s1_slavearbiterlockenable <= |pio_led_s1_arb_share_counter_next_value;
    end


  //cpu/data_master pio_led/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pio_led_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pio_led_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_led_s1_slavearbiterlockenable2 = |pio_led_s1_arb_share_counter_next_value;

  //cpu/data_master pio_led/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pio_led_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pio_led_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_led_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pio_led_s1 = cpu_data_master_requests_pio_led_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_pio_led_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_pio_led_s1 = cpu_data_master_granted_pio_led_s1 & cpu_data_master_read & ~pio_led_s1_waits_for_read;

  //pio_led_s1_writedata mux, which is an e_mux
  assign pio_led_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_pio_led_s1 = cpu_data_master_qualified_request_pio_led_s1;

  //cpu/data_master saved-grant pio_led/s1, which is an e_assign
  assign cpu_data_master_saved_grant_pio_led_s1 = cpu_data_master_requests_pio_led_s1;

  //allow new arb cycle for pio_led/s1, which is an e_assign
  assign pio_led_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_led_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_led_s1_master_qreq_vector = 1;

  //pio_led_s1_reset_n assignment, which is an e_assign
  assign pio_led_s1_reset_n = reset_n;

  assign pio_led_s1_chipselect = cpu_data_master_granted_pio_led_s1;
  //pio_led_s1_firsttransfer first transaction, which is an e_assign
  assign pio_led_s1_firsttransfer = pio_led_s1_begins_xfer ? pio_led_s1_unreg_firsttransfer : pio_led_s1_reg_firsttransfer;

  //pio_led_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_led_s1_unreg_firsttransfer = ~(pio_led_s1_slavearbiterlockenable & pio_led_s1_any_continuerequest);

  //pio_led_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_reg_firsttransfer <= 1'b1;
      else if (pio_led_s1_begins_xfer)
          pio_led_s1_reg_firsttransfer <= pio_led_s1_unreg_firsttransfer;
    end


  //pio_led_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_led_s1_beginbursttransfer_internal = pio_led_s1_begins_xfer;

  //~pio_led_s1_write_n assignment, which is an e_mux
  assign pio_led_s1_write_n = ~(cpu_data_master_granted_pio_led_s1 & cpu_data_master_write);

  assign shifted_address_to_pio_led_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pio_led_s1_address mux, which is an e_mux
  assign pio_led_s1_address = shifted_address_to_pio_led_s1_from_cpu_data_master >> 2;

  //d1_pio_led_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_led_s1_end_xfer <= 1;
      else 
        d1_pio_led_s1_end_xfer <= pio_led_s1_end_xfer;
    end


  //pio_led_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_led_s1_waits_for_read = pio_led_s1_in_a_read_cycle & pio_led_s1_begins_xfer;

  //pio_led_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_led_s1_in_a_read_cycle = cpu_data_master_granted_pio_led_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_led_s1_in_a_read_cycle;

  //pio_led_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_led_s1_waits_for_write = pio_led_s1_in_a_write_cycle & 0;

  //pio_led_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_led_s1_in_a_write_cycle = cpu_data_master_granted_pio_led_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_led_s1_in_a_write_cycle;

  assign wait_for_pio_led_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_led/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_seg7_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_latency_counter,
                                 cpu_data_master_read,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 pio_seg7_s1_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_pio_seg7_s1,
                                 cpu_data_master_qualified_request_pio_seg7_s1,
                                 cpu_data_master_read_data_valid_pio_seg7_s1,
                                 cpu_data_master_requests_pio_seg7_s1,
                                 d1_pio_seg7_s1_end_xfer,
                                 pio_seg7_s1_address,
                                 pio_seg7_s1_chipselect,
                                 pio_seg7_s1_readdata_from_sa,
                                 pio_seg7_s1_reset_n,
                                 pio_seg7_s1_write_n,
                                 pio_seg7_s1_writedata
                              )
;

  output           cpu_data_master_granted_pio_seg7_s1;
  output           cpu_data_master_qualified_request_pio_seg7_s1;
  output           cpu_data_master_read_data_valid_pio_seg7_s1;
  output           cpu_data_master_requests_pio_seg7_s1;
  output           d1_pio_seg7_s1_end_xfer;
  output  [  1: 0] pio_seg7_s1_address;
  output           pio_seg7_s1_chipselect;
  output  [ 31: 0] pio_seg7_s1_readdata_from_sa;
  output           pio_seg7_s1_reset_n;
  output           pio_seg7_s1_write_n;
  output  [ 31: 0] pio_seg7_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] pio_seg7_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pio_seg7_s1;
  wire             cpu_data_master_qualified_request_pio_seg7_s1;
  wire             cpu_data_master_read_data_valid_pio_seg7_s1;
  wire             cpu_data_master_requests_pio_seg7_s1;
  wire             cpu_data_master_saved_grant_pio_seg7_s1;
  reg              d1_pio_seg7_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_seg7_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_seg7_s1_address;
  wire             pio_seg7_s1_allgrants;
  wire             pio_seg7_s1_allow_new_arb_cycle;
  wire             pio_seg7_s1_any_bursting_master_saved_grant;
  wire             pio_seg7_s1_any_continuerequest;
  wire             pio_seg7_s1_arb_counter_enable;
  reg     [  2: 0] pio_seg7_s1_arb_share_counter;
  wire    [  2: 0] pio_seg7_s1_arb_share_counter_next_value;
  wire    [  2: 0] pio_seg7_s1_arb_share_set_values;
  wire             pio_seg7_s1_beginbursttransfer_internal;
  wire             pio_seg7_s1_begins_xfer;
  wire             pio_seg7_s1_chipselect;
  wire             pio_seg7_s1_end_xfer;
  wire             pio_seg7_s1_firsttransfer;
  wire             pio_seg7_s1_grant_vector;
  wire             pio_seg7_s1_in_a_read_cycle;
  wire             pio_seg7_s1_in_a_write_cycle;
  wire             pio_seg7_s1_master_qreq_vector;
  wire             pio_seg7_s1_non_bursting_master_requests;
  wire    [ 31: 0] pio_seg7_s1_readdata_from_sa;
  reg              pio_seg7_s1_reg_firsttransfer;
  wire             pio_seg7_s1_reset_n;
  reg              pio_seg7_s1_slavearbiterlockenable;
  wire             pio_seg7_s1_slavearbiterlockenable2;
  wire             pio_seg7_s1_unreg_firsttransfer;
  wire             pio_seg7_s1_waits_for_read;
  wire             pio_seg7_s1_waits_for_write;
  wire             pio_seg7_s1_write_n;
  wire    [ 31: 0] pio_seg7_s1_writedata;
  wire    [ 24: 0] shifted_address_to_pio_seg7_s1_from_cpu_data_master;
  wire             wait_for_pio_seg7_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_seg7_s1_end_xfer;
    end


  assign pio_seg7_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pio_seg7_s1));
  //assign pio_seg7_s1_readdata_from_sa = pio_seg7_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_seg7_s1_readdata_from_sa = pio_seg7_s1_readdata;

  assign cpu_data_master_requests_pio_seg7_s1 = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18050a0) & (cpu_data_master_read | cpu_data_master_write);
  //pio_seg7_s1_arb_share_counter set values, which is an e_mux
  assign pio_seg7_s1_arb_share_set_values = 1;

  //pio_seg7_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_seg7_s1_non_bursting_master_requests = cpu_data_master_requests_pio_seg7_s1;

  //pio_seg7_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_seg7_s1_any_bursting_master_saved_grant = 0;

  //pio_seg7_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_seg7_s1_arb_share_counter_next_value = pio_seg7_s1_firsttransfer ? (pio_seg7_s1_arb_share_set_values - 1) : |pio_seg7_s1_arb_share_counter ? (pio_seg7_s1_arb_share_counter - 1) : 0;

  //pio_seg7_s1_allgrants all slave grants, which is an e_mux
  assign pio_seg7_s1_allgrants = |pio_seg7_s1_grant_vector;

  //pio_seg7_s1_end_xfer assignment, which is an e_assign
  assign pio_seg7_s1_end_xfer = ~(pio_seg7_s1_waits_for_read | pio_seg7_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_seg7_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_seg7_s1 = pio_seg7_s1_end_xfer & (~pio_seg7_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_seg7_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_seg7_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_seg7_s1 & pio_seg7_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_seg7_s1 & ~pio_seg7_s1_non_bursting_master_requests);

  //pio_seg7_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_seg7_s1_arb_share_counter <= 0;
      else if (pio_seg7_s1_arb_counter_enable)
          pio_seg7_s1_arb_share_counter <= pio_seg7_s1_arb_share_counter_next_value;
    end


  //pio_seg7_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_seg7_s1_slavearbiterlockenable <= 0;
      else if ((|pio_seg7_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_seg7_s1) | (end_xfer_arb_share_counter_term_pio_seg7_s1 & ~pio_seg7_s1_non_bursting_master_requests))
          pio_seg7_s1_slavearbiterlockenable <= |pio_seg7_s1_arb_share_counter_next_value;
    end


  //cpu/data_master pio_seg7/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pio_seg7_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pio_seg7_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_seg7_s1_slavearbiterlockenable2 = |pio_seg7_s1_arb_share_counter_next_value;

  //cpu/data_master pio_seg7/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pio_seg7_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pio_seg7_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_seg7_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pio_seg7_s1 = cpu_data_master_requests_pio_seg7_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_pio_seg7_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_pio_seg7_s1 = cpu_data_master_granted_pio_seg7_s1 & cpu_data_master_read & ~pio_seg7_s1_waits_for_read;

  //pio_seg7_s1_writedata mux, which is an e_mux
  assign pio_seg7_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_pio_seg7_s1 = cpu_data_master_qualified_request_pio_seg7_s1;

  //cpu/data_master saved-grant pio_seg7/s1, which is an e_assign
  assign cpu_data_master_saved_grant_pio_seg7_s1 = cpu_data_master_requests_pio_seg7_s1;

  //allow new arb cycle for pio_seg7/s1, which is an e_assign
  assign pio_seg7_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_seg7_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_seg7_s1_master_qreq_vector = 1;

  //pio_seg7_s1_reset_n assignment, which is an e_assign
  assign pio_seg7_s1_reset_n = reset_n;

  assign pio_seg7_s1_chipselect = cpu_data_master_granted_pio_seg7_s1;
  //pio_seg7_s1_firsttransfer first transaction, which is an e_assign
  assign pio_seg7_s1_firsttransfer = pio_seg7_s1_begins_xfer ? pio_seg7_s1_unreg_firsttransfer : pio_seg7_s1_reg_firsttransfer;

  //pio_seg7_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_seg7_s1_unreg_firsttransfer = ~(pio_seg7_s1_slavearbiterlockenable & pio_seg7_s1_any_continuerequest);

  //pio_seg7_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_seg7_s1_reg_firsttransfer <= 1'b1;
      else if (pio_seg7_s1_begins_xfer)
          pio_seg7_s1_reg_firsttransfer <= pio_seg7_s1_unreg_firsttransfer;
    end


  //pio_seg7_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_seg7_s1_beginbursttransfer_internal = pio_seg7_s1_begins_xfer;

  //~pio_seg7_s1_write_n assignment, which is an e_mux
  assign pio_seg7_s1_write_n = ~(cpu_data_master_granted_pio_seg7_s1 & cpu_data_master_write);

  assign shifted_address_to_pio_seg7_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pio_seg7_s1_address mux, which is an e_mux
  assign pio_seg7_s1_address = shifted_address_to_pio_seg7_s1_from_cpu_data_master >> 2;

  //d1_pio_seg7_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_seg7_s1_end_xfer <= 1;
      else 
        d1_pio_seg7_s1_end_xfer <= pio_seg7_s1_end_xfer;
    end


  //pio_seg7_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_seg7_s1_waits_for_read = pio_seg7_s1_in_a_read_cycle & pio_seg7_s1_begins_xfer;

  //pio_seg7_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_seg7_s1_in_a_read_cycle = cpu_data_master_granted_pio_seg7_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_seg7_s1_in_a_read_cycle;

  //pio_seg7_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_seg7_s1_waits_for_write = pio_seg7_s1_in_a_write_cycle & 0;

  //pio_seg7_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_seg7_s1_in_a_write_cycle = cpu_data_master_granted_pio_seg7_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_seg7_s1_in_a_write_cycle;

  assign wait_for_pio_seg7_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_seg7/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_sw_s1_arbitrator (
                              // inputs:
                               clk,
                               cpu_data_master_address_to_slave,
                               cpu_data_master_latency_counter,
                               cpu_data_master_read,
                               cpu_data_master_write,
                               pio_sw_s1_readdata,
                               reset_n,

                              // outputs:
                               cpu_data_master_granted_pio_sw_s1,
                               cpu_data_master_qualified_request_pio_sw_s1,
                               cpu_data_master_read_data_valid_pio_sw_s1,
                               cpu_data_master_requests_pio_sw_s1,
                               d1_pio_sw_s1_end_xfer,
                               pio_sw_s1_address,
                               pio_sw_s1_readdata_from_sa,
                               pio_sw_s1_reset_n
                            )
;

  output           cpu_data_master_granted_pio_sw_s1;
  output           cpu_data_master_qualified_request_pio_sw_s1;
  output           cpu_data_master_read_data_valid_pio_sw_s1;
  output           cpu_data_master_requests_pio_sw_s1;
  output           d1_pio_sw_s1_end_xfer;
  output  [  1: 0] pio_sw_s1_address;
  output  [  9: 0] pio_sw_s1_readdata_from_sa;
  output           pio_sw_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [  9: 0] pio_sw_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pio_sw_s1;
  wire             cpu_data_master_qualified_request_pio_sw_s1;
  wire             cpu_data_master_read_data_valid_pio_sw_s1;
  wire             cpu_data_master_requests_pio_sw_s1;
  wire             cpu_data_master_saved_grant_pio_sw_s1;
  reg              d1_pio_sw_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_sw_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_sw_s1_address;
  wire             pio_sw_s1_allgrants;
  wire             pio_sw_s1_allow_new_arb_cycle;
  wire             pio_sw_s1_any_bursting_master_saved_grant;
  wire             pio_sw_s1_any_continuerequest;
  wire             pio_sw_s1_arb_counter_enable;
  reg     [  2: 0] pio_sw_s1_arb_share_counter;
  wire    [  2: 0] pio_sw_s1_arb_share_counter_next_value;
  wire    [  2: 0] pio_sw_s1_arb_share_set_values;
  wire             pio_sw_s1_beginbursttransfer_internal;
  wire             pio_sw_s1_begins_xfer;
  wire             pio_sw_s1_end_xfer;
  wire             pio_sw_s1_firsttransfer;
  wire             pio_sw_s1_grant_vector;
  wire             pio_sw_s1_in_a_read_cycle;
  wire             pio_sw_s1_in_a_write_cycle;
  wire             pio_sw_s1_master_qreq_vector;
  wire             pio_sw_s1_non_bursting_master_requests;
  wire    [  9: 0] pio_sw_s1_readdata_from_sa;
  reg              pio_sw_s1_reg_firsttransfer;
  wire             pio_sw_s1_reset_n;
  reg              pio_sw_s1_slavearbiterlockenable;
  wire             pio_sw_s1_slavearbiterlockenable2;
  wire             pio_sw_s1_unreg_firsttransfer;
  wire             pio_sw_s1_waits_for_read;
  wire             pio_sw_s1_waits_for_write;
  wire    [ 24: 0] shifted_address_to_pio_sw_s1_from_cpu_data_master;
  wire             wait_for_pio_sw_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_sw_s1_end_xfer;
    end


  assign pio_sw_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pio_sw_s1));
  //assign pio_sw_s1_readdata_from_sa = pio_sw_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_sw_s1_readdata_from_sa = pio_sw_s1_readdata;

  assign cpu_data_master_requests_pio_sw_s1 = (({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18050d0) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //pio_sw_s1_arb_share_counter set values, which is an e_mux
  assign pio_sw_s1_arb_share_set_values = 1;

  //pio_sw_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_sw_s1_non_bursting_master_requests = cpu_data_master_requests_pio_sw_s1;

  //pio_sw_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_sw_s1_any_bursting_master_saved_grant = 0;

  //pio_sw_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_sw_s1_arb_share_counter_next_value = pio_sw_s1_firsttransfer ? (pio_sw_s1_arb_share_set_values - 1) : |pio_sw_s1_arb_share_counter ? (pio_sw_s1_arb_share_counter - 1) : 0;

  //pio_sw_s1_allgrants all slave grants, which is an e_mux
  assign pio_sw_s1_allgrants = |pio_sw_s1_grant_vector;

  //pio_sw_s1_end_xfer assignment, which is an e_assign
  assign pio_sw_s1_end_xfer = ~(pio_sw_s1_waits_for_read | pio_sw_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_sw_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_sw_s1 = pio_sw_s1_end_xfer & (~pio_sw_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_sw_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_sw_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_sw_s1 & pio_sw_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_sw_s1 & ~pio_sw_s1_non_bursting_master_requests);

  //pio_sw_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sw_s1_arb_share_counter <= 0;
      else if (pio_sw_s1_arb_counter_enable)
          pio_sw_s1_arb_share_counter <= pio_sw_s1_arb_share_counter_next_value;
    end


  //pio_sw_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sw_s1_slavearbiterlockenable <= 0;
      else if ((|pio_sw_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_sw_s1) | (end_xfer_arb_share_counter_term_pio_sw_s1 & ~pio_sw_s1_non_bursting_master_requests))
          pio_sw_s1_slavearbiterlockenable <= |pio_sw_s1_arb_share_counter_next_value;
    end


  //cpu/data_master pio_sw/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pio_sw_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pio_sw_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_sw_s1_slavearbiterlockenable2 = |pio_sw_s1_arb_share_counter_next_value;

  //cpu/data_master pio_sw/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pio_sw_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pio_sw_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_sw_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pio_sw_s1 = cpu_data_master_requests_pio_sw_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_pio_sw_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_pio_sw_s1 = cpu_data_master_granted_pio_sw_s1 & cpu_data_master_read & ~pio_sw_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_data_master_granted_pio_sw_s1 = cpu_data_master_qualified_request_pio_sw_s1;

  //cpu/data_master saved-grant pio_sw/s1, which is an e_assign
  assign cpu_data_master_saved_grant_pio_sw_s1 = cpu_data_master_requests_pio_sw_s1;

  //allow new arb cycle for pio_sw/s1, which is an e_assign
  assign pio_sw_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_sw_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_sw_s1_master_qreq_vector = 1;

  //pio_sw_s1_reset_n assignment, which is an e_assign
  assign pio_sw_s1_reset_n = reset_n;

  //pio_sw_s1_firsttransfer first transaction, which is an e_assign
  assign pio_sw_s1_firsttransfer = pio_sw_s1_begins_xfer ? pio_sw_s1_unreg_firsttransfer : pio_sw_s1_reg_firsttransfer;

  //pio_sw_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_sw_s1_unreg_firsttransfer = ~(pio_sw_s1_slavearbiterlockenable & pio_sw_s1_any_continuerequest);

  //pio_sw_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_sw_s1_reg_firsttransfer <= 1'b1;
      else if (pio_sw_s1_begins_xfer)
          pio_sw_s1_reg_firsttransfer <= pio_sw_s1_unreg_firsttransfer;
    end


  //pio_sw_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_sw_s1_beginbursttransfer_internal = pio_sw_s1_begins_xfer;

  assign shifted_address_to_pio_sw_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pio_sw_s1_address mux, which is an e_mux
  assign pio_sw_s1_address = shifted_address_to_pio_sw_s1_from_cpu_data_master >> 2;

  //d1_pio_sw_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_sw_s1_end_xfer <= 1;
      else 
        d1_pio_sw_s1_end_xfer <= pio_sw_s1_end_xfer;
    end


  //pio_sw_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_sw_s1_waits_for_read = pio_sw_s1_in_a_read_cycle & pio_sw_s1_begins_xfer;

  //pio_sw_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_sw_s1_in_a_read_cycle = cpu_data_master_granted_pio_sw_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_sw_s1_in_a_read_cycle;

  //pio_sw_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_sw_s1_waits_for_write = pio_sw_s1_in_a_write_cycle & 0;

  //pio_sw_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_sw_s1_in_a_write_cycle = cpu_data_master_granted_pio_sw_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_sw_s1_in_a_write_cycle;

  assign wait_for_pio_sw_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_sw/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_pll_slave_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_latency_counter,
                                   cpu_data_master_read,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   pll_pll_slave_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_pll_pll_slave,
                                   cpu_data_master_qualified_request_pll_pll_slave,
                                   cpu_data_master_read_data_valid_pll_pll_slave,
                                   cpu_data_master_requests_pll_pll_slave,
                                   d1_pll_pll_slave_end_xfer,
                                   pll_pll_slave_address,
                                   pll_pll_slave_read,
                                   pll_pll_slave_readdata_from_sa,
                                   pll_pll_slave_reset,
                                   pll_pll_slave_write,
                                   pll_pll_slave_writedata
                                )
;

  output           cpu_data_master_granted_pll_pll_slave;
  output           cpu_data_master_qualified_request_pll_pll_slave;
  output           cpu_data_master_read_data_valid_pll_pll_slave;
  output           cpu_data_master_requests_pll_pll_slave;
  output           d1_pll_pll_slave_end_xfer;
  output  [  1: 0] pll_pll_slave_address;
  output           pll_pll_slave_read;
  output  [ 31: 0] pll_pll_slave_readdata_from_sa;
  output           pll_pll_slave_reset;
  output           pll_pll_slave_write;
  output  [ 31: 0] pll_pll_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] pll_pll_slave_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pll_pll_slave;
  wire             cpu_data_master_qualified_request_pll_pll_slave;
  wire             cpu_data_master_read_data_valid_pll_pll_slave;
  wire             cpu_data_master_requests_pll_pll_slave;
  wire             cpu_data_master_saved_grant_pll_pll_slave;
  reg              d1_pll_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_allgrants;
  wire             pll_pll_slave_allow_new_arb_cycle;
  wire             pll_pll_slave_any_bursting_master_saved_grant;
  wire             pll_pll_slave_any_continuerequest;
  wire             pll_pll_slave_arb_counter_enable;
  reg     [  2: 0] pll_pll_slave_arb_share_counter;
  wire    [  2: 0] pll_pll_slave_arb_share_counter_next_value;
  wire    [  2: 0] pll_pll_slave_arb_share_set_values;
  wire             pll_pll_slave_beginbursttransfer_internal;
  wire             pll_pll_slave_begins_xfer;
  wire             pll_pll_slave_end_xfer;
  wire             pll_pll_slave_firsttransfer;
  wire             pll_pll_slave_grant_vector;
  wire             pll_pll_slave_in_a_read_cycle;
  wire             pll_pll_slave_in_a_write_cycle;
  wire             pll_pll_slave_master_qreq_vector;
  wire             pll_pll_slave_non_bursting_master_requests;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  reg              pll_pll_slave_reg_firsttransfer;
  wire             pll_pll_slave_reset;
  reg              pll_pll_slave_slavearbiterlockenable;
  wire             pll_pll_slave_slavearbiterlockenable2;
  wire             pll_pll_slave_unreg_firsttransfer;
  wire             pll_pll_slave_waits_for_read;
  wire             pll_pll_slave_waits_for_write;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire    [ 24: 0] shifted_address_to_pll_pll_slave_from_cpu_data_master;
  wire             wait_for_pll_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pll_pll_slave_end_xfer;
    end


  assign pll_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pll_pll_slave));
  //assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata;

  assign cpu_data_master_requests_pll_pll_slave = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1805080) & (cpu_data_master_read | cpu_data_master_write);
  //pll_pll_slave_arb_share_counter set values, which is an e_mux
  assign pll_pll_slave_arb_share_set_values = 1;

  //pll_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign pll_pll_slave_non_bursting_master_requests = cpu_data_master_requests_pll_pll_slave;

  //pll_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_pll_slave_any_bursting_master_saved_grant = 0;

  //pll_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_pll_slave_arb_share_counter_next_value = pll_pll_slave_firsttransfer ? (pll_pll_slave_arb_share_set_values - 1) : |pll_pll_slave_arb_share_counter ? (pll_pll_slave_arb_share_counter - 1) : 0;

  //pll_pll_slave_allgrants all slave grants, which is an e_mux
  assign pll_pll_slave_allgrants = |pll_pll_slave_grant_vector;

  //pll_pll_slave_end_xfer assignment, which is an e_assign
  assign pll_pll_slave_end_xfer = ~(pll_pll_slave_waits_for_read | pll_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_pll_slave = pll_pll_slave_end_xfer & (~pll_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_pll_slave & pll_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests);

  //pll_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_arb_share_counter <= 0;
      else if (pll_pll_slave_arb_counter_enable)
          pll_pll_slave_arb_share_counter <= pll_pll_slave_arb_share_counter_next_value;
    end


  //pll_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_slavearbiterlockenable <= 0;
      else if ((|pll_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_pll_pll_slave) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests))
          pll_pll_slave_slavearbiterlockenable <= |pll_pll_slave_arb_share_counter_next_value;
    end


  //cpu/data_master pll/pll_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pll_pll_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pll_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_pll_slave_slavearbiterlockenable2 = |pll_pll_slave_arb_share_counter_next_value;

  //cpu/data_master pll/pll_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pll_pll_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //pll_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_pll_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_pll_pll_slave = cpu_data_master_requests_pll_pll_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_pll_pll_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_pll_pll_slave = cpu_data_master_granted_pll_pll_slave & cpu_data_master_read & ~pll_pll_slave_waits_for_read;

  //pll_pll_slave_writedata mux, which is an e_mux
  assign pll_pll_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_pll_pll_slave = cpu_data_master_qualified_request_pll_pll_slave;

  //cpu/data_master saved-grant pll/pll_slave, which is an e_assign
  assign cpu_data_master_saved_grant_pll_pll_slave = cpu_data_master_requests_pll_pll_slave;

  //allow new arb cycle for pll/pll_slave, which is an e_assign
  assign pll_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_pll_slave_master_qreq_vector = 1;

  //~pll_pll_slave_reset assignment, which is an e_assign
  assign pll_pll_slave_reset = ~reset_n;

  //pll_pll_slave_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_firsttransfer = pll_pll_slave_begins_xfer ? pll_pll_slave_unreg_firsttransfer : pll_pll_slave_reg_firsttransfer;

  //pll_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_unreg_firsttransfer = ~(pll_pll_slave_slavearbiterlockenable & pll_pll_slave_any_continuerequest);

  //pll_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_reg_firsttransfer <= 1'b1;
      else if (pll_pll_slave_begins_xfer)
          pll_pll_slave_reg_firsttransfer <= pll_pll_slave_unreg_firsttransfer;
    end


  //pll_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_pll_slave_beginbursttransfer_internal = pll_pll_slave_begins_xfer;

  //pll_pll_slave_read assignment, which is an e_mux
  assign pll_pll_slave_read = cpu_data_master_granted_pll_pll_slave & cpu_data_master_read;

  //pll_pll_slave_write assignment, which is an e_mux
  assign pll_pll_slave_write = cpu_data_master_granted_pll_pll_slave & cpu_data_master_write;

  assign shifted_address_to_pll_pll_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //pll_pll_slave_address mux, which is an e_mux
  assign pll_pll_slave_address = shifted_address_to_pll_pll_slave_from_cpu_data_master >> 2;

  //d1_pll_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_pll_slave_end_xfer <= 1;
      else 
        d1_pll_pll_slave_end_xfer <= pll_pll_slave_end_xfer;
    end


  //pll_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_read = pll_pll_slave_in_a_read_cycle & 0;

  //pll_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_read_cycle = cpu_data_master_granted_pll_pll_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_pll_slave_in_a_read_cycle;

  //pll_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_write = pll_pll_slave_in_a_write_cycle & 0;

  //pll_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_write_cycle = cpu_data_master_granted_pll_pll_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_pll_slave_in_a_write_cycle;

  assign wait_for_pll_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ps2_0_avalon_ps2_slave_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_data_master_address_to_slave,
                                            cpu_data_master_byteenable,
                                            cpu_data_master_latency_counter,
                                            cpu_data_master_read,
                                            cpu_data_master_write,
                                            cpu_data_master_writedata,
                                            ps2_0_avalon_ps2_slave_irq,
                                            ps2_0_avalon_ps2_slave_readdata,
                                            ps2_0_avalon_ps2_slave_waitrequest,
                                            reset_n,

                                           // outputs:
                                            cpu_data_master_granted_ps2_0_avalon_ps2_slave,
                                            cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave,
                                            cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave,
                                            cpu_data_master_requests_ps2_0_avalon_ps2_slave,
                                            d1_ps2_0_avalon_ps2_slave_end_xfer,
                                            ps2_0_avalon_ps2_slave_address,
                                            ps2_0_avalon_ps2_slave_byteenable,
                                            ps2_0_avalon_ps2_slave_chipselect,
                                            ps2_0_avalon_ps2_slave_irq_from_sa,
                                            ps2_0_avalon_ps2_slave_read,
                                            ps2_0_avalon_ps2_slave_readdata_from_sa,
                                            ps2_0_avalon_ps2_slave_reset,
                                            ps2_0_avalon_ps2_slave_waitrequest_from_sa,
                                            ps2_0_avalon_ps2_slave_write,
                                            ps2_0_avalon_ps2_slave_writedata
                                         )
;

  output           cpu_data_master_granted_ps2_0_avalon_ps2_slave;
  output           cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave;
  output           cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave;
  output           cpu_data_master_requests_ps2_0_avalon_ps2_slave;
  output           d1_ps2_0_avalon_ps2_slave_end_xfer;
  output           ps2_0_avalon_ps2_slave_address;
  output  [  3: 0] ps2_0_avalon_ps2_slave_byteenable;
  output           ps2_0_avalon_ps2_slave_chipselect;
  output           ps2_0_avalon_ps2_slave_irq_from_sa;
  output           ps2_0_avalon_ps2_slave_read;
  output  [ 31: 0] ps2_0_avalon_ps2_slave_readdata_from_sa;
  output           ps2_0_avalon_ps2_slave_reset;
  output           ps2_0_avalon_ps2_slave_waitrequest_from_sa;
  output           ps2_0_avalon_ps2_slave_write;
  output  [ 31: 0] ps2_0_avalon_ps2_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            ps2_0_avalon_ps2_slave_irq;
  input   [ 31: 0] ps2_0_avalon_ps2_slave_readdata;
  input            ps2_0_avalon_ps2_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ps2_0_avalon_ps2_slave;
  wire             cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave;
  wire             cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave;
  reg              cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register;
  wire             cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register_in;
  wire             cpu_data_master_requests_ps2_0_avalon_ps2_slave;
  wire             cpu_data_master_saved_grant_ps2_0_avalon_ps2_slave;
  reg              d1_ps2_0_avalon_ps2_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ps2_0_avalon_ps2_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register;
  wire             ps2_0_avalon_ps2_slave_address;
  wire             ps2_0_avalon_ps2_slave_allgrants;
  wire             ps2_0_avalon_ps2_slave_allow_new_arb_cycle;
  wire             ps2_0_avalon_ps2_slave_any_bursting_master_saved_grant;
  wire             ps2_0_avalon_ps2_slave_any_continuerequest;
  wire             ps2_0_avalon_ps2_slave_arb_counter_enable;
  reg     [  2: 0] ps2_0_avalon_ps2_slave_arb_share_counter;
  wire    [  2: 0] ps2_0_avalon_ps2_slave_arb_share_counter_next_value;
  wire    [  2: 0] ps2_0_avalon_ps2_slave_arb_share_set_values;
  wire             ps2_0_avalon_ps2_slave_beginbursttransfer_internal;
  wire             ps2_0_avalon_ps2_slave_begins_xfer;
  wire    [  3: 0] ps2_0_avalon_ps2_slave_byteenable;
  wire             ps2_0_avalon_ps2_slave_chipselect;
  wire             ps2_0_avalon_ps2_slave_end_xfer;
  wire             ps2_0_avalon_ps2_slave_firsttransfer;
  wire             ps2_0_avalon_ps2_slave_grant_vector;
  wire             ps2_0_avalon_ps2_slave_in_a_read_cycle;
  wire             ps2_0_avalon_ps2_slave_in_a_write_cycle;
  wire             ps2_0_avalon_ps2_slave_irq_from_sa;
  wire             ps2_0_avalon_ps2_slave_master_qreq_vector;
  wire             ps2_0_avalon_ps2_slave_non_bursting_master_requests;
  wire             ps2_0_avalon_ps2_slave_read;
  wire    [ 31: 0] ps2_0_avalon_ps2_slave_readdata_from_sa;
  reg              ps2_0_avalon_ps2_slave_reg_firsttransfer;
  wire             ps2_0_avalon_ps2_slave_reset;
  reg              ps2_0_avalon_ps2_slave_slavearbiterlockenable;
  wire             ps2_0_avalon_ps2_slave_slavearbiterlockenable2;
  wire             ps2_0_avalon_ps2_slave_unreg_firsttransfer;
  wire             ps2_0_avalon_ps2_slave_waitrequest_from_sa;
  wire             ps2_0_avalon_ps2_slave_waits_for_read;
  wire             ps2_0_avalon_ps2_slave_waits_for_write;
  wire             ps2_0_avalon_ps2_slave_write;
  wire    [ 31: 0] ps2_0_avalon_ps2_slave_writedata;
  wire    [ 24: 0] shifted_address_to_ps2_0_avalon_ps2_slave_from_cpu_data_master;
  wire             wait_for_ps2_0_avalon_ps2_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ps2_0_avalon_ps2_slave_end_xfer;
    end


  assign ps2_0_avalon_ps2_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave));
  //assign ps2_0_avalon_ps2_slave_readdata_from_sa = ps2_0_avalon_ps2_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ps2_0_avalon_ps2_slave_readdata_from_sa = ps2_0_avalon_ps2_slave_readdata;

  assign cpu_data_master_requests_ps2_0_avalon_ps2_slave = ({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h18050f8) & (cpu_data_master_read | cpu_data_master_write);
  //assign ps2_0_avalon_ps2_slave_waitrequest_from_sa = ps2_0_avalon_ps2_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ps2_0_avalon_ps2_slave_waitrequest_from_sa = ps2_0_avalon_ps2_slave_waitrequest;

  //ps2_0_avalon_ps2_slave_arb_share_counter set values, which is an e_mux
  assign ps2_0_avalon_ps2_slave_arb_share_set_values = 1;

  //ps2_0_avalon_ps2_slave_non_bursting_master_requests mux, which is an e_mux
  assign ps2_0_avalon_ps2_slave_non_bursting_master_requests = cpu_data_master_requests_ps2_0_avalon_ps2_slave;

  //ps2_0_avalon_ps2_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign ps2_0_avalon_ps2_slave_any_bursting_master_saved_grant = 0;

  //ps2_0_avalon_ps2_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign ps2_0_avalon_ps2_slave_arb_share_counter_next_value = ps2_0_avalon_ps2_slave_firsttransfer ? (ps2_0_avalon_ps2_slave_arb_share_set_values - 1) : |ps2_0_avalon_ps2_slave_arb_share_counter ? (ps2_0_avalon_ps2_slave_arb_share_counter - 1) : 0;

  //ps2_0_avalon_ps2_slave_allgrants all slave grants, which is an e_mux
  assign ps2_0_avalon_ps2_slave_allgrants = |ps2_0_avalon_ps2_slave_grant_vector;

  //ps2_0_avalon_ps2_slave_end_xfer assignment, which is an e_assign
  assign ps2_0_avalon_ps2_slave_end_xfer = ~(ps2_0_avalon_ps2_slave_waits_for_read | ps2_0_avalon_ps2_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_ps2_0_avalon_ps2_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ps2_0_avalon_ps2_slave = ps2_0_avalon_ps2_slave_end_xfer & (~ps2_0_avalon_ps2_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ps2_0_avalon_ps2_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign ps2_0_avalon_ps2_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_ps2_0_avalon_ps2_slave & ps2_0_avalon_ps2_slave_allgrants) | (end_xfer_arb_share_counter_term_ps2_0_avalon_ps2_slave & ~ps2_0_avalon_ps2_slave_non_bursting_master_requests);

  //ps2_0_avalon_ps2_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ps2_0_avalon_ps2_slave_arb_share_counter <= 0;
      else if (ps2_0_avalon_ps2_slave_arb_counter_enable)
          ps2_0_avalon_ps2_slave_arb_share_counter <= ps2_0_avalon_ps2_slave_arb_share_counter_next_value;
    end


  //ps2_0_avalon_ps2_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ps2_0_avalon_ps2_slave_slavearbiterlockenable <= 0;
      else if ((|ps2_0_avalon_ps2_slave_master_qreq_vector & end_xfer_arb_share_counter_term_ps2_0_avalon_ps2_slave) | (end_xfer_arb_share_counter_term_ps2_0_avalon_ps2_slave & ~ps2_0_avalon_ps2_slave_non_bursting_master_requests))
          ps2_0_avalon_ps2_slave_slavearbiterlockenable <= |ps2_0_avalon_ps2_slave_arb_share_counter_next_value;
    end


  //cpu/data_master ps2_0/avalon_ps2_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = ps2_0_avalon_ps2_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //ps2_0_avalon_ps2_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ps2_0_avalon_ps2_slave_slavearbiterlockenable2 = |ps2_0_avalon_ps2_slave_arb_share_counter_next_value;

  //cpu/data_master ps2_0/avalon_ps2_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = ps2_0_avalon_ps2_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //ps2_0_avalon_ps2_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ps2_0_avalon_ps2_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave = cpu_data_master_requests_ps2_0_avalon_ps2_slave & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter))));
  //cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register_in = cpu_data_master_granted_ps2_0_avalon_ps2_slave & cpu_data_master_read & ~ps2_0_avalon_ps2_slave_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register = {cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register, cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register_in};

  //cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register <= p1_cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave = cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave_shift_register;

  //ps2_0_avalon_ps2_slave_writedata mux, which is an e_mux
  assign ps2_0_avalon_ps2_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_ps2_0_avalon_ps2_slave = cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave;

  //cpu/data_master saved-grant ps2_0/avalon_ps2_slave, which is an e_assign
  assign cpu_data_master_saved_grant_ps2_0_avalon_ps2_slave = cpu_data_master_requests_ps2_0_avalon_ps2_slave;

  //allow new arb cycle for ps2_0/avalon_ps2_slave, which is an e_assign
  assign ps2_0_avalon_ps2_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ps2_0_avalon_ps2_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ps2_0_avalon_ps2_slave_master_qreq_vector = 1;

  //~ps2_0_avalon_ps2_slave_reset assignment, which is an e_assign
  assign ps2_0_avalon_ps2_slave_reset = ~reset_n;

  assign ps2_0_avalon_ps2_slave_chipselect = cpu_data_master_granted_ps2_0_avalon_ps2_slave;
  //ps2_0_avalon_ps2_slave_firsttransfer first transaction, which is an e_assign
  assign ps2_0_avalon_ps2_slave_firsttransfer = ps2_0_avalon_ps2_slave_begins_xfer ? ps2_0_avalon_ps2_slave_unreg_firsttransfer : ps2_0_avalon_ps2_slave_reg_firsttransfer;

  //ps2_0_avalon_ps2_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign ps2_0_avalon_ps2_slave_unreg_firsttransfer = ~(ps2_0_avalon_ps2_slave_slavearbiterlockenable & ps2_0_avalon_ps2_slave_any_continuerequest);

  //ps2_0_avalon_ps2_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ps2_0_avalon_ps2_slave_reg_firsttransfer <= 1'b1;
      else if (ps2_0_avalon_ps2_slave_begins_xfer)
          ps2_0_avalon_ps2_slave_reg_firsttransfer <= ps2_0_avalon_ps2_slave_unreg_firsttransfer;
    end


  //ps2_0_avalon_ps2_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ps2_0_avalon_ps2_slave_beginbursttransfer_internal = ps2_0_avalon_ps2_slave_begins_xfer;

  //ps2_0_avalon_ps2_slave_read assignment, which is an e_mux
  assign ps2_0_avalon_ps2_slave_read = cpu_data_master_granted_ps2_0_avalon_ps2_slave & cpu_data_master_read;

  //ps2_0_avalon_ps2_slave_write assignment, which is an e_mux
  assign ps2_0_avalon_ps2_slave_write = cpu_data_master_granted_ps2_0_avalon_ps2_slave & cpu_data_master_write;

  assign shifted_address_to_ps2_0_avalon_ps2_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //ps2_0_avalon_ps2_slave_address mux, which is an e_mux
  assign ps2_0_avalon_ps2_slave_address = shifted_address_to_ps2_0_avalon_ps2_slave_from_cpu_data_master >> 2;

  //d1_ps2_0_avalon_ps2_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ps2_0_avalon_ps2_slave_end_xfer <= 1;
      else 
        d1_ps2_0_avalon_ps2_slave_end_xfer <= ps2_0_avalon_ps2_slave_end_xfer;
    end


  //ps2_0_avalon_ps2_slave_waits_for_read in a cycle, which is an e_mux
  assign ps2_0_avalon_ps2_slave_waits_for_read = ps2_0_avalon_ps2_slave_in_a_read_cycle & ps2_0_avalon_ps2_slave_waitrequest_from_sa;

  //ps2_0_avalon_ps2_slave_in_a_read_cycle assignment, which is an e_assign
  assign ps2_0_avalon_ps2_slave_in_a_read_cycle = cpu_data_master_granted_ps2_0_avalon_ps2_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ps2_0_avalon_ps2_slave_in_a_read_cycle;

  //ps2_0_avalon_ps2_slave_waits_for_write in a cycle, which is an e_mux
  assign ps2_0_avalon_ps2_slave_waits_for_write = ps2_0_avalon_ps2_slave_in_a_write_cycle & ps2_0_avalon_ps2_slave_waitrequest_from_sa;

  //ps2_0_avalon_ps2_slave_in_a_write_cycle assignment, which is an e_assign
  assign ps2_0_avalon_ps2_slave_in_a_write_cycle = cpu_data_master_granted_ps2_0_avalon_ps2_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ps2_0_avalon_ps2_slave_in_a_write_cycle;

  assign wait_for_ps2_0_avalon_ps2_slave_counter = 0;
  //ps2_0_avalon_ps2_slave_byteenable byte enable port mux, which is an e_mux
  assign ps2_0_avalon_ps2_slave_byteenable = (cpu_data_master_granted_ps2_0_avalon_ps2_slave)? cpu_data_master_byteenable :
    -1;

  //assign ps2_0_avalon_ps2_slave_irq_from_sa = ps2_0_avalon_ps2_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ps2_0_avalon_ps2_slave_irq_from_sa = ps2_0_avalon_ps2_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ps2_0/avalon_ps2_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_RamAndFlash_sopc_clock_0_out_to_sdram_s1_module (
                                                                      // inputs:
                                                                       clear_fifo,
                                                                       clk,
                                                                       data_in,
                                                                       read,
                                                                       reset_n,
                                                                       sync_reset,
                                                                       write,

                                                                      // outputs:
                                                                       data_out,
                                                                       empty,
                                                                       fifo_contains_ones_n,
                                                                       full
                                                                    )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_RamAndFlash_sopc_clock_1_out_to_sdram_s1_module (
                                                                      // inputs:
                                                                       clear_fifo,
                                                                       clk,
                                                                       data_in,
                                                                       read,
                                                                       reset_n,
                                                                       sync_reset,
                                                                       write,

                                                                      // outputs:
                                                                       data_out,
                                                                       empty,
                                                                       fifo_contains_ones_n,
                                                                       full
                                                                    )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              RamAndFlash_sopc_clock_0_out_address_to_slave,
                              RamAndFlash_sopc_clock_0_out_byteenable,
                              RamAndFlash_sopc_clock_0_out_read,
                              RamAndFlash_sopc_clock_0_out_write,
                              RamAndFlash_sopc_clock_0_out_writedata,
                              RamAndFlash_sopc_clock_1_out_address_to_slave,
                              RamAndFlash_sopc_clock_1_out_byteenable,
                              RamAndFlash_sopc_clock_1_out_read,
                              RamAndFlash_sopc_clock_1_out_write,
                              RamAndFlash_sopc_clock_1_out_writedata,
                              clk,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,

                             // outputs:
                              RamAndFlash_sopc_clock_0_out_granted_sdram_s1,
                              RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1,
                              RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1,
                              RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register,
                              RamAndFlash_sopc_clock_0_out_requests_sdram_s1,
                              RamAndFlash_sopc_clock_1_out_granted_sdram_s1,
                              RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1,
                              RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1,
                              RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register,
                              RamAndFlash_sopc_clock_1_out_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata
                           )
;

  output           RamAndFlash_sopc_clock_0_out_granted_sdram_s1;
  output           RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1;
  output           RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1;
  output           RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  output           RamAndFlash_sopc_clock_0_out_requests_sdram_s1;
  output           RamAndFlash_sopc_clock_1_out_granted_sdram_s1;
  output           RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1;
  output           RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1;
  output           RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  output           RamAndFlash_sopc_clock_1_out_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 21: 0] sdram_s1_address;
  output  [  1: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 15: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 15: 0] sdram_s1_writedata;
  input   [ 22: 0] RamAndFlash_sopc_clock_0_out_address_to_slave;
  input   [  1: 0] RamAndFlash_sopc_clock_0_out_byteenable;
  input            RamAndFlash_sopc_clock_0_out_read;
  input            RamAndFlash_sopc_clock_0_out_write;
  input   [ 15: 0] RamAndFlash_sopc_clock_0_out_writedata;
  input   [ 22: 0] RamAndFlash_sopc_clock_1_out_address_to_slave;
  input   [  1: 0] RamAndFlash_sopc_clock_1_out_byteenable;
  input            RamAndFlash_sopc_clock_1_out_read;
  input            RamAndFlash_sopc_clock_1_out_write;
  input   [ 15: 0] RamAndFlash_sopc_clock_1_out_writedata;
  input            clk;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;

  wire             RamAndFlash_sopc_clock_0_out_arbiterlock;
  wire             RamAndFlash_sopc_clock_0_out_arbiterlock2;
  wire             RamAndFlash_sopc_clock_0_out_continuerequest;
  wire             RamAndFlash_sopc_clock_0_out_granted_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_rdv_fifo_empty_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_rdv_fifo_output_from_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  wire             RamAndFlash_sopc_clock_0_out_requests_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_saved_grant_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_arbiterlock;
  wire             RamAndFlash_sopc_clock_1_out_arbiterlock2;
  wire             RamAndFlash_sopc_clock_1_out_continuerequest;
  wire             RamAndFlash_sopc_clock_1_out_granted_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_rdv_fifo_empty_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_rdv_fifo_output_from_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  wire             RamAndFlash_sopc_clock_1_out_requests_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_RamAndFlash_sopc_clock_0_out_granted_slave_sdram_s1;
  reg              last_cycle_RamAndFlash_sopc_clock_1_out_granted_slave_sdram_s1;
  wire    [ 21: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  1: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg              sdram_s1_arb_share_counter;
  wire             sdram_s1_arb_share_counter_next_value;
  wire             sdram_s1_arb_share_set_values;
  wire    [  1: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  3: 0] sdram_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  1: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg     [  1: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire    [ 22: 0] shifted_address_to_sdram_s1_from_RamAndFlash_sopc_clock_0_out;
  wire    [ 22: 0] shifted_address_to_sdram_s1_from_RamAndFlash_sopc_clock_1_out;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1 | RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1));
  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign RamAndFlash_sopc_clock_0_out_requests_sdram_s1 = (1) & (RamAndFlash_sopc_clock_0_out_read | RamAndFlash_sopc_clock_0_out_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = 1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = RamAndFlash_sopc_clock_0_out_requests_sdram_s1 |
    RamAndFlash_sopc_clock_1_out_requests_sdram_s1 |
    RamAndFlash_sopc_clock_0_out_requests_sdram_s1 |
    RamAndFlash_sopc_clock_1_out_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector);

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //RamAndFlash_sopc_clock_0/out sdram/s1 arbiterlock, which is an e_assign
  assign RamAndFlash_sopc_clock_0_out_arbiterlock = sdram_s1_slavearbiterlockenable & RamAndFlash_sopc_clock_0_out_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //RamAndFlash_sopc_clock_0/out sdram/s1 arbiterlock2, which is an e_assign
  assign RamAndFlash_sopc_clock_0_out_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & RamAndFlash_sopc_clock_0_out_continuerequest;

  //RamAndFlash_sopc_clock_1/out sdram/s1 arbiterlock, which is an e_assign
  assign RamAndFlash_sopc_clock_1_out_arbiterlock = sdram_s1_slavearbiterlockenable & RamAndFlash_sopc_clock_1_out_continuerequest;

  //RamAndFlash_sopc_clock_1/out sdram/s1 arbiterlock2, which is an e_assign
  assign RamAndFlash_sopc_clock_1_out_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & RamAndFlash_sopc_clock_1_out_continuerequest;

  //RamAndFlash_sopc_clock_1/out granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_RamAndFlash_sopc_clock_1_out_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_RamAndFlash_sopc_clock_1_out_granted_slave_sdram_s1 <= RamAndFlash_sopc_clock_1_out_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~RamAndFlash_sopc_clock_1_out_requests_sdram_s1) ? 0 : last_cycle_RamAndFlash_sopc_clock_1_out_granted_slave_sdram_s1;
    end


  //RamAndFlash_sopc_clock_1_out_continuerequest continued request, which is an e_mux
  assign RamAndFlash_sopc_clock_1_out_continuerequest = last_cycle_RamAndFlash_sopc_clock_1_out_granted_slave_sdram_s1 & RamAndFlash_sopc_clock_1_out_requests_sdram_s1;

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = RamAndFlash_sopc_clock_1_out_continuerequest |
    RamAndFlash_sopc_clock_0_out_continuerequest;

  assign RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1 = RamAndFlash_sopc_clock_0_out_requests_sdram_s1 & ~((RamAndFlash_sopc_clock_0_out_read & ((|RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register))) | RamAndFlash_sopc_clock_1_out_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_RamAndFlash_sopc_clock_0_out_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_RamAndFlash_sopc_clock_0_out_to_sdram_s1_module rdv_fifo_for_RamAndFlash_sopc_clock_0_out_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (RamAndFlash_sopc_clock_0_out_granted_sdram_s1),
      .data_out             (RamAndFlash_sopc_clock_0_out_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (RamAndFlash_sopc_clock_0_out_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register = ~RamAndFlash_sopc_clock_0_out_rdv_fifo_empty_sdram_s1;
  //local readdatavalid RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1, which is an e_mux
  assign RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & RamAndFlash_sopc_clock_0_out_rdv_fifo_output_from_sdram_s1) & ~ RamAndFlash_sopc_clock_0_out_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = (RamAndFlash_sopc_clock_0_out_granted_sdram_s1)? RamAndFlash_sopc_clock_0_out_writedata :
    RamAndFlash_sopc_clock_1_out_writedata;

  assign RamAndFlash_sopc_clock_1_out_requests_sdram_s1 = (1) & (RamAndFlash_sopc_clock_1_out_read | RamAndFlash_sopc_clock_1_out_write);
  //RamAndFlash_sopc_clock_0/out granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_RamAndFlash_sopc_clock_0_out_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_RamAndFlash_sopc_clock_0_out_granted_slave_sdram_s1 <= RamAndFlash_sopc_clock_0_out_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~RamAndFlash_sopc_clock_0_out_requests_sdram_s1) ? 0 : last_cycle_RamAndFlash_sopc_clock_0_out_granted_slave_sdram_s1;
    end


  //RamAndFlash_sopc_clock_0_out_continuerequest continued request, which is an e_mux
  assign RamAndFlash_sopc_clock_0_out_continuerequest = last_cycle_RamAndFlash_sopc_clock_0_out_granted_slave_sdram_s1 & RamAndFlash_sopc_clock_0_out_requests_sdram_s1;

  assign RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1 = RamAndFlash_sopc_clock_1_out_requests_sdram_s1 & ~((RamAndFlash_sopc_clock_1_out_read & ((|RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register))) | RamAndFlash_sopc_clock_0_out_arbiterlock);
  //rdv_fifo_for_RamAndFlash_sopc_clock_1_out_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_RamAndFlash_sopc_clock_1_out_to_sdram_s1_module rdv_fifo_for_RamAndFlash_sopc_clock_1_out_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (RamAndFlash_sopc_clock_1_out_granted_sdram_s1),
      .data_out             (RamAndFlash_sopc_clock_1_out_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (RamAndFlash_sopc_clock_1_out_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register = ~RamAndFlash_sopc_clock_1_out_rdv_fifo_empty_sdram_s1;
  //local readdatavalid RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1, which is an e_mux
  assign RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & RamAndFlash_sopc_clock_1_out_rdv_fifo_output_from_sdram_s1) & ~ RamAndFlash_sopc_clock_1_out_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~RamAndFlash_sopc_clock_0_out_arbiterlock & ~RamAndFlash_sopc_clock_1_out_arbiterlock;

  //RamAndFlash_sopc_clock_1/out assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1;

  //RamAndFlash_sopc_clock_1/out grant sdram/s1, which is an e_assign
  assign RamAndFlash_sopc_clock_1_out_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //RamAndFlash_sopc_clock_1/out saved-grant sdram/s1, which is an e_assign
  assign RamAndFlash_sopc_clock_1_out_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && RamAndFlash_sopc_clock_1_out_requests_sdram_s1;

  //RamAndFlash_sopc_clock_0/out assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1;

  //RamAndFlash_sopc_clock_0/out grant sdram/s1, which is an e_assign
  assign RamAndFlash_sopc_clock_0_out_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //RamAndFlash_sopc_clock_0/out saved-grant sdram/s1, which is an e_assign
  assign RamAndFlash_sopc_clock_0_out_saved_grant_sdram_s1 = sdram_s1_arb_winner[1] && RamAndFlash_sopc_clock_0_out_requests_sdram_s1;

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[3]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[2])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = RamAndFlash_sopc_clock_0_out_granted_sdram_s1 | RamAndFlash_sopc_clock_1_out_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((RamAndFlash_sopc_clock_0_out_granted_sdram_s1 & RamAndFlash_sopc_clock_0_out_read) | (RamAndFlash_sopc_clock_1_out_granted_sdram_s1 & RamAndFlash_sopc_clock_1_out_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~((RamAndFlash_sopc_clock_0_out_granted_sdram_s1 & RamAndFlash_sopc_clock_0_out_write) | (RamAndFlash_sopc_clock_1_out_granted_sdram_s1 & RamAndFlash_sopc_clock_1_out_write));

  assign shifted_address_to_sdram_s1_from_RamAndFlash_sopc_clock_0_out = RamAndFlash_sopc_clock_0_out_address_to_slave;
  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (RamAndFlash_sopc_clock_0_out_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_RamAndFlash_sopc_clock_0_out >> 1) :
    (shifted_address_to_sdram_s1_from_RamAndFlash_sopc_clock_1_out >> 1);

  assign shifted_address_to_sdram_s1_from_RamAndFlash_sopc_clock_1_out = RamAndFlash_sopc_clock_1_out_address_to_slave;
  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (RamAndFlash_sopc_clock_0_out_granted_sdram_s1 & RamAndFlash_sopc_clock_0_out_read) | (RamAndFlash_sopc_clock_1_out_granted_sdram_s1 & RamAndFlash_sopc_clock_1_out_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = (RamAndFlash_sopc_clock_0_out_granted_sdram_s1 & RamAndFlash_sopc_clock_0_out_write) | (RamAndFlash_sopc_clock_1_out_granted_sdram_s1 & RamAndFlash_sopc_clock_1_out_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((RamAndFlash_sopc_clock_0_out_granted_sdram_s1)? RamAndFlash_sopc_clock_0_out_byteenable :
    (RamAndFlash_sopc_clock_1_out_granted_sdram_s1)? RamAndFlash_sopc_clock_1_out_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (RamAndFlash_sopc_clock_0_out_granted_sdram_s1 + RamAndFlash_sopc_clock_1_out_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (RamAndFlash_sopc_clock_0_out_saved_grant_sdram_s1 + RamAndFlash_sopc_clock_1_out_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module spi0_spi_control_port_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           reset_n,
                                           spi0_spi_control_port_dataavailable,
                                           spi0_spi_control_port_endofpacket,
                                           spi0_spi_control_port_irq,
                                           spi0_spi_control_port_readdata,
                                           spi0_spi_control_port_readyfordata,

                                          // outputs:
                                           cpu_data_master_granted_spi0_spi_control_port,
                                           cpu_data_master_qualified_request_spi0_spi_control_port,
                                           cpu_data_master_read_data_valid_spi0_spi_control_port,
                                           cpu_data_master_requests_spi0_spi_control_port,
                                           d1_spi0_spi_control_port_end_xfer,
                                           spi0_spi_control_port_address,
                                           spi0_spi_control_port_chipselect,
                                           spi0_spi_control_port_dataavailable_from_sa,
                                           spi0_spi_control_port_endofpacket_from_sa,
                                           spi0_spi_control_port_irq_from_sa,
                                           spi0_spi_control_port_read_n,
                                           spi0_spi_control_port_readdata_from_sa,
                                           spi0_spi_control_port_readyfordata_from_sa,
                                           spi0_spi_control_port_reset_n,
                                           spi0_spi_control_port_write_n,
                                           spi0_spi_control_port_writedata
                                        )
;

  output           cpu_data_master_granted_spi0_spi_control_port;
  output           cpu_data_master_qualified_request_spi0_spi_control_port;
  output           cpu_data_master_read_data_valid_spi0_spi_control_port;
  output           cpu_data_master_requests_spi0_spi_control_port;
  output           d1_spi0_spi_control_port_end_xfer;
  output  [  2: 0] spi0_spi_control_port_address;
  output           spi0_spi_control_port_chipselect;
  output           spi0_spi_control_port_dataavailable_from_sa;
  output           spi0_spi_control_port_endofpacket_from_sa;
  output           spi0_spi_control_port_irq_from_sa;
  output           spi0_spi_control_port_read_n;
  output  [ 15: 0] spi0_spi_control_port_readdata_from_sa;
  output           spi0_spi_control_port_readyfordata_from_sa;
  output           spi0_spi_control_port_reset_n;
  output           spi0_spi_control_port_write_n;
  output  [ 15: 0] spi0_spi_control_port_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            spi0_spi_control_port_dataavailable;
  input            spi0_spi_control_port_endofpacket;
  input            spi0_spi_control_port_irq;
  input   [ 15: 0] spi0_spi_control_port_readdata;
  input            spi0_spi_control_port_readyfordata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_spi0_spi_control_port;
  wire             cpu_data_master_qualified_request_spi0_spi_control_port;
  wire             cpu_data_master_read_data_valid_spi0_spi_control_port;
  wire             cpu_data_master_requests_spi0_spi_control_port;
  wire             cpu_data_master_saved_grant_spi0_spi_control_port;
  reg              d1_reasons_to_wait;
  reg              d1_spi0_spi_control_port_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_spi0_spi_control_port;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_spi0_spi_control_port_from_cpu_data_master;
  wire    [  2: 0] spi0_spi_control_port_address;
  wire             spi0_spi_control_port_allgrants;
  wire             spi0_spi_control_port_allow_new_arb_cycle;
  wire             spi0_spi_control_port_any_bursting_master_saved_grant;
  wire             spi0_spi_control_port_any_continuerequest;
  wire             spi0_spi_control_port_arb_counter_enable;
  reg     [  2: 0] spi0_spi_control_port_arb_share_counter;
  wire    [  2: 0] spi0_spi_control_port_arb_share_counter_next_value;
  wire    [  2: 0] spi0_spi_control_port_arb_share_set_values;
  wire             spi0_spi_control_port_beginbursttransfer_internal;
  wire             spi0_spi_control_port_begins_xfer;
  wire             spi0_spi_control_port_chipselect;
  wire             spi0_spi_control_port_dataavailable_from_sa;
  wire             spi0_spi_control_port_end_xfer;
  wire             spi0_spi_control_port_endofpacket_from_sa;
  wire             spi0_spi_control_port_firsttransfer;
  wire             spi0_spi_control_port_grant_vector;
  wire             spi0_spi_control_port_in_a_read_cycle;
  wire             spi0_spi_control_port_in_a_write_cycle;
  wire             spi0_spi_control_port_irq_from_sa;
  wire             spi0_spi_control_port_master_qreq_vector;
  wire             spi0_spi_control_port_non_bursting_master_requests;
  wire             spi0_spi_control_port_read_n;
  wire    [ 15: 0] spi0_spi_control_port_readdata_from_sa;
  wire             spi0_spi_control_port_readyfordata_from_sa;
  reg              spi0_spi_control_port_reg_firsttransfer;
  wire             spi0_spi_control_port_reset_n;
  reg              spi0_spi_control_port_slavearbiterlockenable;
  wire             spi0_spi_control_port_slavearbiterlockenable2;
  wire             spi0_spi_control_port_unreg_firsttransfer;
  wire             spi0_spi_control_port_waits_for_read;
  wire             spi0_spi_control_port_waits_for_write;
  wire             spi0_spi_control_port_write_n;
  wire    [ 15: 0] spi0_spi_control_port_writedata;
  wire             wait_for_spi0_spi_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~spi0_spi_control_port_end_xfer;
    end


  assign spi0_spi_control_port_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_spi0_spi_control_port));
  //assign spi0_spi_control_port_readdata_from_sa = spi0_spi_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign spi0_spi_control_port_readdata_from_sa = spi0_spi_control_port_readdata;

  assign cpu_data_master_requests_spi0_spi_control_port = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1805040) & (cpu_data_master_read | cpu_data_master_write);
  //assign spi0_spi_control_port_dataavailable_from_sa = spi0_spi_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign spi0_spi_control_port_dataavailable_from_sa = spi0_spi_control_port_dataavailable;

  //assign spi0_spi_control_port_readyfordata_from_sa = spi0_spi_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign spi0_spi_control_port_readyfordata_from_sa = spi0_spi_control_port_readyfordata;

  //spi0_spi_control_port_arb_share_counter set values, which is an e_mux
  assign spi0_spi_control_port_arb_share_set_values = 1;

  //spi0_spi_control_port_non_bursting_master_requests mux, which is an e_mux
  assign spi0_spi_control_port_non_bursting_master_requests = cpu_data_master_requests_spi0_spi_control_port;

  //spi0_spi_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign spi0_spi_control_port_any_bursting_master_saved_grant = 0;

  //spi0_spi_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign spi0_spi_control_port_arb_share_counter_next_value = spi0_spi_control_port_firsttransfer ? (spi0_spi_control_port_arb_share_set_values - 1) : |spi0_spi_control_port_arb_share_counter ? (spi0_spi_control_port_arb_share_counter - 1) : 0;

  //spi0_spi_control_port_allgrants all slave grants, which is an e_mux
  assign spi0_spi_control_port_allgrants = |spi0_spi_control_port_grant_vector;

  //spi0_spi_control_port_end_xfer assignment, which is an e_assign
  assign spi0_spi_control_port_end_xfer = ~(spi0_spi_control_port_waits_for_read | spi0_spi_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_spi0_spi_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_spi0_spi_control_port = spi0_spi_control_port_end_xfer & (~spi0_spi_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //spi0_spi_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign spi0_spi_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_spi0_spi_control_port & spi0_spi_control_port_allgrants) | (end_xfer_arb_share_counter_term_spi0_spi_control_port & ~spi0_spi_control_port_non_bursting_master_requests);

  //spi0_spi_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          spi0_spi_control_port_arb_share_counter <= 0;
      else if (spi0_spi_control_port_arb_counter_enable)
          spi0_spi_control_port_arb_share_counter <= spi0_spi_control_port_arb_share_counter_next_value;
    end


  //spi0_spi_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          spi0_spi_control_port_slavearbiterlockenable <= 0;
      else if ((|spi0_spi_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_spi0_spi_control_port) | (end_xfer_arb_share_counter_term_spi0_spi_control_port & ~spi0_spi_control_port_non_bursting_master_requests))
          spi0_spi_control_port_slavearbiterlockenable <= |spi0_spi_control_port_arb_share_counter_next_value;
    end


  //cpu/data_master spi0/spi_control_port arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = spi0_spi_control_port_slavearbiterlockenable & cpu_data_master_continuerequest;

  //spi0_spi_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign spi0_spi_control_port_slavearbiterlockenable2 = |spi0_spi_control_port_arb_share_counter_next_value;

  //cpu/data_master spi0/spi_control_port arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = spi0_spi_control_port_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //spi0_spi_control_port_any_continuerequest at least one master continues requesting, which is an e_assign
  assign spi0_spi_control_port_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_spi0_spi_control_port = cpu_data_master_requests_spi0_spi_control_port & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_spi0_spi_control_port, which is an e_mux
  assign cpu_data_master_read_data_valid_spi0_spi_control_port = cpu_data_master_granted_spi0_spi_control_port & cpu_data_master_read & ~spi0_spi_control_port_waits_for_read;

  //spi0_spi_control_port_writedata mux, which is an e_mux
  assign spi0_spi_control_port_writedata = cpu_data_master_writedata;

  //assign spi0_spi_control_port_endofpacket_from_sa = spi0_spi_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign spi0_spi_control_port_endofpacket_from_sa = spi0_spi_control_port_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_spi0_spi_control_port = cpu_data_master_qualified_request_spi0_spi_control_port;

  //cpu/data_master saved-grant spi0/spi_control_port, which is an e_assign
  assign cpu_data_master_saved_grant_spi0_spi_control_port = cpu_data_master_requests_spi0_spi_control_port;

  //allow new arb cycle for spi0/spi_control_port, which is an e_assign
  assign spi0_spi_control_port_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign spi0_spi_control_port_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign spi0_spi_control_port_master_qreq_vector = 1;

  //spi0_spi_control_port_reset_n assignment, which is an e_assign
  assign spi0_spi_control_port_reset_n = reset_n;

  assign spi0_spi_control_port_chipselect = cpu_data_master_granted_spi0_spi_control_port;
  //spi0_spi_control_port_firsttransfer first transaction, which is an e_assign
  assign spi0_spi_control_port_firsttransfer = spi0_spi_control_port_begins_xfer ? spi0_spi_control_port_unreg_firsttransfer : spi0_spi_control_port_reg_firsttransfer;

  //spi0_spi_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign spi0_spi_control_port_unreg_firsttransfer = ~(spi0_spi_control_port_slavearbiterlockenable & spi0_spi_control_port_any_continuerequest);

  //spi0_spi_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          spi0_spi_control_port_reg_firsttransfer <= 1'b1;
      else if (spi0_spi_control_port_begins_xfer)
          spi0_spi_control_port_reg_firsttransfer <= spi0_spi_control_port_unreg_firsttransfer;
    end


  //spi0_spi_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign spi0_spi_control_port_beginbursttransfer_internal = spi0_spi_control_port_begins_xfer;

  //~spi0_spi_control_port_read_n assignment, which is an e_mux
  assign spi0_spi_control_port_read_n = ~(cpu_data_master_granted_spi0_spi_control_port & cpu_data_master_read);

  //~spi0_spi_control_port_write_n assignment, which is an e_mux
  assign spi0_spi_control_port_write_n = ~(cpu_data_master_granted_spi0_spi_control_port & cpu_data_master_write);

  assign shifted_address_to_spi0_spi_control_port_from_cpu_data_master = cpu_data_master_address_to_slave;
  //spi0_spi_control_port_address mux, which is an e_mux
  assign spi0_spi_control_port_address = shifted_address_to_spi0_spi_control_port_from_cpu_data_master >> 2;

  //d1_spi0_spi_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_spi0_spi_control_port_end_xfer <= 1;
      else 
        d1_spi0_spi_control_port_end_xfer <= spi0_spi_control_port_end_xfer;
    end


  //spi0_spi_control_port_waits_for_read in a cycle, which is an e_mux
  assign spi0_spi_control_port_waits_for_read = spi0_spi_control_port_in_a_read_cycle & spi0_spi_control_port_begins_xfer;

  //spi0_spi_control_port_in_a_read_cycle assignment, which is an e_assign
  assign spi0_spi_control_port_in_a_read_cycle = cpu_data_master_granted_spi0_spi_control_port & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = spi0_spi_control_port_in_a_read_cycle;

  //spi0_spi_control_port_waits_for_write in a cycle, which is an e_mux
  assign spi0_spi_control_port_waits_for_write = spi0_spi_control_port_in_a_write_cycle & spi0_spi_control_port_begins_xfer;

  //spi0_spi_control_port_in_a_write_cycle assignment, which is an e_assign
  assign spi0_spi_control_port_in_a_write_cycle = cpu_data_master_granted_spi0_spi_control_port & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = spi0_spi_control_port_in_a_write_cycle;

  assign wait_for_spi0_spi_control_port_counter = 0;
  //assign spi0_spi_control_port_irq_from_sa = spi0_spi_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign spi0_spi_control_port_irq_from_sa = spi0_spi_control_port_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //spi0/spi_control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_latency_counter,
                                         cpu_data_master_read,
                                         cpu_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_data_master_granted_sysid_control_slave,
                                         cpu_data_master_qualified_request_sysid_control_slave,
                                         cpu_data_master_read_data_valid_sysid_control_slave,
                                         cpu_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_data_master_granted_sysid_control_slave;
  output           cpu_data_master_qualified_request_sysid_control_slave;
  output           cpu_data_master_read_data_valid_sysid_control_slave;
  output           cpu_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  2: 0] sysid_control_slave_arb_share_counter;
  wire    [  2: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h18050e8) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sysid_control_slave = cpu_data_master_requests_sysid_control_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_sysid_control_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_sysid_control_slave = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign cpu_data_master_granted_sysid_control_slave = cpu_data_master_qualified_request_sysid_control_slave;

  //cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_latency_counter,
                              cpu_data_master_read,
                              cpu_data_master_write,
                              cpu_data_master_writedata,
                              reset_n,
                              timer_s1_irq,
                              timer_s1_readdata,

                             // outputs:
                              cpu_data_master_granted_timer_s1,
                              cpu_data_master_qualified_request_timer_s1,
                              cpu_data_master_read_data_valid_timer_s1,
                              cpu_data_master_requests_timer_s1,
                              d1_timer_s1_end_xfer,
                              timer_s1_address,
                              timer_s1_chipselect,
                              timer_s1_irq_from_sa,
                              timer_s1_readdata_from_sa,
                              timer_s1_reset_n,
                              timer_s1_write_n,
                              timer_s1_writedata
                           )
;

  output           cpu_data_master_granted_timer_s1;
  output           cpu_data_master_qualified_request_timer_s1;
  output           cpu_data_master_read_data_valid_timer_s1;
  output           cpu_data_master_requests_timer_s1;
  output           d1_timer_s1_end_xfer;
  output  [  2: 0] timer_s1_address;
  output           timer_s1_chipselect;
  output           timer_s1_irq_from_sa;
  output  [ 15: 0] timer_s1_readdata_from_sa;
  output           timer_s1_reset_n;
  output           timer_s1_write_n;
  output  [ 15: 0] timer_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            timer_s1_irq;
  input   [ 15: 0] timer_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_timer_s1;
  wire             cpu_data_master_qualified_request_timer_s1;
  wire             cpu_data_master_read_data_valid_timer_s1;
  wire             cpu_data_master_requests_timer_s1;
  wire             cpu_data_master_saved_grant_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_timer_s1_from_cpu_data_master;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_allgrants;
  wire             timer_s1_allow_new_arb_cycle;
  wire             timer_s1_any_bursting_master_saved_grant;
  wire             timer_s1_any_continuerequest;
  wire             timer_s1_arb_counter_enable;
  reg     [  2: 0] timer_s1_arb_share_counter;
  wire    [  2: 0] timer_s1_arb_share_counter_next_value;
  wire    [  2: 0] timer_s1_arb_share_set_values;
  wire             timer_s1_beginbursttransfer_internal;
  wire             timer_s1_begins_xfer;
  wire             timer_s1_chipselect;
  wire             timer_s1_end_xfer;
  wire             timer_s1_firsttransfer;
  wire             timer_s1_grant_vector;
  wire             timer_s1_in_a_read_cycle;
  wire             timer_s1_in_a_write_cycle;
  wire             timer_s1_irq_from_sa;
  wire             timer_s1_master_qreq_vector;
  wire             timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  reg              timer_s1_reg_firsttransfer;
  wire             timer_s1_reset_n;
  reg              timer_s1_slavearbiterlockenable;
  wire             timer_s1_slavearbiterlockenable2;
  wire             timer_s1_unreg_firsttransfer;
  wire             timer_s1_waits_for_read;
  wire             timer_s1_waits_for_write;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             wait_for_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_s1_end_xfer;
    end


  assign timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_timer_s1));
  //assign timer_s1_readdata_from_sa = timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_readdata_from_sa = timer_s1_readdata;

  assign cpu_data_master_requests_timer_s1 = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1805000) & (cpu_data_master_read | cpu_data_master_write);
  //timer_s1_arb_share_counter set values, which is an e_mux
  assign timer_s1_arb_share_set_values = 1;

  //timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_s1_non_bursting_master_requests = cpu_data_master_requests_timer_s1;

  //timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_s1_any_bursting_master_saved_grant = 0;

  //timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_s1_arb_share_counter_next_value = timer_s1_firsttransfer ? (timer_s1_arb_share_set_values - 1) : |timer_s1_arb_share_counter ? (timer_s1_arb_share_counter - 1) : 0;

  //timer_s1_allgrants all slave grants, which is an e_mux
  assign timer_s1_allgrants = |timer_s1_grant_vector;

  //timer_s1_end_xfer assignment, which is an e_assign
  assign timer_s1_end_xfer = ~(timer_s1_waits_for_read | timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_s1 = timer_s1_end_xfer & (~timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_s1 & timer_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests);

  //timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_arb_share_counter <= 0;
      else if (timer_s1_arb_counter_enable)
          timer_s1_arb_share_counter <= timer_s1_arb_share_counter_next_value;
    end


  //timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_slavearbiterlockenable <= 0;
      else if ((|timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_s1) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests))
          timer_s1_slavearbiterlockenable <= |timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_s1_slavearbiterlockenable2 = |timer_s1_arb_share_counter_next_value;

  //cpu/data_master timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_timer_s1 = cpu_data_master_requests_timer_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_timer_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_timer_s1 = cpu_data_master_granted_timer_s1 & cpu_data_master_read & ~timer_s1_waits_for_read;

  //timer_s1_writedata mux, which is an e_mux
  assign timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_timer_s1 = cpu_data_master_qualified_request_timer_s1;

  //cpu/data_master saved-grant timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_timer_s1 = cpu_data_master_requests_timer_s1;

  //allow new arb cycle for timer/s1, which is an e_assign
  assign timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_s1_master_qreq_vector = 1;

  //timer_s1_reset_n assignment, which is an e_assign
  assign timer_s1_reset_n = reset_n;

  assign timer_s1_chipselect = cpu_data_master_granted_timer_s1;
  //timer_s1_firsttransfer first transaction, which is an e_assign
  assign timer_s1_firsttransfer = timer_s1_begins_xfer ? timer_s1_unreg_firsttransfer : timer_s1_reg_firsttransfer;

  //timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_s1_unreg_firsttransfer = ~(timer_s1_slavearbiterlockenable & timer_s1_any_continuerequest);

  //timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_reg_firsttransfer <= 1'b1;
      else if (timer_s1_begins_xfer)
          timer_s1_reg_firsttransfer <= timer_s1_unreg_firsttransfer;
    end


  //timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_s1_beginbursttransfer_internal = timer_s1_begins_xfer;

  //~timer_s1_write_n assignment, which is an e_mux
  assign timer_s1_write_n = ~(cpu_data_master_granted_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //timer_s1_address mux, which is an e_mux
  assign timer_s1_address = shifted_address_to_timer_s1_from_cpu_data_master >> 2;

  //d1_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_s1_end_xfer <= 1;
      else 
        d1_timer_s1_end_xfer <= timer_s1_end_xfer;
    end


  //timer_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_s1_waits_for_read = timer_s1_in_a_read_cycle & timer_s1_begins_xfer;

  //timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_s1_in_a_read_cycle = cpu_data_master_granted_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_s1_in_a_read_cycle;

  //timer_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_s1_waits_for_write = timer_s1_in_a_write_cycle & 0;

  //timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_s1_in_a_write_cycle = cpu_data_master_granted_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_s1_in_a_write_cycle;

  assign wait_for_timer_s1_counter = 0;
  //assign timer_s1_irq_from_sa = timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_irq_from_sa = timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_avalon_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_data_master_address_to_slave,
                                                   cpu_data_master_byteenable,
                                                   cpu_data_master_dbs_address,
                                                   cpu_data_master_dbs_write_16,
                                                   cpu_data_master_latency_counter,
                                                   cpu_data_master_read,
                                                   cpu_data_master_write,
                                                   cpu_instruction_master_address_to_slave,
                                                   cpu_instruction_master_dbs_address,
                                                   cpu_instruction_master_latency_counter,
                                                   cpu_instruction_master_read,
                                                   reset_n,

                                                  // outputs:
                                                   address_to_the_cfi_flash,
                                                   cfi_flash_s1_wait_counter_eq_0,
                                                   cpu_data_master_byteenable_cfi_flash_s1,
                                                   cpu_data_master_granted_cfi_flash_s1,
                                                   cpu_data_master_qualified_request_cfi_flash_s1,
                                                   cpu_data_master_read_data_valid_cfi_flash_s1,
                                                   cpu_data_master_requests_cfi_flash_s1,
                                                   cpu_instruction_master_granted_cfi_flash_s1,
                                                   cpu_instruction_master_qualified_request_cfi_flash_s1,
                                                   cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                                   cpu_instruction_master_requests_cfi_flash_s1,
                                                   d1_tri_state_bridge_avalon_slave_end_xfer,
                                                   data_to_and_from_the_cfi_flash,
                                                   incoming_data_to_and_from_the_cfi_flash,
                                                   incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                                   read_n_to_the_cfi_flash,
                                                   select_n_to_the_cfi_flash,
                                                   write_n_to_the_cfi_flash
                                                )
;

  output  [ 21: 0] address_to_the_cfi_flash;
  output           cfi_flash_s1_wait_counter_eq_0;
  output  [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  output           cpu_data_master_granted_cfi_flash_s1;
  output           cpu_data_master_qualified_request_cfi_flash_s1;
  output           cpu_data_master_read_data_valid_cfi_flash_s1;
  output           cpu_data_master_requests_cfi_flash_s1;
  output           cpu_instruction_master_granted_cfi_flash_s1;
  output           cpu_instruction_master_qualified_request_cfi_flash_s1;
  output           cpu_instruction_master_read_data_valid_cfi_flash_s1;
  output           cpu_instruction_master_requests_cfi_flash_s1;
  output           d1_tri_state_bridge_avalon_slave_end_xfer;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash;
  output  [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  output  [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           write_n_to_the_cfi_flash;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;

  reg     [ 21: 0] address_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  3: 0] cfi_flash_s1_counter_load_value;
  wire             cfi_flash_s1_in_a_read_cycle;
  wire             cfi_flash_s1_in_a_write_cycle;
  reg     [  3: 0] cfi_flash_s1_wait_counter;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_waits_for_read;
  wire             cfi_flash_s1_waits_for_write;
  wire             cfi_flash_s1_with_write_latency;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_saved_grant_cfi_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_saved_grant_cfi_flash_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 15: 0] d1_outgoing_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_avalon_slave_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 15: 0] incoming_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_0_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_10_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_11_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_12_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_13_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_14_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_15_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_1_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_2_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_3_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_4_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_5_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_6_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_7_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_8_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_9_is_x;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
  wire    [ 15: 0] outgoing_data_to_and_from_the_cfi_flash;
  wire    [ 21: 0] p1_address_to_the_cfi_flash;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash;
  wire             p1_select_n_to_the_cfi_flash;
  wire             p1_write_n_to_the_cfi_flash;
  reg              read_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             tri_state_bridge_avalon_slave_allgrants;
  wire             tri_state_bridge_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_avalon_slave_arb_addend;
  wire             tri_state_bridge_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tri_state_bridge_avalon_slave_arb_share_counter;
  wire    [  2: 0] tri_state_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tri_state_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_avalon_slave_arb_winner;
  wire             tri_state_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_avalon_slave_end_xfer;
  wire             tri_state_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_avalon_slave_read_pending;
  reg              tri_state_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tri_state_bridge_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_avalon_slave_write_pending;
  wire             wait_for_cfi_flash_s1_counter;
  reg              write_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1));
  assign cpu_data_master_requests_cfi_flash_s1 = ({cpu_data_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_cfi_flash of type chipselect to ~p1_select_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash <= ~0;
      else 
        select_n_to_the_cfi_flash <= p1_select_n_to_the_cfi_flash;
    end


  assign tri_state_bridge_avalon_slave_write_pending = 0;
  //tri_state_bridge/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_avalon_slave_read_pending = 0;

  //tri_state_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_avalon_slave_arb_share_set_values = (cpu_data_master_granted_cfi_flash_s1)? 2 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 2 :
    (cpu_data_master_granted_cfi_flash_s1)? 2 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 2 :
    1;

  //tri_state_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1 |
    cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_avalon_slave_arb_share_counter_next_value = tri_state_bridge_avalon_slave_firsttransfer ? (tri_state_bridge_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_avalon_slave_arb_share_counter ? (tri_state_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_avalon_slave_allgrants = (|tri_state_bridge_avalon_slave_grant_vector) |
    (|tri_state_bridge_avalon_slave_grant_vector) |
    (|tri_state_bridge_avalon_slave_grant_vector) |
    (|tri_state_bridge_avalon_slave_grant_vector);

  //tri_state_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_avalon_slave_end_xfer = ~(cfi_flash_s1_waits_for_read | cfi_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave = tri_state_bridge_avalon_slave_end_xfer & (~tri_state_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave & tri_state_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave & ~tri_state_bridge_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_avalon_slave_arb_counter_enable)
          tri_state_bridge_avalon_slave_arb_share_counter <= tri_state_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave & ~tri_state_bridge_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master tri_state_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tri_state_bridge_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tri_state_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master tri_state_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tri_state_bridge_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master tri_state_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tri_state_bridge_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tri_state_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tri_state_bridge_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= cpu_instruction_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 & cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cfi_flash_s1 = cpu_data_master_requests_cfi_flash_s1 & ~((cpu_data_master_read & (tri_state_bridge_avalon_slave_write_pending | (tri_state_bridge_avalon_slave_read_pending) | (2 < cpu_data_master_latency_counter))) | ((tri_state_bridge_avalon_slave_read_pending | !cpu_data_master_byteenable_cfi_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_data_master_read_data_valid_cfi_flash_s1_shift_register, cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_cfi_flash <= 0;
      else 
        incoming_data_to_and_from_the_cfi_flash <= data_to_and_from_the_cfi_flash;
    end


  //cfi_flash_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_cfi_flash <= 0;
      else 
        d1_outgoing_data_to_and_from_the_cfi_flash <= outgoing_data_to_and_from_the_cfi_flash;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_cfi_flash tristate driver, which is an e_assign
  assign data_to_and_from_the_cfi_flash = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_cfi_flash:{16{1'bz}};

  //outgoing_data_to_and_from_the_cfi_flash mux, which is an e_mux
  assign outgoing_data_to_and_from_the_cfi_flash = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_cfi_flash_s1 = (({cpu_instruction_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= cpu_data_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 & cpu_data_master_requests_cfi_flash_s1;

  assign cpu_instruction_master_qualified_request_cfi_flash_s1 = cpu_instruction_master_requests_cfi_flash_s1 & ~((cpu_instruction_master_read & (tri_state_bridge_avalon_slave_write_pending | (tri_state_bridge_avalon_slave_read_pending) | (2 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register, cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1 = cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge/avalon_slave, which is an e_assign
  assign tri_state_bridge_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cfi_flash_s1;

  //cpu/instruction_master grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_cfi_flash_s1 = tri_state_bridge_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_cfi_flash_s1 = tri_state_bridge_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_cfi_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_cfi_flash_s1;

  //cpu/data_master grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_granted_cfi_flash_s1 = tri_state_bridge_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cfi_flash_s1 = tri_state_bridge_avalon_slave_arb_winner[1] && cpu_data_master_requests_cfi_flash_s1;

  //tri_state_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_avalon_slave_chosen_master_double_vector = {tri_state_bridge_avalon_slave_master_qreq_vector, tri_state_bridge_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_avalon_slave_master_qreq_vector, ~tri_state_bridge_avalon_slave_master_qreq_vector} + tri_state_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_avalon_slave_arb_winner = (tri_state_bridge_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_avalon_slave_grant_vector) ? tri_state_bridge_avalon_slave_grant_vector : tri_state_bridge_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_avalon_slave_grant_vector ? tri_state_bridge_avalon_slave_grant_vector : tri_state_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_avalon_slave_grant_vector = {(tri_state_bridge_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_avalon_slave_chosen_master_rot_left = (tri_state_bridge_avalon_slave_arb_winner << 1) ? (tri_state_bridge_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_avalon_slave_grant_vector)
          tri_state_bridge_avalon_slave_arb_addend <= tri_state_bridge_avalon_slave_end_xfer? tri_state_bridge_avalon_slave_chosen_master_rot_left : tri_state_bridge_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash = ~(cpu_data_master_granted_cfi_flash_s1 | cpu_instruction_master_granted_cfi_flash_s1);
  //tri_state_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_avalon_slave_firsttransfer = tri_state_bridge_avalon_slave_begins_xfer ? tri_state_bridge_avalon_slave_unreg_firsttransfer : tri_state_bridge_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_avalon_slave_slavearbiterlockenable & tri_state_bridge_avalon_slave_any_continuerequest);

  //tri_state_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_avalon_slave_begins_xfer)
          tri_state_bridge_avalon_slave_reg_firsttransfer <= tri_state_bridge_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_avalon_slave_beginbursttransfer_internal = tri_state_bridge_avalon_slave_begins_xfer;

  //tri_state_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_avalon_slave_begins_xfer & tri_state_bridge_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash of type read to ~p1_read_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash <= ~0;
      else 
        read_n_to_the_cfi_flash <= p1_read_n_to_the_cfi_flash;
    end


  //~p1_read_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read))& ~tri_state_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter < 5));

  //~write_n_to_the_cfi_flash of type write to ~p1_write_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash <= ~0;
      else 
        write_n_to_the_cfi_flash <= p1_write_n_to_the_cfi_flash;
    end


  //~p1_write_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write)) & ~tri_state_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter >= 3) & (cfi_flash_s1_wait_counter < 8));

  //address_to_the_cfi_flash of type address to p1_address_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_cfi_flash <= 0;
      else 
        address_to_the_cfi_flash <= p1_address_to_the_cfi_flash;
    end


  //p1_address_to_the_cfi_flash mux, which is an e_mux
  assign p1_address_to_the_cfi_flash = (cpu_data_master_granted_cfi_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}});

  //d1_tri_state_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_avalon_slave_end_xfer <= tri_state_bridge_avalon_slave_end_xfer;
    end


  //cfi_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_read = cfi_flash_s1_in_a_read_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_read_cycle = (cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_s1_in_a_read_cycle;

  //cfi_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_write = cfi_flash_s1_in_a_write_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_write_cycle = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_s1_in_a_write_cycle;

  assign cfi_flash_s1_wait_counter_eq_0 = cfi_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_s1_wait_counter <= 0;
      else 
        cfi_flash_s1_wait_counter <= cfi_flash_s1_counter_load_value;
    end


  assign cfi_flash_s1_counter_load_value = ((cfi_flash_s1_in_a_read_cycle & tri_state_bridge_avalon_slave_begins_xfer))? 6 :
    ((cfi_flash_s1_in_a_write_cycle & tri_state_bridge_avalon_slave_begins_xfer))? 9 :
    (~cfi_flash_s1_wait_counter_eq_0)? cfi_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_s1_counter = tri_state_bridge_avalon_slave_begins_xfer | ~cfi_flash_s1_wait_counter_eq_0;
  assign {cpu_data_master_byteenable_cfi_flash_s1_segment_1,
cpu_data_master_byteenable_cfi_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_cfi_flash_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_cfi_flash_s1_segment_0 :
    cpu_data_master_byteenable_cfi_flash_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_cfi_flash_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_0_is_x = ^(incoming_data_to_and_from_the_cfi_flash[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_cfi_flash_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[0];

  //incoming_data_to_and_from_the_cfi_flash_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_1_is_x = ^(incoming_data_to_and_from_the_cfi_flash[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_cfi_flash_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[1];

  //incoming_data_to_and_from_the_cfi_flash_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_2_is_x = ^(incoming_data_to_and_from_the_cfi_flash[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_cfi_flash_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[2];

  //incoming_data_to_and_from_the_cfi_flash_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_3_is_x = ^(incoming_data_to_and_from_the_cfi_flash[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_cfi_flash_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[3];

  //incoming_data_to_and_from_the_cfi_flash_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_4_is_x = ^(incoming_data_to_and_from_the_cfi_flash[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_cfi_flash_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[4];

  //incoming_data_to_and_from_the_cfi_flash_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_5_is_x = ^(incoming_data_to_and_from_the_cfi_flash[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_cfi_flash_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[5];

  //incoming_data_to_and_from_the_cfi_flash_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_6_is_x = ^(incoming_data_to_and_from_the_cfi_flash[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_cfi_flash_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[6];

  //incoming_data_to_and_from_the_cfi_flash_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_7_is_x = ^(incoming_data_to_and_from_the_cfi_flash[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_cfi_flash_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[7];

  //incoming_data_to_and_from_the_cfi_flash_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_8_is_x = ^(incoming_data_to_and_from_the_cfi_flash[8]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[8] = incoming_data_to_and_from_the_cfi_flash_bit_8_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[8];

  //incoming_data_to_and_from_the_cfi_flash_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_9_is_x = ^(incoming_data_to_and_from_the_cfi_flash[9]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[9] = incoming_data_to_and_from_the_cfi_flash_bit_9_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[9];

  //incoming_data_to_and_from_the_cfi_flash_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_10_is_x = ^(incoming_data_to_and_from_the_cfi_flash[10]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[10] = incoming_data_to_and_from_the_cfi_flash_bit_10_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[10];

  //incoming_data_to_and_from_the_cfi_flash_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_11_is_x = ^(incoming_data_to_and_from_the_cfi_flash[11]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[11] = incoming_data_to_and_from_the_cfi_flash_bit_11_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[11];

  //incoming_data_to_and_from_the_cfi_flash_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_12_is_x = ^(incoming_data_to_and_from_the_cfi_flash[12]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[12] = incoming_data_to_and_from_the_cfi_flash_bit_12_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[12];

  //incoming_data_to_and_from_the_cfi_flash_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_13_is_x = ^(incoming_data_to_and_from_the_cfi_flash[13]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[13] = incoming_data_to_and_from_the_cfi_flash_bit_13_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[13];

  //incoming_data_to_and_from_the_cfi_flash_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_14_is_x = ^(incoming_data_to_and_from_the_cfi_flash[14]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[14] = incoming_data_to_and_from_the_cfi_flash_bit_14_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[14];

  //incoming_data_to_and_from_the_cfi_flash_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_15_is_x = ^(incoming_data_to_and_from_the_cfi_flash[15]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15] = incoming_data_to_and_from_the_cfi_flash_bit_15_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[15];

  //cfi_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cfi_flash_s1 + cpu_instruction_master_granted_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cfi_flash_s1 + cpu_instruction_master_saved_grant_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 = incoming_data_to_and_from_the_cfi_flash;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart0_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_latency_counter,
                              cpu_data_master_read,
                              cpu_data_master_write,
                              cpu_data_master_writedata,
                              reset_n,
                              uart0_s1_dataavailable,
                              uart0_s1_irq,
                              uart0_s1_readdata,
                              uart0_s1_readyfordata,

                             // outputs:
                              cpu_data_master_granted_uart0_s1,
                              cpu_data_master_qualified_request_uart0_s1,
                              cpu_data_master_read_data_valid_uart0_s1,
                              cpu_data_master_requests_uart0_s1,
                              d1_uart0_s1_end_xfer,
                              uart0_s1_address,
                              uart0_s1_begintransfer,
                              uart0_s1_chipselect,
                              uart0_s1_dataavailable_from_sa,
                              uart0_s1_irq_from_sa,
                              uart0_s1_read_n,
                              uart0_s1_readdata_from_sa,
                              uart0_s1_readyfordata_from_sa,
                              uart0_s1_reset_n,
                              uart0_s1_write_n,
                              uart0_s1_writedata
                           )
;

  output           cpu_data_master_granted_uart0_s1;
  output           cpu_data_master_qualified_request_uart0_s1;
  output           cpu_data_master_read_data_valid_uart0_s1;
  output           cpu_data_master_requests_uart0_s1;
  output           d1_uart0_s1_end_xfer;
  output  [  2: 0] uart0_s1_address;
  output           uart0_s1_begintransfer;
  output           uart0_s1_chipselect;
  output           uart0_s1_dataavailable_from_sa;
  output           uart0_s1_irq_from_sa;
  output           uart0_s1_read_n;
  output  [ 15: 0] uart0_s1_readdata_from_sa;
  output           uart0_s1_readyfordata_from_sa;
  output           uart0_s1_reset_n;
  output           uart0_s1_write_n;
  output  [ 15: 0] uart0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            uart0_s1_dataavailable;
  input            uart0_s1_irq;
  input   [ 15: 0] uart0_s1_readdata;
  input            uart0_s1_readyfordata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_uart0_s1;
  wire             cpu_data_master_qualified_request_uart0_s1;
  wire             cpu_data_master_read_data_valid_uart0_s1;
  wire             cpu_data_master_requests_uart0_s1;
  wire             cpu_data_master_saved_grant_uart0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_uart0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_uart0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_uart0_s1_from_cpu_data_master;
  wire    [  2: 0] uart0_s1_address;
  wire             uart0_s1_allgrants;
  wire             uart0_s1_allow_new_arb_cycle;
  wire             uart0_s1_any_bursting_master_saved_grant;
  wire             uart0_s1_any_continuerequest;
  wire             uart0_s1_arb_counter_enable;
  reg     [  2: 0] uart0_s1_arb_share_counter;
  wire    [  2: 0] uart0_s1_arb_share_counter_next_value;
  wire    [  2: 0] uart0_s1_arb_share_set_values;
  wire             uart0_s1_beginbursttransfer_internal;
  wire             uart0_s1_begins_xfer;
  wire             uart0_s1_begintransfer;
  wire             uart0_s1_chipselect;
  wire             uart0_s1_dataavailable_from_sa;
  wire             uart0_s1_end_xfer;
  wire             uart0_s1_firsttransfer;
  wire             uart0_s1_grant_vector;
  wire             uart0_s1_in_a_read_cycle;
  wire             uart0_s1_in_a_write_cycle;
  wire             uart0_s1_irq_from_sa;
  wire             uart0_s1_master_qreq_vector;
  wire             uart0_s1_non_bursting_master_requests;
  wire             uart0_s1_read_n;
  wire    [ 15: 0] uart0_s1_readdata_from_sa;
  wire             uart0_s1_readyfordata_from_sa;
  reg              uart0_s1_reg_firsttransfer;
  wire             uart0_s1_reset_n;
  reg              uart0_s1_slavearbiterlockenable;
  wire             uart0_s1_slavearbiterlockenable2;
  wire             uart0_s1_unreg_firsttransfer;
  wire             uart0_s1_waits_for_read;
  wire             uart0_s1_waits_for_write;
  wire             uart0_s1_write_n;
  wire    [ 15: 0] uart0_s1_writedata;
  wire             wait_for_uart0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~uart0_s1_end_xfer;
    end


  assign uart0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_uart0_s1));
  //assign uart0_s1_readdata_from_sa = uart0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart0_s1_readdata_from_sa = uart0_s1_readdata;

  assign cpu_data_master_requests_uart0_s1 = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1805020) & (cpu_data_master_read | cpu_data_master_write);
  //assign uart0_s1_dataavailable_from_sa = uart0_s1_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart0_s1_dataavailable_from_sa = uart0_s1_dataavailable;

  //assign uart0_s1_readyfordata_from_sa = uart0_s1_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart0_s1_readyfordata_from_sa = uart0_s1_readyfordata;

  //uart0_s1_arb_share_counter set values, which is an e_mux
  assign uart0_s1_arb_share_set_values = 1;

  //uart0_s1_non_bursting_master_requests mux, which is an e_mux
  assign uart0_s1_non_bursting_master_requests = cpu_data_master_requests_uart0_s1;

  //uart0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign uart0_s1_any_bursting_master_saved_grant = 0;

  //uart0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign uart0_s1_arb_share_counter_next_value = uart0_s1_firsttransfer ? (uart0_s1_arb_share_set_values - 1) : |uart0_s1_arb_share_counter ? (uart0_s1_arb_share_counter - 1) : 0;

  //uart0_s1_allgrants all slave grants, which is an e_mux
  assign uart0_s1_allgrants = |uart0_s1_grant_vector;

  //uart0_s1_end_xfer assignment, which is an e_assign
  assign uart0_s1_end_xfer = ~(uart0_s1_waits_for_read | uart0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_uart0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_uart0_s1 = uart0_s1_end_xfer & (~uart0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //uart0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign uart0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_uart0_s1 & uart0_s1_allgrants) | (end_xfer_arb_share_counter_term_uart0_s1 & ~uart0_s1_non_bursting_master_requests);

  //uart0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart0_s1_arb_share_counter <= 0;
      else if (uart0_s1_arb_counter_enable)
          uart0_s1_arb_share_counter <= uart0_s1_arb_share_counter_next_value;
    end


  //uart0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart0_s1_slavearbiterlockenable <= 0;
      else if ((|uart0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_uart0_s1) | (end_xfer_arb_share_counter_term_uart0_s1 & ~uart0_s1_non_bursting_master_requests))
          uart0_s1_slavearbiterlockenable <= |uart0_s1_arb_share_counter_next_value;
    end


  //cpu/data_master uart0/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = uart0_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //uart0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign uart0_s1_slavearbiterlockenable2 = |uart0_s1_arb_share_counter_next_value;

  //cpu/data_master uart0/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = uart0_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //uart0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign uart0_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_uart0_s1 = cpu_data_master_requests_uart0_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0))));
  //local readdatavalid cpu_data_master_read_data_valid_uart0_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_uart0_s1 = cpu_data_master_granted_uart0_s1 & cpu_data_master_read & ~uart0_s1_waits_for_read;

  //uart0_s1_writedata mux, which is an e_mux
  assign uart0_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_uart0_s1 = cpu_data_master_qualified_request_uart0_s1;

  //cpu/data_master saved-grant uart0/s1, which is an e_assign
  assign cpu_data_master_saved_grant_uart0_s1 = cpu_data_master_requests_uart0_s1;

  //allow new arb cycle for uart0/s1, which is an e_assign
  assign uart0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign uart0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign uart0_s1_master_qreq_vector = 1;

  assign uart0_s1_begintransfer = uart0_s1_begins_xfer;
  //uart0_s1_reset_n assignment, which is an e_assign
  assign uart0_s1_reset_n = reset_n;

  assign uart0_s1_chipselect = cpu_data_master_granted_uart0_s1;
  //uart0_s1_firsttransfer first transaction, which is an e_assign
  assign uart0_s1_firsttransfer = uart0_s1_begins_xfer ? uart0_s1_unreg_firsttransfer : uart0_s1_reg_firsttransfer;

  //uart0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign uart0_s1_unreg_firsttransfer = ~(uart0_s1_slavearbiterlockenable & uart0_s1_any_continuerequest);

  //uart0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart0_s1_reg_firsttransfer <= 1'b1;
      else if (uart0_s1_begins_xfer)
          uart0_s1_reg_firsttransfer <= uart0_s1_unreg_firsttransfer;
    end


  //uart0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign uart0_s1_beginbursttransfer_internal = uart0_s1_begins_xfer;

  //~uart0_s1_read_n assignment, which is an e_mux
  assign uart0_s1_read_n = ~(cpu_data_master_granted_uart0_s1 & cpu_data_master_read);

  //~uart0_s1_write_n assignment, which is an e_mux
  assign uart0_s1_write_n = ~(cpu_data_master_granted_uart0_s1 & cpu_data_master_write);

  assign shifted_address_to_uart0_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //uart0_s1_address mux, which is an e_mux
  assign uart0_s1_address = shifted_address_to_uart0_s1_from_cpu_data_master >> 2;

  //d1_uart0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_uart0_s1_end_xfer <= 1;
      else 
        d1_uart0_s1_end_xfer <= uart0_s1_end_xfer;
    end


  //uart0_s1_waits_for_read in a cycle, which is an e_mux
  assign uart0_s1_waits_for_read = uart0_s1_in_a_read_cycle & uart0_s1_begins_xfer;

  //uart0_s1_in_a_read_cycle assignment, which is an e_assign
  assign uart0_s1_in_a_read_cycle = cpu_data_master_granted_uart0_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = uart0_s1_in_a_read_cycle;

  //uart0_s1_waits_for_write in a cycle, which is an e_mux
  assign uart0_s1_waits_for_write = uart0_s1_in_a_write_cycle & uart0_s1_begins_xfer;

  //uart0_s1_in_a_write_cycle assignment, which is an e_assign
  assign uart0_s1_in_a_write_cycle = cpu_data_master_granted_uart0_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = uart0_s1_in_a_write_cycle;

  assign wait_for_uart0_s1_counter = 0;
  //assign uart0_s1_irq_from_sa = uart0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart0_s1_irq_from_sa = uart0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uart0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_alpha_blender_avalon_background_sink_arbitrator (
                                                               // inputs:
                                                                clk,
                                                                reset_n,
                                                                video_alpha_blender_avalon_background_sink_ready,
                                                                video_scaler_avalon_scaler_source_data,
                                                                video_scaler_avalon_scaler_source_endofpacket,
                                                                video_scaler_avalon_scaler_source_startofpacket,
                                                                video_scaler_avalon_scaler_source_valid,

                                                               // outputs:
                                                                video_alpha_blender_avalon_background_sink_data,
                                                                video_alpha_blender_avalon_background_sink_endofpacket,
                                                                video_alpha_blender_avalon_background_sink_ready_from_sa,
                                                                video_alpha_blender_avalon_background_sink_startofpacket,
                                                                video_alpha_blender_avalon_background_sink_valid
                                                             )
;

  output  [ 29: 0] video_alpha_blender_avalon_background_sink_data;
  output           video_alpha_blender_avalon_background_sink_endofpacket;
  output           video_alpha_blender_avalon_background_sink_ready_from_sa;
  output           video_alpha_blender_avalon_background_sink_startofpacket;
  output           video_alpha_blender_avalon_background_sink_valid;
  input            clk;
  input            reset_n;
  input            video_alpha_blender_avalon_background_sink_ready;
  input   [ 29: 0] video_scaler_avalon_scaler_source_data;
  input            video_scaler_avalon_scaler_source_endofpacket;
  input            video_scaler_avalon_scaler_source_startofpacket;
  input            video_scaler_avalon_scaler_source_valid;

  wire    [ 29: 0] video_alpha_blender_avalon_background_sink_data;
  wire             video_alpha_blender_avalon_background_sink_endofpacket;
  wire             video_alpha_blender_avalon_background_sink_ready_from_sa;
  wire             video_alpha_blender_avalon_background_sink_startofpacket;
  wire             video_alpha_blender_avalon_background_sink_valid;
  //mux video_alpha_blender_avalon_background_sink_data, which is an e_mux
  assign video_alpha_blender_avalon_background_sink_data = video_scaler_avalon_scaler_source_data;

  //mux video_alpha_blender_avalon_background_sink_endofpacket, which is an e_mux
  assign video_alpha_blender_avalon_background_sink_endofpacket = video_scaler_avalon_scaler_source_endofpacket;

  //assign video_alpha_blender_avalon_background_sink_ready_from_sa = video_alpha_blender_avalon_background_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_alpha_blender_avalon_background_sink_ready_from_sa = video_alpha_blender_avalon_background_sink_ready;

  //mux video_alpha_blender_avalon_background_sink_startofpacket, which is an e_mux
  assign video_alpha_blender_avalon_background_sink_startofpacket = video_scaler_avalon_scaler_source_startofpacket;

  //mux video_alpha_blender_avalon_background_sink_valid, which is an e_mux
  assign video_alpha_blender_avalon_background_sink_valid = video_scaler_avalon_scaler_source_valid;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_alpha_blender_avalon_foreground_sink_arbitrator (
                                                               // inputs:
                                                                clk,
                                                                reset_n,
                                                                video_alpha_blender_avalon_foreground_sink_ready,
                                                                video_character_buffer_with_dma_avalon_char_source_data,
                                                                video_character_buffer_with_dma_avalon_char_source_endofpacket,
                                                                video_character_buffer_with_dma_avalon_char_source_startofpacket,
                                                                video_character_buffer_with_dma_avalon_char_source_valid,

                                                               // outputs:
                                                                video_alpha_blender_avalon_foreground_sink_data,
                                                                video_alpha_blender_avalon_foreground_sink_endofpacket,
                                                                video_alpha_blender_avalon_foreground_sink_ready_from_sa,
                                                                video_alpha_blender_avalon_foreground_sink_reset,
                                                                video_alpha_blender_avalon_foreground_sink_startofpacket,
                                                                video_alpha_blender_avalon_foreground_sink_valid
                                                             )
;

  output  [ 39: 0] video_alpha_blender_avalon_foreground_sink_data;
  output           video_alpha_blender_avalon_foreground_sink_endofpacket;
  output           video_alpha_blender_avalon_foreground_sink_ready_from_sa;
  output           video_alpha_blender_avalon_foreground_sink_reset;
  output           video_alpha_blender_avalon_foreground_sink_startofpacket;
  output           video_alpha_blender_avalon_foreground_sink_valid;
  input            clk;
  input            reset_n;
  input            video_alpha_blender_avalon_foreground_sink_ready;
  input   [ 39: 0] video_character_buffer_with_dma_avalon_char_source_data;
  input            video_character_buffer_with_dma_avalon_char_source_endofpacket;
  input            video_character_buffer_with_dma_avalon_char_source_startofpacket;
  input            video_character_buffer_with_dma_avalon_char_source_valid;

  wire    [ 39: 0] video_alpha_blender_avalon_foreground_sink_data;
  wire             video_alpha_blender_avalon_foreground_sink_endofpacket;
  wire             video_alpha_blender_avalon_foreground_sink_ready_from_sa;
  wire             video_alpha_blender_avalon_foreground_sink_reset;
  wire             video_alpha_blender_avalon_foreground_sink_startofpacket;
  wire             video_alpha_blender_avalon_foreground_sink_valid;
  //mux video_alpha_blender_avalon_foreground_sink_data, which is an e_mux
  assign video_alpha_blender_avalon_foreground_sink_data = video_character_buffer_with_dma_avalon_char_source_data;

  //mux video_alpha_blender_avalon_foreground_sink_endofpacket, which is an e_mux
  assign video_alpha_blender_avalon_foreground_sink_endofpacket = video_character_buffer_with_dma_avalon_char_source_endofpacket;

  //assign video_alpha_blender_avalon_foreground_sink_ready_from_sa = video_alpha_blender_avalon_foreground_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_alpha_blender_avalon_foreground_sink_ready_from_sa = video_alpha_blender_avalon_foreground_sink_ready;

  //mux video_alpha_blender_avalon_foreground_sink_startofpacket, which is an e_mux
  assign video_alpha_blender_avalon_foreground_sink_startofpacket = video_character_buffer_with_dma_avalon_char_source_startofpacket;

  //mux video_alpha_blender_avalon_foreground_sink_valid, which is an e_mux
  assign video_alpha_blender_avalon_foreground_sink_valid = video_character_buffer_with_dma_avalon_char_source_valid;

  //~video_alpha_blender_avalon_foreground_sink_reset assignment, which is an e_assign
  assign video_alpha_blender_avalon_foreground_sink_reset = ~reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_alpha_blender_avalon_blended_source_arbitrator (
                                                              // inputs:
                                                               clk,
                                                               reset_n,
                                                               video_alpha_blender_avalon_blended_source_data,
                                                               video_alpha_blender_avalon_blended_source_endofpacket,
                                                               video_alpha_blender_avalon_blended_source_startofpacket,
                                                               video_alpha_blender_avalon_blended_source_valid,
                                                               video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa,

                                                              // outputs:
                                                               video_alpha_blender_avalon_blended_source_ready
                                                            )
;

  output           video_alpha_blender_avalon_blended_source_ready;
  input            clk;
  input            reset_n;
  input   [ 29: 0] video_alpha_blender_avalon_blended_source_data;
  input            video_alpha_blender_avalon_blended_source_endofpacket;
  input            video_alpha_blender_avalon_blended_source_startofpacket;
  input            video_alpha_blender_avalon_blended_source_valid;
  input            video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa;

  wire             video_alpha_blender_avalon_blended_source_ready;
  //mux video_alpha_blender_avalon_blended_source_ready, which is an e_mux
  assign video_alpha_blender_avalon_blended_source_ready = video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_character_buffer_with_dma_avalon_char_buffer_slave_arbitrator (
                                                                             // inputs:
                                                                              clk,
                                                                              cpu_data_master_address_to_slave,
                                                                              cpu_data_master_byteenable,
                                                                              cpu_data_master_dbs_address,
                                                                              cpu_data_master_dbs_write_8,
                                                                              cpu_data_master_latency_counter,
                                                                              cpu_data_master_read,
                                                                              cpu_data_master_write,
                                                                              reset_n,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_readdata,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest,

                                                                             // outputs:
                                                                              cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                                                              cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                                                              cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                                                              cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                                                              cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave,
                                                                              d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_address,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_read,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_write,
                                                                              video_character_buffer_with_dma_avalon_char_buffer_slave_writedata
                                                                           )
;

  output           cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave;
  output           cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave;
  output           cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave;
  output           cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave;
  output           cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave;
  output           d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer;
  output  [ 12: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_address;
  output           video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable;
  output           video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect;
  output           video_character_buffer_with_dma_avalon_char_buffer_slave_read;
  output  [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa;
  output           video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa;
  output           video_character_buffer_with_dma_avalon_char_buffer_slave_write;
  output  [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [  7: 0] cpu_data_master_dbs_write_8;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_readdata;
  input            video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_0;
  wire             cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_1;
  wire             cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_2;
  wire             cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_3;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave;
  reg              cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register;
  wire             cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register_in;
  wire             cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_saved_grant_video_character_buffer_with_dma_avalon_char_buffer_slave;
  reg              d1_reasons_to_wait;
  reg              d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register;
  wire    [ 12: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_address;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_allgrants;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_allow_new_arb_cycle;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_any_bursting_master_saved_grant;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_any_continuerequest;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_arb_counter_enable;
  reg     [  2: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter;
  wire    [  2: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter_next_value;
  wire    [  2: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_set_values;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_beginbursttransfer_internal;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_begins_xfer;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_firsttransfer;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_grant_vector;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_read_cycle;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_write_cycle;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_master_qreq_vector;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_non_bursting_master_requests;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_read;
  wire    [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa;
  reg              video_character_buffer_with_dma_avalon_char_buffer_slave_reg_firsttransfer;
  reg              video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable2;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_unreg_firsttransfer;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_read;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_write;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_write;
  wire    [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_writedata;
  wire             wait_for_video_character_buffer_with_dma_avalon_char_buffer_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer;
    end


  assign video_character_buffer_with_dma_avalon_char_buffer_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave));
  //assign video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa = video_character_buffer_with_dma_avalon_char_buffer_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa = video_character_buffer_with_dma_avalon_char_buffer_slave_readdata;

  assign cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave = ({cpu_data_master_address_to_slave[24 : 13] , 13'b0} == 25'h1802000) & (cpu_data_master_read | cpu_data_master_write);
  //assign video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa = video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa = video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter set values, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_set_values = (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave)? 4 :
    1;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_non_bursting_master_requests mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_non_bursting_master_requests = cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_any_bursting_master_saved_grant = 0;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter_next_value = video_character_buffer_with_dma_avalon_char_buffer_slave_firsttransfer ? (video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_set_values - 1) : |video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter ? (video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter - 1) : 0;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_allgrants all slave grants, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_allgrants = |video_character_buffer_with_dma_avalon_char_buffer_slave_grant_vector;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer = ~(video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_read | video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_buffer_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_buffer_slave = video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer & (~video_character_buffer_with_dma_avalon_char_buffer_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_buffer_slave & video_character_buffer_with_dma_avalon_char_buffer_slave_allgrants) | (end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_buffer_slave & ~video_character_buffer_with_dma_avalon_char_buffer_slave_non_bursting_master_requests);

  //video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter <= 0;
      else if (video_character_buffer_with_dma_avalon_char_buffer_slave_arb_counter_enable)
          video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter <= video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter_next_value;
    end


  //video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable <= 0;
      else if ((|video_character_buffer_with_dma_avalon_char_buffer_slave_master_qreq_vector & end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_buffer_slave) | (end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_buffer_slave & ~video_character_buffer_with_dma_avalon_char_buffer_slave_non_bursting_master_requests))
          video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable <= |video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter_next_value;
    end


  //cpu/data_master video_character_buffer_with_dma/avalon_char_buffer_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable2 = |video_character_buffer_with_dma_avalon_char_buffer_slave_arb_share_counter_next_value;

  //cpu/data_master video_character_buffer_with_dma/avalon_char_buffer_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave = cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter))) | ((!cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave) & cpu_data_master_write));
  //cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register_in = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_read & ~video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register = {cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register, cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register_in};

  //cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register <= p1_cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave = cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave_shift_register;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_writedata mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_writedata = cpu_data_master_dbs_write_8;

  //master is always granted when requested
  assign cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave = cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave;

  //cpu/data_master saved-grant video_character_buffer_with_dma/avalon_char_buffer_slave, which is an e_assign
  assign cpu_data_master_saved_grant_video_character_buffer_with_dma_avalon_char_buffer_slave = cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave;

  //allow new arb cycle for video_character_buffer_with_dma/avalon_char_buffer_slave, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_master_qreq_vector = 1;

  assign video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave;
  //video_character_buffer_with_dma_avalon_char_buffer_slave_firsttransfer first transaction, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_firsttransfer = video_character_buffer_with_dma_avalon_char_buffer_slave_begins_xfer ? video_character_buffer_with_dma_avalon_char_buffer_slave_unreg_firsttransfer : video_character_buffer_with_dma_avalon_char_buffer_slave_reg_firsttransfer;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_unreg_firsttransfer = ~(video_character_buffer_with_dma_avalon_char_buffer_slave_slavearbiterlockenable & video_character_buffer_with_dma_avalon_char_buffer_slave_any_continuerequest);

  //video_character_buffer_with_dma_avalon_char_buffer_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_character_buffer_with_dma_avalon_char_buffer_slave_reg_firsttransfer <= 1'b1;
      else if (video_character_buffer_with_dma_avalon_char_buffer_slave_begins_xfer)
          video_character_buffer_with_dma_avalon_char_buffer_slave_reg_firsttransfer <= video_character_buffer_with_dma_avalon_char_buffer_slave_unreg_firsttransfer;
    end


  //video_character_buffer_with_dma_avalon_char_buffer_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_beginbursttransfer_internal = video_character_buffer_with_dma_avalon_char_buffer_slave_begins_xfer;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_read assignment, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_read = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_read;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_write assignment, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_write = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_write;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_address mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_address = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1 : 0]};

  //d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer <= 1;
      else 
        d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer <= video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer;
    end


  //video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_read in a cycle, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_read = video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_read_cycle & video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_read_cycle assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_read_cycle = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_read_cycle;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_write in a cycle, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_waits_for_write = video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_write_cycle & video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa;

  //video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_write_cycle assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_write_cycle = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = video_character_buffer_with_dma_avalon_char_buffer_slave_in_a_write_cycle;

  assign wait_for_video_character_buffer_with_dma_avalon_char_buffer_slave_counter = 0;
  //video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable byte enable port mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable = (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave)? cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave :
    -1;

  assign {cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_3,
cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_2,
cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_1,
cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_0 :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_1 :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_2 :
    cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //video_character_buffer_with_dma/avalon_char_buffer_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_character_buffer_with_dma_avalon_char_control_slave_arbitrator (
                                                                              // inputs:
                                                                               clk,
                                                                               cpu_data_master_address_to_slave,
                                                                               cpu_data_master_byteenable,
                                                                               cpu_data_master_latency_counter,
                                                                               cpu_data_master_read,
                                                                               cpu_data_master_write,
                                                                               cpu_data_master_writedata,
                                                                               reset_n,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_readdata,

                                                                              // outputs:
                                                                               cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave,
                                                                               cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave,
                                                                               cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave,
                                                                               cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave,
                                                                               d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_address,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_byteenable,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_chipselect,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_read,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_reset,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_write,
                                                                               video_character_buffer_with_dma_avalon_char_control_slave_writedata
                                                                            )
;

  output           cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave;
  output           cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave;
  output           cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave;
  output           cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave;
  output           d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer;
  output           video_character_buffer_with_dma_avalon_char_control_slave_address;
  output  [  3: 0] video_character_buffer_with_dma_avalon_char_control_slave_byteenable;
  output           video_character_buffer_with_dma_avalon_char_control_slave_chipselect;
  output           video_character_buffer_with_dma_avalon_char_control_slave_read;
  output  [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa;
  output           video_character_buffer_with_dma_avalon_char_control_slave_reset;
  output           video_character_buffer_with_dma_avalon_char_control_slave_write;
  output  [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave;
  reg              cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register;
  wire             cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register_in;
  wire             cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             cpu_data_master_saved_grant_video_character_buffer_with_dma_avalon_char_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register;
  wire    [ 24: 0] shifted_address_to_video_character_buffer_with_dma_avalon_char_control_slave_from_cpu_data_master;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_address;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_allgrants;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_allow_new_arb_cycle;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_any_bursting_master_saved_grant;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_any_continuerequest;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_arb_counter_enable;
  reg     [  2: 0] video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter;
  wire    [  2: 0] video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] video_character_buffer_with_dma_avalon_char_control_slave_arb_share_set_values;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_beginbursttransfer_internal;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_begins_xfer;
  wire    [  3: 0] video_character_buffer_with_dma_avalon_char_control_slave_byteenable;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_chipselect;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_end_xfer;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_firsttransfer;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_grant_vector;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_in_a_read_cycle;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_in_a_write_cycle;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_master_qreq_vector;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_non_bursting_master_requests;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_read;
  wire    [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa;
  reg              video_character_buffer_with_dma_avalon_char_control_slave_reg_firsttransfer;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_reset;
  reg              video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable2;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_unreg_firsttransfer;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_waits_for_read;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_waits_for_write;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_write;
  wire    [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_writedata;
  wire             wait_for_video_character_buffer_with_dma_avalon_char_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~video_character_buffer_with_dma_avalon_char_control_slave_end_xfer;
    end


  assign video_character_buffer_with_dma_avalon_char_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave));
  //assign video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa = video_character_buffer_with_dma_avalon_char_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa = video_character_buffer_with_dma_avalon_char_control_slave_readdata;

  assign cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave = ({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h18050f0) & (cpu_data_master_read | cpu_data_master_write);
  //video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter set values, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_arb_share_set_values = 1;

  //video_character_buffer_with_dma_avalon_char_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_non_bursting_master_requests = cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave;

  //video_character_buffer_with_dma_avalon_char_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_any_bursting_master_saved_grant = 0;

  //video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter_next_value = video_character_buffer_with_dma_avalon_char_control_slave_firsttransfer ? (video_character_buffer_with_dma_avalon_char_control_slave_arb_share_set_values - 1) : |video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter ? (video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter - 1) : 0;

  //video_character_buffer_with_dma_avalon_char_control_slave_allgrants all slave grants, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_allgrants = |video_character_buffer_with_dma_avalon_char_control_slave_grant_vector;

  //video_character_buffer_with_dma_avalon_char_control_slave_end_xfer assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_end_xfer = ~(video_character_buffer_with_dma_avalon_char_control_slave_waits_for_read | video_character_buffer_with_dma_avalon_char_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_control_slave = video_character_buffer_with_dma_avalon_char_control_slave_end_xfer & (~video_character_buffer_with_dma_avalon_char_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_control_slave & video_character_buffer_with_dma_avalon_char_control_slave_allgrants) | (end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_control_slave & ~video_character_buffer_with_dma_avalon_char_control_slave_non_bursting_master_requests);

  //video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter <= 0;
      else if (video_character_buffer_with_dma_avalon_char_control_slave_arb_counter_enable)
          video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter <= video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter_next_value;
    end


  //video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable <= 0;
      else if ((|video_character_buffer_with_dma_avalon_char_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_control_slave) | (end_xfer_arb_share_counter_term_video_character_buffer_with_dma_avalon_char_control_slave & ~video_character_buffer_with_dma_avalon_char_control_slave_non_bursting_master_requests))
          video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable <= |video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master video_character_buffer_with_dma/avalon_char_control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable2 = |video_character_buffer_with_dma_avalon_char_control_slave_arb_share_counter_next_value;

  //cpu/data_master video_character_buffer_with_dma/avalon_char_control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //video_character_buffer_with_dma_avalon_char_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave = cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter))));
  //cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register_in = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave & cpu_data_master_read & ~video_character_buffer_with_dma_avalon_char_control_slave_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register = {cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register, cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register_in};

  //cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register <= p1_cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave = cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave_shift_register;

  //video_character_buffer_with_dma_avalon_char_control_slave_writedata mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave = cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave;

  //cpu/data_master saved-grant video_character_buffer_with_dma/avalon_char_control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_video_character_buffer_with_dma_avalon_char_control_slave = cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave;

  //allow new arb cycle for video_character_buffer_with_dma/avalon_char_control_slave, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign video_character_buffer_with_dma_avalon_char_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign video_character_buffer_with_dma_avalon_char_control_slave_master_qreq_vector = 1;

  //~video_character_buffer_with_dma_avalon_char_control_slave_reset assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_reset = ~reset_n;

  assign video_character_buffer_with_dma_avalon_char_control_slave_chipselect = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave;
  //video_character_buffer_with_dma_avalon_char_control_slave_firsttransfer first transaction, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_firsttransfer = video_character_buffer_with_dma_avalon_char_control_slave_begins_xfer ? video_character_buffer_with_dma_avalon_char_control_slave_unreg_firsttransfer : video_character_buffer_with_dma_avalon_char_control_slave_reg_firsttransfer;

  //video_character_buffer_with_dma_avalon_char_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_unreg_firsttransfer = ~(video_character_buffer_with_dma_avalon_char_control_slave_slavearbiterlockenable & video_character_buffer_with_dma_avalon_char_control_slave_any_continuerequest);

  //video_character_buffer_with_dma_avalon_char_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_character_buffer_with_dma_avalon_char_control_slave_reg_firsttransfer <= 1'b1;
      else if (video_character_buffer_with_dma_avalon_char_control_slave_begins_xfer)
          video_character_buffer_with_dma_avalon_char_control_slave_reg_firsttransfer <= video_character_buffer_with_dma_avalon_char_control_slave_unreg_firsttransfer;
    end


  //video_character_buffer_with_dma_avalon_char_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_beginbursttransfer_internal = video_character_buffer_with_dma_avalon_char_control_slave_begins_xfer;

  //video_character_buffer_with_dma_avalon_char_control_slave_read assignment, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_read = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave & cpu_data_master_read;

  //video_character_buffer_with_dma_avalon_char_control_slave_write assignment, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_write = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave & cpu_data_master_write;

  assign shifted_address_to_video_character_buffer_with_dma_avalon_char_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //video_character_buffer_with_dma_avalon_char_control_slave_address mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_address = shifted_address_to_video_character_buffer_with_dma_avalon_char_control_slave_from_cpu_data_master >> 2;

  //d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer <= 1;
      else 
        d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer <= video_character_buffer_with_dma_avalon_char_control_slave_end_xfer;
    end


  //video_character_buffer_with_dma_avalon_char_control_slave_waits_for_read in a cycle, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_waits_for_read = video_character_buffer_with_dma_avalon_char_control_slave_in_a_read_cycle & 0;

  //video_character_buffer_with_dma_avalon_char_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_in_a_read_cycle = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = video_character_buffer_with_dma_avalon_char_control_slave_in_a_read_cycle;

  //video_character_buffer_with_dma_avalon_char_control_slave_waits_for_write in a cycle, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_waits_for_write = video_character_buffer_with_dma_avalon_char_control_slave_in_a_write_cycle & 0;

  //video_character_buffer_with_dma_avalon_char_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign video_character_buffer_with_dma_avalon_char_control_slave_in_a_write_cycle = cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = video_character_buffer_with_dma_avalon_char_control_slave_in_a_write_cycle;

  assign wait_for_video_character_buffer_with_dma_avalon_char_control_slave_counter = 0;
  //video_character_buffer_with_dma_avalon_char_control_slave_byteenable byte enable port mux, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_control_slave_byteenable = (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //video_character_buffer_with_dma/avalon_char_control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_character_buffer_with_dma_avalon_char_source_arbitrator (
                                                                       // inputs:
                                                                        clk,
                                                                        reset_n,
                                                                        video_alpha_blender_avalon_foreground_sink_ready_from_sa,
                                                                        video_character_buffer_with_dma_avalon_char_source_data,
                                                                        video_character_buffer_with_dma_avalon_char_source_endofpacket,
                                                                        video_character_buffer_with_dma_avalon_char_source_startofpacket,
                                                                        video_character_buffer_with_dma_avalon_char_source_valid,

                                                                       // outputs:
                                                                        video_character_buffer_with_dma_avalon_char_source_ready
                                                                     )
;

  output           video_character_buffer_with_dma_avalon_char_source_ready;
  input            clk;
  input            reset_n;
  input            video_alpha_blender_avalon_foreground_sink_ready_from_sa;
  input   [ 39: 0] video_character_buffer_with_dma_avalon_char_source_data;
  input            video_character_buffer_with_dma_avalon_char_source_endofpacket;
  input            video_character_buffer_with_dma_avalon_char_source_startofpacket;
  input            video_character_buffer_with_dma_avalon_char_source_valid;

  wire             video_character_buffer_with_dma_avalon_char_source_ready;
  //mux video_character_buffer_with_dma_avalon_char_source_ready, which is an e_mux
  assign video_character_buffer_with_dma_avalon_char_source_ready = video_alpha_blender_avalon_foreground_sink_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_dual_clock_buffer_avalon_dc_buffer_sink_arbitrator (
                                                                  // inputs:
                                                                   clk,
                                                                   reset_n,
                                                                   video_alpha_blender_avalon_blended_source_data,
                                                                   video_alpha_blender_avalon_blended_source_endofpacket,
                                                                   video_alpha_blender_avalon_blended_source_startofpacket,
                                                                   video_alpha_blender_avalon_blended_source_valid,
                                                                   video_dual_clock_buffer_avalon_dc_buffer_sink_ready,

                                                                  // outputs:
                                                                   video_dual_clock_buffer_avalon_dc_buffer_sink_data,
                                                                   video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket,
                                                                   video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa,
                                                                   video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket,
                                                                   video_dual_clock_buffer_avalon_dc_buffer_sink_valid
                                                                )
;

  output  [ 29: 0] video_dual_clock_buffer_avalon_dc_buffer_sink_data;
  output           video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket;
  output           video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa;
  output           video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket;
  output           video_dual_clock_buffer_avalon_dc_buffer_sink_valid;
  input            clk;
  input            reset_n;
  input   [ 29: 0] video_alpha_blender_avalon_blended_source_data;
  input            video_alpha_blender_avalon_blended_source_endofpacket;
  input            video_alpha_blender_avalon_blended_source_startofpacket;
  input            video_alpha_blender_avalon_blended_source_valid;
  input            video_dual_clock_buffer_avalon_dc_buffer_sink_ready;

  wire    [ 29: 0] video_dual_clock_buffer_avalon_dc_buffer_sink_data;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_valid;
  //mux video_dual_clock_buffer_avalon_dc_buffer_sink_data, which is an e_mux
  assign video_dual_clock_buffer_avalon_dc_buffer_sink_data = video_alpha_blender_avalon_blended_source_data;

  //mux video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket, which is an e_mux
  assign video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket = video_alpha_blender_avalon_blended_source_endofpacket;

  //assign video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa = video_dual_clock_buffer_avalon_dc_buffer_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa = video_dual_clock_buffer_avalon_dc_buffer_sink_ready;

  //mux video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket, which is an e_mux
  assign video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket = video_alpha_blender_avalon_blended_source_startofpacket;

  //mux video_dual_clock_buffer_avalon_dc_buffer_sink_valid, which is an e_mux
  assign video_dual_clock_buffer_avalon_dc_buffer_sink_valid = video_alpha_blender_avalon_blended_source_valid;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_dual_clock_buffer_avalon_dc_buffer_source_arbitrator (
                                                                    // inputs:
                                                                     clk,
                                                                     reset_n,
                                                                     video_dual_clock_buffer_avalon_dc_buffer_source_data,
                                                                     video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket,
                                                                     video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket,
                                                                     video_dual_clock_buffer_avalon_dc_buffer_source_valid,
                                                                     video_vga_controller_avalon_vga_sink_ready_from_sa,

                                                                    // outputs:
                                                                     video_dual_clock_buffer_avalon_dc_buffer_source_ready
                                                                  )
;

  output           video_dual_clock_buffer_avalon_dc_buffer_source_ready;
  input            clk;
  input            reset_n;
  input   [ 29: 0] video_dual_clock_buffer_avalon_dc_buffer_source_data;
  input            video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket;
  input            video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket;
  input            video_dual_clock_buffer_avalon_dc_buffer_source_valid;
  input            video_vga_controller_avalon_vga_sink_ready_from_sa;

  wire             video_dual_clock_buffer_avalon_dc_buffer_source_ready;
  //mux video_dual_clock_buffer_avalon_dc_buffer_source_ready, which is an e_mux
  assign video_dual_clock_buffer_avalon_dc_buffer_source_ready = video_vga_controller_avalon_vga_sink_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_pixel_buffer_dma_avalon_control_slave_arbitrator (
                                                                // inputs:
                                                                 clk,
                                                                 cpu_data_master_address_to_slave,
                                                                 cpu_data_master_byteenable,
                                                                 cpu_data_master_latency_counter,
                                                                 cpu_data_master_read,
                                                                 cpu_data_master_write,
                                                                 cpu_data_master_writedata,
                                                                 reset_n,
                                                                 video_pixel_buffer_dma_avalon_control_slave_readdata,

                                                                // outputs:
                                                                 cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave,
                                                                 cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave,
                                                                 cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave,
                                                                 cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave,
                                                                 d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer,
                                                                 video_pixel_buffer_dma_avalon_control_slave_address,
                                                                 video_pixel_buffer_dma_avalon_control_slave_byteenable,
                                                                 video_pixel_buffer_dma_avalon_control_slave_read,
                                                                 video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa,
                                                                 video_pixel_buffer_dma_avalon_control_slave_write,
                                                                 video_pixel_buffer_dma_avalon_control_slave_writedata
                                                              )
;

  output           cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave;
  output           cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave;
  output           cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave;
  output           cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave;
  output           d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer;
  output  [  1: 0] video_pixel_buffer_dma_avalon_control_slave_address;
  output  [  3: 0] video_pixel_buffer_dma_avalon_control_slave_byteenable;
  output           video_pixel_buffer_dma_avalon_control_slave_read;
  output  [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa;
  output           video_pixel_buffer_dma_avalon_control_slave_write;
  output  [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave;
  wire             cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave;
  wire             cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave;
  reg              cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register;
  wire             cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register_in;
  wire             cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave;
  wire             cpu_data_master_saved_grant_video_pixel_buffer_dma_avalon_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_video_pixel_buffer_dma_avalon_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register;
  wire    [ 24: 0] shifted_address_to_video_pixel_buffer_dma_avalon_control_slave_from_cpu_data_master;
  wire    [  1: 0] video_pixel_buffer_dma_avalon_control_slave_address;
  wire             video_pixel_buffer_dma_avalon_control_slave_allgrants;
  wire             video_pixel_buffer_dma_avalon_control_slave_allow_new_arb_cycle;
  wire             video_pixel_buffer_dma_avalon_control_slave_any_bursting_master_saved_grant;
  wire             video_pixel_buffer_dma_avalon_control_slave_any_continuerequest;
  wire             video_pixel_buffer_dma_avalon_control_slave_arb_counter_enable;
  reg     [  2: 0] video_pixel_buffer_dma_avalon_control_slave_arb_share_counter;
  wire    [  2: 0] video_pixel_buffer_dma_avalon_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] video_pixel_buffer_dma_avalon_control_slave_arb_share_set_values;
  wire             video_pixel_buffer_dma_avalon_control_slave_beginbursttransfer_internal;
  wire             video_pixel_buffer_dma_avalon_control_slave_begins_xfer;
  wire    [  3: 0] video_pixel_buffer_dma_avalon_control_slave_byteenable;
  wire             video_pixel_buffer_dma_avalon_control_slave_end_xfer;
  wire             video_pixel_buffer_dma_avalon_control_slave_firsttransfer;
  wire             video_pixel_buffer_dma_avalon_control_slave_grant_vector;
  wire             video_pixel_buffer_dma_avalon_control_slave_in_a_read_cycle;
  wire             video_pixel_buffer_dma_avalon_control_slave_in_a_write_cycle;
  wire             video_pixel_buffer_dma_avalon_control_slave_master_qreq_vector;
  wire             video_pixel_buffer_dma_avalon_control_slave_non_bursting_master_requests;
  wire             video_pixel_buffer_dma_avalon_control_slave_read;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa;
  reg              video_pixel_buffer_dma_avalon_control_slave_reg_firsttransfer;
  reg              video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable;
  wire             video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable2;
  wire             video_pixel_buffer_dma_avalon_control_slave_unreg_firsttransfer;
  wire             video_pixel_buffer_dma_avalon_control_slave_waits_for_read;
  wire             video_pixel_buffer_dma_avalon_control_slave_waits_for_write;
  wire             video_pixel_buffer_dma_avalon_control_slave_write;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_writedata;
  wire             wait_for_video_pixel_buffer_dma_avalon_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~video_pixel_buffer_dma_avalon_control_slave_end_xfer;
    end


  assign video_pixel_buffer_dma_avalon_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave));
  //assign video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa = video_pixel_buffer_dma_avalon_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa = video_pixel_buffer_dma_avalon_control_slave_readdata;

  assign cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h18050c0) & (cpu_data_master_read | cpu_data_master_write);
  //video_pixel_buffer_dma_avalon_control_slave_arb_share_counter set values, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_arb_share_set_values = 1;

  //video_pixel_buffer_dma_avalon_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_non_bursting_master_requests = cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave;

  //video_pixel_buffer_dma_avalon_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_any_bursting_master_saved_grant = 0;

  //video_pixel_buffer_dma_avalon_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_arb_share_counter_next_value = video_pixel_buffer_dma_avalon_control_slave_firsttransfer ? (video_pixel_buffer_dma_avalon_control_slave_arb_share_set_values - 1) : |video_pixel_buffer_dma_avalon_control_slave_arb_share_counter ? (video_pixel_buffer_dma_avalon_control_slave_arb_share_counter - 1) : 0;

  //video_pixel_buffer_dma_avalon_control_slave_allgrants all slave grants, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_allgrants = |video_pixel_buffer_dma_avalon_control_slave_grant_vector;

  //video_pixel_buffer_dma_avalon_control_slave_end_xfer assignment, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_end_xfer = ~(video_pixel_buffer_dma_avalon_control_slave_waits_for_read | video_pixel_buffer_dma_avalon_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_video_pixel_buffer_dma_avalon_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_video_pixel_buffer_dma_avalon_control_slave = video_pixel_buffer_dma_avalon_control_slave_end_xfer & (~video_pixel_buffer_dma_avalon_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //video_pixel_buffer_dma_avalon_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_video_pixel_buffer_dma_avalon_control_slave & video_pixel_buffer_dma_avalon_control_slave_allgrants) | (end_xfer_arb_share_counter_term_video_pixel_buffer_dma_avalon_control_slave & ~video_pixel_buffer_dma_avalon_control_slave_non_bursting_master_requests);

  //video_pixel_buffer_dma_avalon_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_avalon_control_slave_arb_share_counter <= 0;
      else if (video_pixel_buffer_dma_avalon_control_slave_arb_counter_enable)
          video_pixel_buffer_dma_avalon_control_slave_arb_share_counter <= video_pixel_buffer_dma_avalon_control_slave_arb_share_counter_next_value;
    end


  //video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable <= 0;
      else if ((|video_pixel_buffer_dma_avalon_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_video_pixel_buffer_dma_avalon_control_slave) | (end_xfer_arb_share_counter_term_video_pixel_buffer_dma_avalon_control_slave & ~video_pixel_buffer_dma_avalon_control_slave_non_bursting_master_requests))
          video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable <= |video_pixel_buffer_dma_avalon_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master video_pixel_buffer_dma/avalon_control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable2 = |video_pixel_buffer_dma_avalon_control_slave_arb_share_counter_next_value;

  //cpu/data_master video_pixel_buffer_dma/avalon_control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //video_pixel_buffer_dma_avalon_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave = cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter))));
  //cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register_in = cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave & cpu_data_master_read & ~video_pixel_buffer_dma_avalon_control_slave_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register = {cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register, cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register_in};

  //cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register <= p1_cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave = cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave_shift_register;

  //video_pixel_buffer_dma_avalon_control_slave_writedata mux, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave = cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave;

  //cpu/data_master saved-grant video_pixel_buffer_dma/avalon_control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_video_pixel_buffer_dma_avalon_control_slave = cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave;

  //allow new arb cycle for video_pixel_buffer_dma/avalon_control_slave, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign video_pixel_buffer_dma_avalon_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign video_pixel_buffer_dma_avalon_control_slave_master_qreq_vector = 1;

  //video_pixel_buffer_dma_avalon_control_slave_firsttransfer first transaction, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_firsttransfer = video_pixel_buffer_dma_avalon_control_slave_begins_xfer ? video_pixel_buffer_dma_avalon_control_slave_unreg_firsttransfer : video_pixel_buffer_dma_avalon_control_slave_reg_firsttransfer;

  //video_pixel_buffer_dma_avalon_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_unreg_firsttransfer = ~(video_pixel_buffer_dma_avalon_control_slave_slavearbiterlockenable & video_pixel_buffer_dma_avalon_control_slave_any_continuerequest);

  //video_pixel_buffer_dma_avalon_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_avalon_control_slave_reg_firsttransfer <= 1'b1;
      else if (video_pixel_buffer_dma_avalon_control_slave_begins_xfer)
          video_pixel_buffer_dma_avalon_control_slave_reg_firsttransfer <= video_pixel_buffer_dma_avalon_control_slave_unreg_firsttransfer;
    end


  //video_pixel_buffer_dma_avalon_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_beginbursttransfer_internal = video_pixel_buffer_dma_avalon_control_slave_begins_xfer;

  //video_pixel_buffer_dma_avalon_control_slave_read assignment, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_read = cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave & cpu_data_master_read;

  //video_pixel_buffer_dma_avalon_control_slave_write assignment, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_write = cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave & cpu_data_master_write;

  assign shifted_address_to_video_pixel_buffer_dma_avalon_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //video_pixel_buffer_dma_avalon_control_slave_address mux, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_address = shifted_address_to_video_pixel_buffer_dma_avalon_control_slave_from_cpu_data_master >> 2;

  //d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer <= 1;
      else 
        d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer <= video_pixel_buffer_dma_avalon_control_slave_end_xfer;
    end


  //video_pixel_buffer_dma_avalon_control_slave_waits_for_read in a cycle, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_waits_for_read = video_pixel_buffer_dma_avalon_control_slave_in_a_read_cycle & 0;

  //video_pixel_buffer_dma_avalon_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_in_a_read_cycle = cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = video_pixel_buffer_dma_avalon_control_slave_in_a_read_cycle;

  //video_pixel_buffer_dma_avalon_control_slave_waits_for_write in a cycle, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_waits_for_write = video_pixel_buffer_dma_avalon_control_slave_in_a_write_cycle & 0;

  //video_pixel_buffer_dma_avalon_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign video_pixel_buffer_dma_avalon_control_slave_in_a_write_cycle = cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = video_pixel_buffer_dma_avalon_control_slave_in_a_write_cycle;

  assign wait_for_video_pixel_buffer_dma_avalon_control_slave_counter = 0;
  //video_pixel_buffer_dma_avalon_control_slave_byteenable byte enable port mux, which is an e_mux
  assign video_pixel_buffer_dma_avalon_control_slave_byteenable = (cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //video_pixel_buffer_dma/avalon_control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_pixel_buffer_dma_avalon_pixel_dma_master_arbitrator (
                                                                   // inputs:
                                                                    clk,
                                                                    d1_onchip_memory_s2_end_xfer,
                                                                    onchip_memory_s2_readdata_from_sa,
                                                                    reset_n,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_address,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_read,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2,

                                                                   // outputs:
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_readdata,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_reset,
                                                                    video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest
                                                                 )
;

  output  [ 31: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter;
  output  [  7: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_readdata;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_reset;
  output           video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest;
  input            clk;
  input            d1_onchip_memory_s2_end_xfer;
  input   [ 31: 0] onchip_memory_s2_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_address;
  input            video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2;
  input            video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2;
  input            video_pixel_buffer_dma_avalon_pixel_dma_master_read;
  input            video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2;
  input            video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2;

  reg              active_and_waiting_last_time;
  wire    [  7: 0] onchip_memory_s2_readdata_from_sa_part_selected_by_negative_dbs;
  wire             pre_flush_video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid;
  wire             r_1;
  reg     [  1: 0] selecto_2_1;
  reg     [ 31: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_address_last_time;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter;
  reg              video_pixel_buffer_dma_avalon_pixel_dma_master_read_last_time;
  wire    [  7: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_readdata;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_reset;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_run;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2 | ~(video_pixel_buffer_dma_avalon_pixel_dma_master_read) | (1 & (video_pixel_buffer_dma_avalon_pixel_dma_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave = {19'b110000000000,
    video_pixel_buffer_dma_avalon_pixel_dma_master_address[12 : 0]};

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid = video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid = 0 |
    pre_flush_video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid;

  //Negative Dynamic Bus-sizing mux.
  //this mux selects the correct fourth of the 
  //wide data coming from the slave onchip_memory/s2 
  assign onchip_memory_s2_readdata_from_sa_part_selected_by_negative_dbs = ((selecto_2_1 == 0))? onchip_memory_s2_readdata_from_sa[7 : 0] :
    ((selecto_2_1 == 1))? onchip_memory_s2_readdata_from_sa[15 : 8] :
    ((selecto_2_1 == 2))? onchip_memory_s2_readdata_from_sa[23 : 16] :
    onchip_memory_s2_readdata_from_sa[31 : 24];

  //Negative Dynamic Bus-sizing mux.
  //this mux selects the correct fourth of the 
  //wide data coming from the slave onchip_memory/s2 
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          selecto_2_1 <= 0;
      else 
        selecto_2_1 <= video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave[1 : 0];
    end


  //video_pixel_buffer_dma/avalon_pixel_dma_master readdata mux, which is an e_mux
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_readdata = onchip_memory_s2_readdata_from_sa_part_selected_by_negative_dbs;

  //actual waitrequest port, which is an e_assign
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest = ~video_pixel_buffer_dma_avalon_pixel_dma_master_run;

  //latent max counter, which is an e_assign
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter = 0;

  //~video_pixel_buffer_dma_avalon_pixel_dma_master_reset assignment, which is an e_assign
  assign video_pixel_buffer_dma_avalon_pixel_dma_master_reset = ~reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //video_pixel_buffer_dma_avalon_pixel_dma_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_avalon_pixel_dma_master_address_last_time <= 0;
      else 
        video_pixel_buffer_dma_avalon_pixel_dma_master_address_last_time <= video_pixel_buffer_dma_avalon_pixel_dma_master_address;
    end


  //video_pixel_buffer_dma/avalon_pixel_dma_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest & (video_pixel_buffer_dma_avalon_pixel_dma_master_read);
    end


  //video_pixel_buffer_dma_avalon_pixel_dma_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (video_pixel_buffer_dma_avalon_pixel_dma_master_address != video_pixel_buffer_dma_avalon_pixel_dma_master_address_last_time))
        begin
          $write("%0d ns: video_pixel_buffer_dma_avalon_pixel_dma_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //video_pixel_buffer_dma_avalon_pixel_dma_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_avalon_pixel_dma_master_read_last_time <= 0;
      else 
        video_pixel_buffer_dma_avalon_pixel_dma_master_read_last_time <= video_pixel_buffer_dma_avalon_pixel_dma_master_read;
    end


  //video_pixel_buffer_dma_avalon_pixel_dma_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (video_pixel_buffer_dma_avalon_pixel_dma_master_read != video_pixel_buffer_dma_avalon_pixel_dma_master_read_last_time))
        begin
          $write("%0d ns: video_pixel_buffer_dma_avalon_pixel_dma_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_pixel_buffer_dma_avalon_pixel_source_arbitrator (
                                                               // inputs:
                                                                clk,
                                                                reset_n,
                                                                video_pixel_buffer_dma_avalon_pixel_source_data,
                                                                video_pixel_buffer_dma_avalon_pixel_source_endofpacket,
                                                                video_pixel_buffer_dma_avalon_pixel_source_startofpacket,
                                                                video_pixel_buffer_dma_avalon_pixel_source_valid,
                                                                video_rgb_resampler_avalon_rgb_sink_ready_from_sa,

                                                               // outputs:
                                                                video_pixel_buffer_dma_avalon_pixel_source_ready
                                                             )
;

  output           video_pixel_buffer_dma_avalon_pixel_source_ready;
  input            clk;
  input            reset_n;
  input   [  7: 0] video_pixel_buffer_dma_avalon_pixel_source_data;
  input            video_pixel_buffer_dma_avalon_pixel_source_endofpacket;
  input            video_pixel_buffer_dma_avalon_pixel_source_startofpacket;
  input            video_pixel_buffer_dma_avalon_pixel_source_valid;
  input            video_rgb_resampler_avalon_rgb_sink_ready_from_sa;

  wire             video_pixel_buffer_dma_avalon_pixel_source_ready;
  //mux video_pixel_buffer_dma_avalon_pixel_source_ready, which is an e_mux
  assign video_pixel_buffer_dma_avalon_pixel_source_ready = video_rgb_resampler_avalon_rgb_sink_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_rgb_resampler_avalon_rgb_sink_arbitrator (
                                                        // inputs:
                                                         clk,
                                                         reset_n,
                                                         video_pixel_buffer_dma_avalon_pixel_source_data,
                                                         video_pixel_buffer_dma_avalon_pixel_source_endofpacket,
                                                         video_pixel_buffer_dma_avalon_pixel_source_startofpacket,
                                                         video_pixel_buffer_dma_avalon_pixel_source_valid,
                                                         video_rgb_resampler_avalon_rgb_sink_ready,

                                                        // outputs:
                                                         video_rgb_resampler_avalon_rgb_sink_data,
                                                         video_rgb_resampler_avalon_rgb_sink_endofpacket,
                                                         video_rgb_resampler_avalon_rgb_sink_ready_from_sa,
                                                         video_rgb_resampler_avalon_rgb_sink_reset,
                                                         video_rgb_resampler_avalon_rgb_sink_startofpacket,
                                                         video_rgb_resampler_avalon_rgb_sink_valid
                                                      )
;

  output  [  7: 0] video_rgb_resampler_avalon_rgb_sink_data;
  output           video_rgb_resampler_avalon_rgb_sink_endofpacket;
  output           video_rgb_resampler_avalon_rgb_sink_ready_from_sa;
  output           video_rgb_resampler_avalon_rgb_sink_reset;
  output           video_rgb_resampler_avalon_rgb_sink_startofpacket;
  output           video_rgb_resampler_avalon_rgb_sink_valid;
  input            clk;
  input            reset_n;
  input   [  7: 0] video_pixel_buffer_dma_avalon_pixel_source_data;
  input            video_pixel_buffer_dma_avalon_pixel_source_endofpacket;
  input            video_pixel_buffer_dma_avalon_pixel_source_startofpacket;
  input            video_pixel_buffer_dma_avalon_pixel_source_valid;
  input            video_rgb_resampler_avalon_rgb_sink_ready;

  wire    [  7: 0] video_rgb_resampler_avalon_rgb_sink_data;
  wire             video_rgb_resampler_avalon_rgb_sink_endofpacket;
  wire             video_rgb_resampler_avalon_rgb_sink_ready_from_sa;
  wire             video_rgb_resampler_avalon_rgb_sink_reset;
  wire             video_rgb_resampler_avalon_rgb_sink_startofpacket;
  wire             video_rgb_resampler_avalon_rgb_sink_valid;
  //mux video_rgb_resampler_avalon_rgb_sink_data, which is an e_mux
  assign video_rgb_resampler_avalon_rgb_sink_data = video_pixel_buffer_dma_avalon_pixel_source_data;

  //mux video_rgb_resampler_avalon_rgb_sink_endofpacket, which is an e_mux
  assign video_rgb_resampler_avalon_rgb_sink_endofpacket = video_pixel_buffer_dma_avalon_pixel_source_endofpacket;

  //assign video_rgb_resampler_avalon_rgb_sink_ready_from_sa = video_rgb_resampler_avalon_rgb_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_rgb_resampler_avalon_rgb_sink_ready_from_sa = video_rgb_resampler_avalon_rgb_sink_ready;

  //mux video_rgb_resampler_avalon_rgb_sink_startofpacket, which is an e_mux
  assign video_rgb_resampler_avalon_rgb_sink_startofpacket = video_pixel_buffer_dma_avalon_pixel_source_startofpacket;

  //mux video_rgb_resampler_avalon_rgb_sink_valid, which is an e_mux
  assign video_rgb_resampler_avalon_rgb_sink_valid = video_pixel_buffer_dma_avalon_pixel_source_valid;

  //~video_rgb_resampler_avalon_rgb_sink_reset assignment, which is an e_assign
  assign video_rgb_resampler_avalon_rgb_sink_reset = ~reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_rgb_resampler_avalon_rgb_source_arbitrator (
                                                          // inputs:
                                                           clk,
                                                           reset_n,
                                                           video_rgb_resampler_avalon_rgb_source_data,
                                                           video_rgb_resampler_avalon_rgb_source_endofpacket,
                                                           video_rgb_resampler_avalon_rgb_source_startofpacket,
                                                           video_rgb_resampler_avalon_rgb_source_valid,
                                                           video_scaler_avalon_scaler_sink_ready_from_sa,

                                                          // outputs:
                                                           video_rgb_resampler_avalon_rgb_source_ready
                                                        )
;

  output           video_rgb_resampler_avalon_rgb_source_ready;
  input            clk;
  input            reset_n;
  input   [ 29: 0] video_rgb_resampler_avalon_rgb_source_data;
  input            video_rgb_resampler_avalon_rgb_source_endofpacket;
  input            video_rgb_resampler_avalon_rgb_source_startofpacket;
  input            video_rgb_resampler_avalon_rgb_source_valid;
  input            video_scaler_avalon_scaler_sink_ready_from_sa;

  wire             video_rgb_resampler_avalon_rgb_source_ready;
  //mux video_rgb_resampler_avalon_rgb_source_ready, which is an e_mux
  assign video_rgb_resampler_avalon_rgb_source_ready = video_scaler_avalon_scaler_sink_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_scaler_avalon_scaler_sink_arbitrator (
                                                    // inputs:
                                                     clk,
                                                     reset_n,
                                                     video_rgb_resampler_avalon_rgb_source_data,
                                                     video_rgb_resampler_avalon_rgb_source_endofpacket,
                                                     video_rgb_resampler_avalon_rgb_source_startofpacket,
                                                     video_rgb_resampler_avalon_rgb_source_valid,
                                                     video_scaler_avalon_scaler_sink_ready,

                                                    // outputs:
                                                     video_scaler_avalon_scaler_sink_data,
                                                     video_scaler_avalon_scaler_sink_endofpacket,
                                                     video_scaler_avalon_scaler_sink_ready_from_sa,
                                                     video_scaler_avalon_scaler_sink_reset,
                                                     video_scaler_avalon_scaler_sink_startofpacket,
                                                     video_scaler_avalon_scaler_sink_valid
                                                  )
;

  output  [ 29: 0] video_scaler_avalon_scaler_sink_data;
  output           video_scaler_avalon_scaler_sink_endofpacket;
  output           video_scaler_avalon_scaler_sink_ready_from_sa;
  output           video_scaler_avalon_scaler_sink_reset;
  output           video_scaler_avalon_scaler_sink_startofpacket;
  output           video_scaler_avalon_scaler_sink_valid;
  input            clk;
  input            reset_n;
  input   [ 29: 0] video_rgb_resampler_avalon_rgb_source_data;
  input            video_rgb_resampler_avalon_rgb_source_endofpacket;
  input            video_rgb_resampler_avalon_rgb_source_startofpacket;
  input            video_rgb_resampler_avalon_rgb_source_valid;
  input            video_scaler_avalon_scaler_sink_ready;

  wire    [ 29: 0] video_scaler_avalon_scaler_sink_data;
  wire             video_scaler_avalon_scaler_sink_endofpacket;
  wire             video_scaler_avalon_scaler_sink_ready_from_sa;
  wire             video_scaler_avalon_scaler_sink_reset;
  wire             video_scaler_avalon_scaler_sink_startofpacket;
  wire             video_scaler_avalon_scaler_sink_valid;
  //mux video_scaler_avalon_scaler_sink_data, which is an e_mux
  assign video_scaler_avalon_scaler_sink_data = video_rgb_resampler_avalon_rgb_source_data;

  //mux video_scaler_avalon_scaler_sink_endofpacket, which is an e_mux
  assign video_scaler_avalon_scaler_sink_endofpacket = video_rgb_resampler_avalon_rgb_source_endofpacket;

  //assign video_scaler_avalon_scaler_sink_ready_from_sa = video_scaler_avalon_scaler_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_scaler_avalon_scaler_sink_ready_from_sa = video_scaler_avalon_scaler_sink_ready;

  //mux video_scaler_avalon_scaler_sink_startofpacket, which is an e_mux
  assign video_scaler_avalon_scaler_sink_startofpacket = video_rgb_resampler_avalon_rgb_source_startofpacket;

  //mux video_scaler_avalon_scaler_sink_valid, which is an e_mux
  assign video_scaler_avalon_scaler_sink_valid = video_rgb_resampler_avalon_rgb_source_valid;

  //~video_scaler_avalon_scaler_sink_reset assignment, which is an e_assign
  assign video_scaler_avalon_scaler_sink_reset = ~reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_scaler_avalon_scaler_source_arbitrator (
                                                      // inputs:
                                                       clk,
                                                       reset_n,
                                                       video_alpha_blender_avalon_background_sink_ready_from_sa,
                                                       video_scaler_avalon_scaler_source_data,
                                                       video_scaler_avalon_scaler_source_endofpacket,
                                                       video_scaler_avalon_scaler_source_startofpacket,
                                                       video_scaler_avalon_scaler_source_valid,

                                                      // outputs:
                                                       video_scaler_avalon_scaler_source_ready
                                                    )
;

  output           video_scaler_avalon_scaler_source_ready;
  input            clk;
  input            reset_n;
  input            video_alpha_blender_avalon_background_sink_ready_from_sa;
  input   [ 29: 0] video_scaler_avalon_scaler_source_data;
  input            video_scaler_avalon_scaler_source_endofpacket;
  input            video_scaler_avalon_scaler_source_startofpacket;
  input            video_scaler_avalon_scaler_source_valid;

  wire             video_scaler_avalon_scaler_source_ready;
  //mux video_scaler_avalon_scaler_source_ready, which is an e_mux
  assign video_scaler_avalon_scaler_source_ready = video_alpha_blender_avalon_background_sink_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_vga_controller_avalon_vga_sink_arbitrator (
                                                         // inputs:
                                                          clk,
                                                          reset_n,
                                                          video_dual_clock_buffer_avalon_dc_buffer_source_data,
                                                          video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket,
                                                          video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket,
                                                          video_dual_clock_buffer_avalon_dc_buffer_source_valid,
                                                          video_vga_controller_avalon_vga_sink_ready,

                                                         // outputs:
                                                          video_vga_controller_avalon_vga_sink_data,
                                                          video_vga_controller_avalon_vga_sink_endofpacket,
                                                          video_vga_controller_avalon_vga_sink_ready_from_sa,
                                                          video_vga_controller_avalon_vga_sink_reset,
                                                          video_vga_controller_avalon_vga_sink_startofpacket,
                                                          video_vga_controller_avalon_vga_sink_valid
                                                       )
;

  output  [ 29: 0] video_vga_controller_avalon_vga_sink_data;
  output           video_vga_controller_avalon_vga_sink_endofpacket;
  output           video_vga_controller_avalon_vga_sink_ready_from_sa;
  output           video_vga_controller_avalon_vga_sink_reset;
  output           video_vga_controller_avalon_vga_sink_startofpacket;
  output           video_vga_controller_avalon_vga_sink_valid;
  input            clk;
  input            reset_n;
  input   [ 29: 0] video_dual_clock_buffer_avalon_dc_buffer_source_data;
  input            video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket;
  input            video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket;
  input            video_dual_clock_buffer_avalon_dc_buffer_source_valid;
  input            video_vga_controller_avalon_vga_sink_ready;

  wire    [ 29: 0] video_vga_controller_avalon_vga_sink_data;
  wire             video_vga_controller_avalon_vga_sink_endofpacket;
  wire             video_vga_controller_avalon_vga_sink_ready_from_sa;
  wire             video_vga_controller_avalon_vga_sink_reset;
  wire             video_vga_controller_avalon_vga_sink_startofpacket;
  wire             video_vga_controller_avalon_vga_sink_valid;
  //mux video_vga_controller_avalon_vga_sink_data, which is an e_mux
  assign video_vga_controller_avalon_vga_sink_data = video_dual_clock_buffer_avalon_dc_buffer_source_data;

  //mux video_vga_controller_avalon_vga_sink_endofpacket, which is an e_mux
  assign video_vga_controller_avalon_vga_sink_endofpacket = video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket;

  //assign video_vga_controller_avalon_vga_sink_ready_from_sa = video_vga_controller_avalon_vga_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_vga_controller_avalon_vga_sink_ready_from_sa = video_vga_controller_avalon_vga_sink_ready;

  //mux video_vga_controller_avalon_vga_sink_startofpacket, which is an e_mux
  assign video_vga_controller_avalon_vga_sink_startofpacket = video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket;

  //mux video_vga_controller_avalon_vga_sink_valid, which is an e_mux
  assign video_vga_controller_avalon_vga_sink_valid = video_dual_clock_buffer_avalon_dc_buffer_source_valid;

  //~video_vga_controller_avalon_vga_sink_reset assignment, which is an e_assign
  assign video_vga_controller_avalon_vga_sink_reset = ~reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc_reset_clk_0_domain_synch_module (
                                                          // inputs:
                                                           clk,
                                                           data_in,
                                                           reset_n,

                                                          // outputs:
                                                           data_out
                                                        )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc_reset_clk_pllc0_domain_synch_module (
                                                              // inputs:
                                                               clk,
                                                               data_in,
                                                               reset_n,

                                                              // outputs:
                                                               data_out
                                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc_reset_clk_pllc1_domain_synch_module (
                                                              // inputs:
                                                               clk,
                                                               data_in,
                                                               reset_n,

                                                              // outputs:
                                                               data_out
                                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module RamAndFlash_sopc (
                          // 1) global signals:
                           clk_0,
                           clk_pllc0,
                           clk_pllc1,
                           reset_n,

                          // the_mmc_spi
                           MISO_to_the_mmc_spi,
                           MOSI_from_the_mmc_spi,
                           SCLK_from_the_mmc_spi,
                           SS_n_from_the_mmc_spi,

                          // the_pio_btn0
                           in_port_to_the_pio_btn0,

                          // the_pio_led
                           out_port_from_the_pio_led,

                          // the_pio_seg7
                           out_port_from_the_pio_seg7,

                          // the_pio_sw
                           in_port_to_the_pio_sw,

                          // the_pll
                           locked_from_the_pll,
                           phasedone_from_the_pll,

                          // the_ps2_0
                           PS2_CLK_to_and_from_the_ps2_0,
                           PS2_DAT_to_and_from_the_ps2_0,

                          // the_sdram
                           zs_addr_from_the_sdram,
                           zs_ba_from_the_sdram,
                           zs_cas_n_from_the_sdram,
                           zs_cke_from_the_sdram,
                           zs_cs_n_from_the_sdram,
                           zs_dq_to_and_from_the_sdram,
                           zs_dqm_from_the_sdram,
                           zs_ras_n_from_the_sdram,
                           zs_we_n_from_the_sdram,

                          // the_spi0
                           MISO_to_the_spi0,
                           MOSI_from_the_spi0,
                           SCLK_from_the_spi0,
                           SS_n_from_the_spi0,

                          // the_tri_state_bridge_avalon_slave
                           address_to_the_cfi_flash,
                           data_to_and_from_the_cfi_flash,
                           read_n_to_the_cfi_flash,
                           select_n_to_the_cfi_flash,
                           write_n_to_the_cfi_flash,

                          // the_uart0
                           rxd_to_the_uart0,
                           txd_from_the_uart0,

                          // the_video_vga_controller
                           VGA_B_from_the_video_vga_controller,
                           VGA_CLK_from_the_video_vga_controller,
                           VGA_G_from_the_video_vga_controller,
                           VGA_HS_from_the_video_vga_controller,
                           VGA_R_from_the_video_vga_controller,
                           VGA_VS_from_the_video_vga_controller
                        )
;

  output           MOSI_from_the_mmc_spi;
  output           MOSI_from_the_spi0;
  inout            PS2_CLK_to_and_from_the_ps2_0;
  inout            PS2_DAT_to_and_from_the_ps2_0;
  output           SCLK_from_the_mmc_spi;
  output           SCLK_from_the_spi0;
  output           SS_n_from_the_mmc_spi;
  output           SS_n_from_the_spi0;
  output  [  3: 0] VGA_B_from_the_video_vga_controller;
  output           VGA_CLK_from_the_video_vga_controller;
  output  [  3: 0] VGA_G_from_the_video_vga_controller;
  output           VGA_HS_from_the_video_vga_controller;
  output  [  3: 0] VGA_R_from_the_video_vga_controller;
  output           VGA_VS_from_the_video_vga_controller;
  output  [ 21: 0] address_to_the_cfi_flash;
  output           clk_pllc0;
  output           clk_pllc1;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash;
  output           locked_from_the_pll;
  output  [ 10: 0] out_port_from_the_pio_led;
  output  [ 31: 0] out_port_from_the_pio_seg7;
  output           phasedone_from_the_pll;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           txd_from_the_uart0;
  output           write_n_to_the_cfi_flash;
  output  [ 11: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram;
  output  [  1: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            MISO_to_the_mmc_spi;
  input            MISO_to_the_spi0;
  input            clk_0;
  input   [  2: 0] in_port_to_the_pio_btn0;
  input   [  9: 0] in_port_to_the_pio_sw;
  input            reset_n;
  input            rxd_to_the_uart0;

  wire             MOSI_from_the_mmc_spi;
  wire             MOSI_from_the_spi0;
  wire             PS2_CLK_to_and_from_the_ps2_0;
  wire             PS2_DAT_to_and_from_the_ps2_0;
  wire    [ 22: 0] RamAndFlash_sopc_clock_0_in_address;
  wire    [  1: 0] RamAndFlash_sopc_clock_0_in_byteenable;
  wire             RamAndFlash_sopc_clock_0_in_endofpacket;
  wire             RamAndFlash_sopc_clock_0_in_endofpacket_from_sa;
  wire    [ 21: 0] RamAndFlash_sopc_clock_0_in_nativeaddress;
  wire             RamAndFlash_sopc_clock_0_in_read;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_in_readdata;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_in_readdata_from_sa;
  wire             RamAndFlash_sopc_clock_0_in_reset_n;
  wire             RamAndFlash_sopc_clock_0_in_waitrequest;
  wire             RamAndFlash_sopc_clock_0_in_waitrequest_from_sa;
  wire             RamAndFlash_sopc_clock_0_in_write;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_in_writedata;
  wire    [ 22: 0] RamAndFlash_sopc_clock_0_out_address;
  wire    [ 22: 0] RamAndFlash_sopc_clock_0_out_address_to_slave;
  wire    [  1: 0] RamAndFlash_sopc_clock_0_out_byteenable;
  wire             RamAndFlash_sopc_clock_0_out_endofpacket;
  wire             RamAndFlash_sopc_clock_0_out_granted_sdram_s1;
  wire    [ 21: 0] RamAndFlash_sopc_clock_0_out_nativeaddress;
  wire             RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_read;
  wire             RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_out_readdata;
  wire             RamAndFlash_sopc_clock_0_out_requests_sdram_s1;
  wire             RamAndFlash_sopc_clock_0_out_reset_n;
  wire             RamAndFlash_sopc_clock_0_out_waitrequest;
  wire             RamAndFlash_sopc_clock_0_out_write;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_out_writedata;
  wire    [ 22: 0] RamAndFlash_sopc_clock_1_in_address;
  wire    [  1: 0] RamAndFlash_sopc_clock_1_in_byteenable;
  wire             RamAndFlash_sopc_clock_1_in_endofpacket;
  wire             RamAndFlash_sopc_clock_1_in_endofpacket_from_sa;
  wire    [ 21: 0] RamAndFlash_sopc_clock_1_in_nativeaddress;
  wire             RamAndFlash_sopc_clock_1_in_read;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_in_readdata;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_in_readdata_from_sa;
  wire             RamAndFlash_sopc_clock_1_in_reset_n;
  wire             RamAndFlash_sopc_clock_1_in_waitrequest;
  wire             RamAndFlash_sopc_clock_1_in_waitrequest_from_sa;
  wire             RamAndFlash_sopc_clock_1_in_write;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_in_writedata;
  wire    [ 22: 0] RamAndFlash_sopc_clock_1_out_address;
  wire    [ 22: 0] RamAndFlash_sopc_clock_1_out_address_to_slave;
  wire    [  1: 0] RamAndFlash_sopc_clock_1_out_byteenable;
  wire             RamAndFlash_sopc_clock_1_out_endofpacket;
  wire             RamAndFlash_sopc_clock_1_out_granted_sdram_s1;
  wire    [ 21: 0] RamAndFlash_sopc_clock_1_out_nativeaddress;
  wire             RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_read;
  wire             RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_out_readdata;
  wire             RamAndFlash_sopc_clock_1_out_requests_sdram_s1;
  wire             RamAndFlash_sopc_clock_1_out_reset_n;
  wire             RamAndFlash_sopc_clock_1_out_waitrequest;
  wire             RamAndFlash_sopc_clock_1_out_write;
  wire    [ 15: 0] RamAndFlash_sopc_clock_1_out_writedata;
  wire             SCLK_from_the_mmc_spi;
  wire             SCLK_from_the_spi0;
  wire             SS_n_from_the_mmc_spi;
  wire             SS_n_from_the_spi0;
  wire    [  3: 0] VGA_B_from_the_video_vga_controller;
  wire             VGA_CLK_from_the_video_vga_controller;
  wire    [  3: 0] VGA_G_from_the_video_vga_controller;
  wire             VGA_HS_from_the_video_vga_controller;
  wire    [  3: 0] VGA_R_from_the_video_vga_controller;
  wire             VGA_VS_from_the_video_vga_controller;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             clk_0_reset_n;
  wire             clk_pllc0;
  wire             clk_pllc0_reset_n;
  wire             clk_pllc1;
  wire             clk_pllc1_reset_n;
  wire    [ 24: 0] cpu_data_master_address;
  wire    [ 24: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [  1: 0] cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  wire             cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_mmc_spi_spi_control_port;
  wire             cpu_data_master_granted_onchip_memory_s1;
  wire             cpu_data_master_granted_pio_btn0_s1;
  wire             cpu_data_master_granted_pio_led_s1;
  wire             cpu_data_master_granted_pio_seg7_s1;
  wire             cpu_data_master_granted_pio_sw_s1;
  wire             cpu_data_master_granted_pll_pll_slave;
  wire             cpu_data_master_granted_ps2_0_avalon_ps2_slave;
  wire             cpu_data_master_granted_spi0_spi_control_port;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_granted_timer_s1;
  wire             cpu_data_master_granted_uart0_s1;
  wire             cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [  1: 0] cpu_data_master_latency_counter;
  wire             cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_mmc_spi_spi_control_port;
  wire             cpu_data_master_qualified_request_onchip_memory_s1;
  wire             cpu_data_master_qualified_request_pio_btn0_s1;
  wire             cpu_data_master_qualified_request_pio_led_s1;
  wire             cpu_data_master_qualified_request_pio_seg7_s1;
  wire             cpu_data_master_qualified_request_pio_sw_s1;
  wire             cpu_data_master_qualified_request_pll_pll_slave;
  wire             cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave;
  wire             cpu_data_master_qualified_request_spi0_spi_control_port;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_qualified_request_timer_s1;
  wire             cpu_data_master_qualified_request_uart0_s1;
  wire             cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_mmc_spi_spi_control_port;
  wire             cpu_data_master_read_data_valid_onchip_memory_s1;
  wire             cpu_data_master_read_data_valid_pio_btn0_s1;
  wire             cpu_data_master_read_data_valid_pio_led_s1;
  wire             cpu_data_master_read_data_valid_pio_seg7_s1;
  wire             cpu_data_master_read_data_valid_pio_sw_s1;
  wire             cpu_data_master_read_data_valid_pll_pll_slave;
  wire             cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave;
  wire             cpu_data_master_read_data_valid_spi0_spi_control_port;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_timer_s1;
  wire             cpu_data_master_read_data_valid_uart0_s1;
  wire             cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_requests_RamAndFlash_sopc_clock_1_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_mmc_spi_spi_control_port;
  wire             cpu_data_master_requests_onchip_memory_s1;
  wire             cpu_data_master_requests_pio_btn0_s1;
  wire             cpu_data_master_requests_pio_led_s1;
  wire             cpu_data_master_requests_pio_seg7_s1;
  wire             cpu_data_master_requests_pio_sw_s1;
  wire             cpu_data_master_requests_pll_pll_slave;
  wire             cpu_data_master_requests_ps2_0_avalon_ps2_slave;
  wire             cpu_data_master_requests_spi0_spi_control_port;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_requests_timer_s1;
  wire             cpu_data_master_requests_uart0_s1;
  wire             cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave;
  wire             cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave;
  wire             cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 24: 0] cpu_instruction_master_address;
  wire    [ 24: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire    [  1: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_RamAndFlash_sopc_clock_0_in_end_xfer;
  wire             d1_RamAndFlash_sopc_clock_1_in_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_mmc_spi_spi_control_port_end_xfer;
  wire             d1_onchip_memory_s1_end_xfer;
  wire             d1_onchip_memory_s2_end_xfer;
  wire             d1_pio_btn0_s1_end_xfer;
  wire             d1_pio_led_s1_end_xfer;
  wire             d1_pio_seg7_s1_end_xfer;
  wire             d1_pio_sw_s1_end_xfer;
  wire             d1_pll_pll_slave_end_xfer;
  wire             d1_ps2_0_avalon_ps2_slave_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_spi0_spi_control_port_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_s1_end_xfer;
  wire             d1_tri_state_bridge_avalon_slave_end_xfer;
  wire             d1_uart0_s1_end_xfer;
  wire             d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer;
  wire             d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer;
  wire             d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire             locked_from_the_pll;
  wire    [  2: 0] mmc_spi_spi_control_port_address;
  wire             mmc_spi_spi_control_port_chipselect;
  wire             mmc_spi_spi_control_port_dataavailable;
  wire             mmc_spi_spi_control_port_dataavailable_from_sa;
  wire             mmc_spi_spi_control_port_endofpacket;
  wire             mmc_spi_spi_control_port_endofpacket_from_sa;
  wire             mmc_spi_spi_control_port_irq;
  wire             mmc_spi_spi_control_port_irq_from_sa;
  wire             mmc_spi_spi_control_port_read_n;
  wire    [ 15: 0] mmc_spi_spi_control_port_readdata;
  wire    [ 15: 0] mmc_spi_spi_control_port_readdata_from_sa;
  wire             mmc_spi_spi_control_port_readyfordata;
  wire             mmc_spi_spi_control_port_readyfordata_from_sa;
  wire             mmc_spi_spi_control_port_reset_n;
  wire             mmc_spi_spi_control_port_write_n;
  wire    [ 15: 0] mmc_spi_spi_control_port_writedata;
  wire    [ 10: 0] onchip_memory_s1_address;
  wire    [  3: 0] onchip_memory_s1_byteenable;
  wire             onchip_memory_s1_chipselect;
  wire             onchip_memory_s1_clken;
  wire    [ 31: 0] onchip_memory_s1_readdata;
  wire    [ 31: 0] onchip_memory_s1_readdata_from_sa;
  wire             onchip_memory_s1_reset;
  wire             onchip_memory_s1_write;
  wire    [ 31: 0] onchip_memory_s1_writedata;
  wire    [ 10: 0] onchip_memory_s2_address;
  wire    [  3: 0] onchip_memory_s2_byteenable;
  wire             onchip_memory_s2_chipselect;
  wire             onchip_memory_s2_clken;
  wire    [ 31: 0] onchip_memory_s2_readdata;
  wire    [ 31: 0] onchip_memory_s2_readdata_from_sa;
  wire             onchip_memory_s2_reset;
  wire             onchip_memory_s2_write;
  wire    [ 31: 0] onchip_memory_s2_writedata;
  wire             out_clk_pll_c0;
  wire             out_clk_pll_c1;
  wire    [ 10: 0] out_port_from_the_pio_led;
  wire    [ 31: 0] out_port_from_the_pio_seg7;
  wire             phasedone_from_the_pll;
  wire    [  1: 0] pio_btn0_s1_address;
  wire             pio_btn0_s1_chipselect;
  wire             pio_btn0_s1_irq;
  wire             pio_btn0_s1_irq_from_sa;
  wire    [  2: 0] pio_btn0_s1_readdata;
  wire    [  2: 0] pio_btn0_s1_readdata_from_sa;
  wire             pio_btn0_s1_reset_n;
  wire             pio_btn0_s1_write_n;
  wire    [  2: 0] pio_btn0_s1_writedata;
  wire    [  1: 0] pio_led_s1_address;
  wire             pio_led_s1_chipselect;
  wire    [ 10: 0] pio_led_s1_readdata;
  wire    [ 10: 0] pio_led_s1_readdata_from_sa;
  wire             pio_led_s1_reset_n;
  wire             pio_led_s1_write_n;
  wire    [ 10: 0] pio_led_s1_writedata;
  wire    [  1: 0] pio_seg7_s1_address;
  wire             pio_seg7_s1_chipselect;
  wire    [ 31: 0] pio_seg7_s1_readdata;
  wire    [ 31: 0] pio_seg7_s1_readdata_from_sa;
  wire             pio_seg7_s1_reset_n;
  wire             pio_seg7_s1_write_n;
  wire    [ 31: 0] pio_seg7_s1_writedata;
  wire    [  1: 0] pio_sw_s1_address;
  wire    [  9: 0] pio_sw_s1_readdata;
  wire    [  9: 0] pio_sw_s1_readdata_from_sa;
  wire             pio_sw_s1_reset_n;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  wire             pll_pll_slave_reset;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire             ps2_0_avalon_ps2_slave_address;
  wire    [  3: 0] ps2_0_avalon_ps2_slave_byteenable;
  wire             ps2_0_avalon_ps2_slave_chipselect;
  wire             ps2_0_avalon_ps2_slave_irq;
  wire             ps2_0_avalon_ps2_slave_irq_from_sa;
  wire             ps2_0_avalon_ps2_slave_read;
  wire    [ 31: 0] ps2_0_avalon_ps2_slave_readdata;
  wire    [ 31: 0] ps2_0_avalon_ps2_slave_readdata_from_sa;
  wire             ps2_0_avalon_ps2_slave_reset;
  wire             ps2_0_avalon_ps2_slave_waitrequest;
  wire             ps2_0_avalon_ps2_slave_waitrequest_from_sa;
  wire             ps2_0_avalon_ps2_slave_write;
  wire    [ 31: 0] ps2_0_avalon_ps2_slave_writedata;
  wire             read_n_to_the_cfi_flash;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_s1_address;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire             select_n_to_the_cfi_flash;
  wire    [  2: 0] spi0_spi_control_port_address;
  wire             spi0_spi_control_port_chipselect;
  wire             spi0_spi_control_port_dataavailable;
  wire             spi0_spi_control_port_dataavailable_from_sa;
  wire             spi0_spi_control_port_endofpacket;
  wire             spi0_spi_control_port_endofpacket_from_sa;
  wire             spi0_spi_control_port_irq;
  wire             spi0_spi_control_port_irq_from_sa;
  wire             spi0_spi_control_port_read_n;
  wire    [ 15: 0] spi0_spi_control_port_readdata;
  wire    [ 15: 0] spi0_spi_control_port_readdata_from_sa;
  wire             spi0_spi_control_port_readyfordata;
  wire             spi0_spi_control_port_readyfordata_from_sa;
  wire             spi0_spi_control_port_reset_n;
  wire             spi0_spi_control_port_write_n;
  wire    [ 15: 0] spi0_spi_control_port_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_chipselect;
  wire             timer_s1_irq;
  wire             timer_s1_irq_from_sa;
  wire    [ 15: 0] timer_s1_readdata;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  wire             timer_s1_reset_n;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             txd_from_the_uart0;
  wire    [  2: 0] uart0_s1_address;
  wire             uart0_s1_begintransfer;
  wire             uart0_s1_chipselect;
  wire             uart0_s1_dataavailable;
  wire             uart0_s1_dataavailable_from_sa;
  wire             uart0_s1_irq;
  wire             uart0_s1_irq_from_sa;
  wire             uart0_s1_read_n;
  wire    [ 15: 0] uart0_s1_readdata;
  wire    [ 15: 0] uart0_s1_readdata_from_sa;
  wire             uart0_s1_readyfordata;
  wire             uart0_s1_readyfordata_from_sa;
  wire             uart0_s1_reset_n;
  wire             uart0_s1_write_n;
  wire    [ 15: 0] uart0_s1_writedata;
  wire    [ 29: 0] video_alpha_blender_avalon_background_sink_data;
  wire             video_alpha_blender_avalon_background_sink_endofpacket;
  wire             video_alpha_blender_avalon_background_sink_ready;
  wire             video_alpha_blender_avalon_background_sink_ready_from_sa;
  wire             video_alpha_blender_avalon_background_sink_startofpacket;
  wire             video_alpha_blender_avalon_background_sink_valid;
  wire    [ 29: 0] video_alpha_blender_avalon_blended_source_data;
  wire             video_alpha_blender_avalon_blended_source_endofpacket;
  wire             video_alpha_blender_avalon_blended_source_ready;
  wire             video_alpha_blender_avalon_blended_source_startofpacket;
  wire             video_alpha_blender_avalon_blended_source_valid;
  wire    [ 39: 0] video_alpha_blender_avalon_foreground_sink_data;
  wire             video_alpha_blender_avalon_foreground_sink_endofpacket;
  wire             video_alpha_blender_avalon_foreground_sink_ready;
  wire             video_alpha_blender_avalon_foreground_sink_ready_from_sa;
  wire             video_alpha_blender_avalon_foreground_sink_reset;
  wire             video_alpha_blender_avalon_foreground_sink_startofpacket;
  wire             video_alpha_blender_avalon_foreground_sink_valid;
  wire    [ 12: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_address;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_read;
  wire    [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_readdata;
  wire    [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa;
  wire             video_character_buffer_with_dma_avalon_char_buffer_slave_write;
  wire    [  7: 0] video_character_buffer_with_dma_avalon_char_buffer_slave_writedata;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_address;
  wire    [  3: 0] video_character_buffer_with_dma_avalon_char_control_slave_byteenable;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_chipselect;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_read;
  wire    [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_readdata;
  wire    [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_reset;
  wire             video_character_buffer_with_dma_avalon_char_control_slave_write;
  wire    [ 31: 0] video_character_buffer_with_dma_avalon_char_control_slave_writedata;
  wire    [ 39: 0] video_character_buffer_with_dma_avalon_char_source_data;
  wire             video_character_buffer_with_dma_avalon_char_source_endofpacket;
  wire             video_character_buffer_with_dma_avalon_char_source_ready;
  wire             video_character_buffer_with_dma_avalon_char_source_startofpacket;
  wire             video_character_buffer_with_dma_avalon_char_source_valid;
  wire    [ 29: 0] video_dual_clock_buffer_avalon_dc_buffer_sink_data;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_ready;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket;
  wire             video_dual_clock_buffer_avalon_dc_buffer_sink_valid;
  wire    [ 29: 0] video_dual_clock_buffer_avalon_dc_buffer_source_data;
  wire             video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket;
  wire             video_dual_clock_buffer_avalon_dc_buffer_source_ready;
  wire             video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket;
  wire             video_dual_clock_buffer_avalon_dc_buffer_source_valid;
  wire    [  1: 0] video_pixel_buffer_dma_avalon_control_slave_address;
  wire    [  3: 0] video_pixel_buffer_dma_avalon_control_slave_byteenable;
  wire             video_pixel_buffer_dma_avalon_control_slave_read;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_readdata;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa;
  wire             video_pixel_buffer_dma_avalon_control_slave_write;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_control_slave_writedata;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_address;
  wire    [ 31: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_arbiterlock;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_read;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2;
  wire    [  7: 0] video_pixel_buffer_dma_avalon_pixel_dma_master_readdata;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_reset;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest;
  wire    [  7: 0] video_pixel_buffer_dma_avalon_pixel_source_data;
  wire             video_pixel_buffer_dma_avalon_pixel_source_endofpacket;
  wire             video_pixel_buffer_dma_avalon_pixel_source_ready;
  wire             video_pixel_buffer_dma_avalon_pixel_source_startofpacket;
  wire             video_pixel_buffer_dma_avalon_pixel_source_valid;
  wire    [  7: 0] video_rgb_resampler_avalon_rgb_sink_data;
  wire             video_rgb_resampler_avalon_rgb_sink_endofpacket;
  wire             video_rgb_resampler_avalon_rgb_sink_ready;
  wire             video_rgb_resampler_avalon_rgb_sink_ready_from_sa;
  wire             video_rgb_resampler_avalon_rgb_sink_reset;
  wire             video_rgb_resampler_avalon_rgb_sink_startofpacket;
  wire             video_rgb_resampler_avalon_rgb_sink_valid;
  wire    [ 29: 0] video_rgb_resampler_avalon_rgb_source_data;
  wire             video_rgb_resampler_avalon_rgb_source_endofpacket;
  wire             video_rgb_resampler_avalon_rgb_source_ready;
  wire             video_rgb_resampler_avalon_rgb_source_startofpacket;
  wire             video_rgb_resampler_avalon_rgb_source_valid;
  wire    [ 29: 0] video_scaler_avalon_scaler_sink_data;
  wire             video_scaler_avalon_scaler_sink_endofpacket;
  wire             video_scaler_avalon_scaler_sink_ready;
  wire             video_scaler_avalon_scaler_sink_ready_from_sa;
  wire             video_scaler_avalon_scaler_sink_reset;
  wire             video_scaler_avalon_scaler_sink_startofpacket;
  wire             video_scaler_avalon_scaler_sink_valid;
  wire    [ 29: 0] video_scaler_avalon_scaler_source_data;
  wire             video_scaler_avalon_scaler_source_endofpacket;
  wire             video_scaler_avalon_scaler_source_ready;
  wire             video_scaler_avalon_scaler_source_startofpacket;
  wire             video_scaler_avalon_scaler_source_valid;
  wire    [ 29: 0] video_vga_controller_avalon_vga_sink_data;
  wire             video_vga_controller_avalon_vga_sink_endofpacket;
  wire             video_vga_controller_avalon_vga_sink_ready;
  wire             video_vga_controller_avalon_vga_sink_ready_from_sa;
  wire             video_vga_controller_avalon_vga_sink_reset;
  wire             video_vga_controller_avalon_vga_sink_startofpacket;
  wire             video_vga_controller_avalon_vga_sink_valid;
  wire             write_n_to_the_cfi_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  RamAndFlash_sopc_clock_0_in_arbitrator the_RamAndFlash_sopc_clock_0_in
    (
      .RamAndFlash_sopc_clock_0_in_address                                  (RamAndFlash_sopc_clock_0_in_address),
      .RamAndFlash_sopc_clock_0_in_byteenable                               (RamAndFlash_sopc_clock_0_in_byteenable),
      .RamAndFlash_sopc_clock_0_in_endofpacket                              (RamAndFlash_sopc_clock_0_in_endofpacket),
      .RamAndFlash_sopc_clock_0_in_endofpacket_from_sa                      (RamAndFlash_sopc_clock_0_in_endofpacket_from_sa),
      .RamAndFlash_sopc_clock_0_in_nativeaddress                            (RamAndFlash_sopc_clock_0_in_nativeaddress),
      .RamAndFlash_sopc_clock_0_in_read                                     (RamAndFlash_sopc_clock_0_in_read),
      .RamAndFlash_sopc_clock_0_in_readdata                                 (RamAndFlash_sopc_clock_0_in_readdata),
      .RamAndFlash_sopc_clock_0_in_readdata_from_sa                         (RamAndFlash_sopc_clock_0_in_readdata_from_sa),
      .RamAndFlash_sopc_clock_0_in_reset_n                                  (RamAndFlash_sopc_clock_0_in_reset_n),
      .RamAndFlash_sopc_clock_0_in_waitrequest                              (RamAndFlash_sopc_clock_0_in_waitrequest),
      .RamAndFlash_sopc_clock_0_in_waitrequest_from_sa                      (RamAndFlash_sopc_clock_0_in_waitrequest_from_sa),
      .RamAndFlash_sopc_clock_0_in_write                                    (RamAndFlash_sopc_clock_0_in_write),
      .clk                                                                  (clk_0),
      .cpu_instruction_master_address_to_slave                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                   (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in           (cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in),
      .cpu_instruction_master_latency_counter                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in (cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in),
      .cpu_instruction_master_read                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in   (cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in),
      .cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in          (cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in),
      .d1_RamAndFlash_sopc_clock_0_in_end_xfer                              (d1_RamAndFlash_sopc_clock_0_in_end_xfer),
      .reset_n                                                              (clk_0_reset_n)
    );

  RamAndFlash_sopc_clock_0_out_arbitrator the_RamAndFlash_sopc_clock_0_out
    (
      .RamAndFlash_sopc_clock_0_out_address                                 (RamAndFlash_sopc_clock_0_out_address),
      .RamAndFlash_sopc_clock_0_out_address_to_slave                        (RamAndFlash_sopc_clock_0_out_address_to_slave),
      .RamAndFlash_sopc_clock_0_out_byteenable                              (RamAndFlash_sopc_clock_0_out_byteenable),
      .RamAndFlash_sopc_clock_0_out_granted_sdram_s1                        (RamAndFlash_sopc_clock_0_out_granted_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1              (RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_read                                    (RamAndFlash_sopc_clock_0_out_read),
      .RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1                (RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register (RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register),
      .RamAndFlash_sopc_clock_0_out_readdata                                (RamAndFlash_sopc_clock_0_out_readdata),
      .RamAndFlash_sopc_clock_0_out_requests_sdram_s1                       (RamAndFlash_sopc_clock_0_out_requests_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_reset_n                                 (RamAndFlash_sopc_clock_0_out_reset_n),
      .RamAndFlash_sopc_clock_0_out_waitrequest                             (RamAndFlash_sopc_clock_0_out_waitrequest),
      .RamAndFlash_sopc_clock_0_out_write                                   (RamAndFlash_sopc_clock_0_out_write),
      .RamAndFlash_sopc_clock_0_out_writedata                               (RamAndFlash_sopc_clock_0_out_writedata),
      .clk                                                                  (clk_pllc0),
      .d1_sdram_s1_end_xfer                                                 (d1_sdram_s1_end_xfer),
      .reset_n                                                              (clk_pllc0_reset_n),
      .sdram_s1_readdata_from_sa                                            (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                         (sdram_s1_waitrequest_from_sa)
    );

  RamAndFlash_sopc_clock_0 the_RamAndFlash_sopc_clock_0
    (
      .master_address       (RamAndFlash_sopc_clock_0_out_address),
      .master_byteenable    (RamAndFlash_sopc_clock_0_out_byteenable),
      .master_clk           (clk_pllc0),
      .master_endofpacket   (RamAndFlash_sopc_clock_0_out_endofpacket),
      .master_nativeaddress (RamAndFlash_sopc_clock_0_out_nativeaddress),
      .master_read          (RamAndFlash_sopc_clock_0_out_read),
      .master_readdata      (RamAndFlash_sopc_clock_0_out_readdata),
      .master_reset_n       (RamAndFlash_sopc_clock_0_out_reset_n),
      .master_waitrequest   (RamAndFlash_sopc_clock_0_out_waitrequest),
      .master_write         (RamAndFlash_sopc_clock_0_out_write),
      .master_writedata     (RamAndFlash_sopc_clock_0_out_writedata),
      .slave_address        (RamAndFlash_sopc_clock_0_in_address),
      .slave_byteenable     (RamAndFlash_sopc_clock_0_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (RamAndFlash_sopc_clock_0_in_endofpacket),
      .slave_nativeaddress  (RamAndFlash_sopc_clock_0_in_nativeaddress),
      .slave_read           (RamAndFlash_sopc_clock_0_in_read),
      .slave_readdata       (RamAndFlash_sopc_clock_0_in_readdata),
      .slave_reset_n        (RamAndFlash_sopc_clock_0_in_reset_n),
      .slave_waitrequest    (RamAndFlash_sopc_clock_0_in_waitrequest),
      .slave_write          (RamAndFlash_sopc_clock_0_in_write),
      .slave_writedata      (RamAndFlash_sopc_clock_0_in_writedata)
    );

  RamAndFlash_sopc_clock_1_in_arbitrator the_RamAndFlash_sopc_clock_1_in
    (
      .RamAndFlash_sopc_clock_1_in_address                           (RamAndFlash_sopc_clock_1_in_address),
      .RamAndFlash_sopc_clock_1_in_byteenable                        (RamAndFlash_sopc_clock_1_in_byteenable),
      .RamAndFlash_sopc_clock_1_in_endofpacket                       (RamAndFlash_sopc_clock_1_in_endofpacket),
      .RamAndFlash_sopc_clock_1_in_endofpacket_from_sa               (RamAndFlash_sopc_clock_1_in_endofpacket_from_sa),
      .RamAndFlash_sopc_clock_1_in_nativeaddress                     (RamAndFlash_sopc_clock_1_in_nativeaddress),
      .RamAndFlash_sopc_clock_1_in_read                              (RamAndFlash_sopc_clock_1_in_read),
      .RamAndFlash_sopc_clock_1_in_readdata                          (RamAndFlash_sopc_clock_1_in_readdata),
      .RamAndFlash_sopc_clock_1_in_readdata_from_sa                  (RamAndFlash_sopc_clock_1_in_readdata_from_sa),
      .RamAndFlash_sopc_clock_1_in_reset_n                           (RamAndFlash_sopc_clock_1_in_reset_n),
      .RamAndFlash_sopc_clock_1_in_waitrequest                       (RamAndFlash_sopc_clock_1_in_waitrequest),
      .RamAndFlash_sopc_clock_1_in_waitrequest_from_sa               (RamAndFlash_sopc_clock_1_in_waitrequest_from_sa),
      .RamAndFlash_sopc_clock_1_in_write                             (RamAndFlash_sopc_clock_1_in_write),
      .RamAndFlash_sopc_clock_1_in_writedata                         (RamAndFlash_sopc_clock_1_in_writedata),
      .clk                                                           (clk_0),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                    (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in        (cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_dbs_address                                   (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                  (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_RamAndFlash_sopc_clock_1_in           (cpu_data_master_granted_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_latency_counter                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in (cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in   (cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_requests_RamAndFlash_sopc_clock_1_in          (cpu_data_master_requests_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .d1_RamAndFlash_sopc_clock_1_in_end_xfer                       (d1_RamAndFlash_sopc_clock_1_in_end_xfer),
      .reset_n                                                       (clk_0_reset_n)
    );

  RamAndFlash_sopc_clock_1_out_arbitrator the_RamAndFlash_sopc_clock_1_out
    (
      .RamAndFlash_sopc_clock_1_out_address                                 (RamAndFlash_sopc_clock_1_out_address),
      .RamAndFlash_sopc_clock_1_out_address_to_slave                        (RamAndFlash_sopc_clock_1_out_address_to_slave),
      .RamAndFlash_sopc_clock_1_out_byteenable                              (RamAndFlash_sopc_clock_1_out_byteenable),
      .RamAndFlash_sopc_clock_1_out_granted_sdram_s1                        (RamAndFlash_sopc_clock_1_out_granted_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1              (RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_read                                    (RamAndFlash_sopc_clock_1_out_read),
      .RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1                (RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register (RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register),
      .RamAndFlash_sopc_clock_1_out_readdata                                (RamAndFlash_sopc_clock_1_out_readdata),
      .RamAndFlash_sopc_clock_1_out_requests_sdram_s1                       (RamAndFlash_sopc_clock_1_out_requests_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_reset_n                                 (RamAndFlash_sopc_clock_1_out_reset_n),
      .RamAndFlash_sopc_clock_1_out_waitrequest                             (RamAndFlash_sopc_clock_1_out_waitrequest),
      .RamAndFlash_sopc_clock_1_out_write                                   (RamAndFlash_sopc_clock_1_out_write),
      .RamAndFlash_sopc_clock_1_out_writedata                               (RamAndFlash_sopc_clock_1_out_writedata),
      .clk                                                                  (clk_pllc0),
      .d1_sdram_s1_end_xfer                                                 (d1_sdram_s1_end_xfer),
      .reset_n                                                              (clk_pllc0_reset_n),
      .sdram_s1_readdata_from_sa                                            (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                         (sdram_s1_waitrequest_from_sa)
    );

  RamAndFlash_sopc_clock_1 the_RamAndFlash_sopc_clock_1
    (
      .master_address       (RamAndFlash_sopc_clock_1_out_address),
      .master_byteenable    (RamAndFlash_sopc_clock_1_out_byteenable),
      .master_clk           (clk_pllc0),
      .master_endofpacket   (RamAndFlash_sopc_clock_1_out_endofpacket),
      .master_nativeaddress (RamAndFlash_sopc_clock_1_out_nativeaddress),
      .master_read          (RamAndFlash_sopc_clock_1_out_read),
      .master_readdata      (RamAndFlash_sopc_clock_1_out_readdata),
      .master_reset_n       (RamAndFlash_sopc_clock_1_out_reset_n),
      .master_waitrequest   (RamAndFlash_sopc_clock_1_out_waitrequest),
      .master_write         (RamAndFlash_sopc_clock_1_out_write),
      .master_writedata     (RamAndFlash_sopc_clock_1_out_writedata),
      .slave_address        (RamAndFlash_sopc_clock_1_in_address),
      .slave_byteenable     (RamAndFlash_sopc_clock_1_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (RamAndFlash_sopc_clock_1_in_endofpacket),
      .slave_nativeaddress  (RamAndFlash_sopc_clock_1_in_nativeaddress),
      .slave_read           (RamAndFlash_sopc_clock_1_in_read),
      .slave_readdata       (RamAndFlash_sopc_clock_1_in_readdata),
      .slave_reset_n        (RamAndFlash_sopc_clock_1_in_reset_n),
      .slave_waitrequest    (RamAndFlash_sopc_clock_1_in_waitrequest),
      .slave_write          (RamAndFlash_sopc_clock_1_in_write),
      .slave_writedata      (RamAndFlash_sopc_clock_1_in_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (clk_0),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_latency_counter                                (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (clk_0_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .RamAndFlash_sopc_clock_1_in_readdata_from_sa                                                (RamAndFlash_sopc_clock_1_in_readdata_from_sa),
      .RamAndFlash_sopc_clock_1_in_waitrequest_from_sa                                             (RamAndFlash_sopc_clock_1_in_waitrequest_from_sa),
      .cfi_flash_s1_wait_counter_eq_0                                                              (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                                         (clk_0),
      .cpu_data_master_address                                                                     (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                                            (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                                  (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in                                      (cpu_data_master_byteenable_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_byteenable_cfi_flash_s1                                                     (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave         (cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_dbs_address                                                                 (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                                                (cpu_data_master_dbs_write_16),
      .cpu_data_master_dbs_write_8                                                                 (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_RamAndFlash_sopc_clock_1_in                                         (cpu_data_master_granted_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_granted_cfi_flash_s1                                                        (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                                               (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                                         (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_mmc_spi_spi_control_port                                            (cpu_data_master_granted_mmc_spi_spi_control_port),
      .cpu_data_master_granted_onchip_memory_s1                                                    (cpu_data_master_granted_onchip_memory_s1),
      .cpu_data_master_granted_pio_btn0_s1                                                         (cpu_data_master_granted_pio_btn0_s1),
      .cpu_data_master_granted_pio_led_s1                                                          (cpu_data_master_granted_pio_led_s1),
      .cpu_data_master_granted_pio_seg7_s1                                                         (cpu_data_master_granted_pio_seg7_s1),
      .cpu_data_master_granted_pio_sw_s1                                                           (cpu_data_master_granted_pio_sw_s1),
      .cpu_data_master_granted_pll_pll_slave                                                       (cpu_data_master_granted_pll_pll_slave),
      .cpu_data_master_granted_ps2_0_avalon_ps2_slave                                              (cpu_data_master_granted_ps2_0_avalon_ps2_slave),
      .cpu_data_master_granted_spi0_spi_control_port                                               (cpu_data_master_granted_spi0_spi_control_port),
      .cpu_data_master_granted_sysid_control_slave                                                 (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_granted_timer_s1                                                            (cpu_data_master_granted_timer_s1),
      .cpu_data_master_granted_uart0_s1                                                            (cpu_data_master_granted_uart0_s1),
      .cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave            (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave           (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave                         (cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_irq                                                                         (cpu_data_master_irq),
      .cpu_data_master_latency_counter                                                             (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in                               (cpu_data_master_qualified_request_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_qualified_request_cfi_flash_s1                                              (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                                     (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave                               (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_mmc_spi_spi_control_port                                  (cpu_data_master_qualified_request_mmc_spi_spi_control_port),
      .cpu_data_master_qualified_request_onchip_memory_s1                                          (cpu_data_master_qualified_request_onchip_memory_s1),
      .cpu_data_master_qualified_request_pio_btn0_s1                                               (cpu_data_master_qualified_request_pio_btn0_s1),
      .cpu_data_master_qualified_request_pio_led_s1                                                (cpu_data_master_qualified_request_pio_led_s1),
      .cpu_data_master_qualified_request_pio_seg7_s1                                               (cpu_data_master_qualified_request_pio_seg7_s1),
      .cpu_data_master_qualified_request_pio_sw_s1                                                 (cpu_data_master_qualified_request_pio_sw_s1),
      .cpu_data_master_qualified_request_pll_pll_slave                                             (cpu_data_master_qualified_request_pll_pll_slave),
      .cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave                                    (cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave),
      .cpu_data_master_qualified_request_spi0_spi_control_port                                     (cpu_data_master_qualified_request_spi0_spi_control_port),
      .cpu_data_master_qualified_request_sysid_control_slave                                       (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_qualified_request_timer_s1                                                  (cpu_data_master_qualified_request_timer_s1),
      .cpu_data_master_qualified_request_uart0_s1                                                  (cpu_data_master_qualified_request_uart0_s1),
      .cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave  (cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave (cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave               (cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_read                                                                        (cpu_data_master_read),
      .cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in                                 (cpu_data_master_read_data_valid_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_read_data_valid_cfi_flash_s1                                                (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                                       (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave                                 (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_mmc_spi_spi_control_port                                    (cpu_data_master_read_data_valid_mmc_spi_spi_control_port),
      .cpu_data_master_read_data_valid_onchip_memory_s1                                            (cpu_data_master_read_data_valid_onchip_memory_s1),
      .cpu_data_master_read_data_valid_pio_btn0_s1                                                 (cpu_data_master_read_data_valid_pio_btn0_s1),
      .cpu_data_master_read_data_valid_pio_led_s1                                                  (cpu_data_master_read_data_valid_pio_led_s1),
      .cpu_data_master_read_data_valid_pio_seg7_s1                                                 (cpu_data_master_read_data_valid_pio_seg7_s1),
      .cpu_data_master_read_data_valid_pio_sw_s1                                                   (cpu_data_master_read_data_valid_pio_sw_s1),
      .cpu_data_master_read_data_valid_pll_pll_slave                                               (cpu_data_master_read_data_valid_pll_pll_slave),
      .cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave                                      (cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave),
      .cpu_data_master_read_data_valid_spi0_spi_control_port                                       (cpu_data_master_read_data_valid_spi0_spi_control_port),
      .cpu_data_master_read_data_valid_sysid_control_slave                                         (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_read_data_valid_timer_s1                                                    (cpu_data_master_read_data_valid_timer_s1),
      .cpu_data_master_read_data_valid_uart0_s1                                                    (cpu_data_master_read_data_valid_uart0_s1),
      .cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave    (cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave   (cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave                 (cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_readdata                                                                    (cpu_data_master_readdata),
      .cpu_data_master_readdatavalid                                                               (cpu_data_master_readdatavalid),
      .cpu_data_master_requests_RamAndFlash_sopc_clock_1_in                                        (cpu_data_master_requests_RamAndFlash_sopc_clock_1_in),
      .cpu_data_master_requests_cfi_flash_s1                                                       (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                                              (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                                        (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_mmc_spi_spi_control_port                                           (cpu_data_master_requests_mmc_spi_spi_control_port),
      .cpu_data_master_requests_onchip_memory_s1                                                   (cpu_data_master_requests_onchip_memory_s1),
      .cpu_data_master_requests_pio_btn0_s1                                                        (cpu_data_master_requests_pio_btn0_s1),
      .cpu_data_master_requests_pio_led_s1                                                         (cpu_data_master_requests_pio_led_s1),
      .cpu_data_master_requests_pio_seg7_s1                                                        (cpu_data_master_requests_pio_seg7_s1),
      .cpu_data_master_requests_pio_sw_s1                                                          (cpu_data_master_requests_pio_sw_s1),
      .cpu_data_master_requests_pll_pll_slave                                                      (cpu_data_master_requests_pll_pll_slave),
      .cpu_data_master_requests_ps2_0_avalon_ps2_slave                                             (cpu_data_master_requests_ps2_0_avalon_ps2_slave),
      .cpu_data_master_requests_spi0_spi_control_port                                              (cpu_data_master_requests_spi0_spi_control_port),
      .cpu_data_master_requests_sysid_control_slave                                                (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_requests_timer_s1                                                           (cpu_data_master_requests_timer_s1),
      .cpu_data_master_requests_uart0_s1                                                           (cpu_data_master_requests_uart0_s1),
      .cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave           (cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave          (cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave                        (cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_waitrequest                                                                 (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                                       (cpu_data_master_write),
      .cpu_data_master_writedata                                                                   (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                                      (cpu_jtag_debug_module_readdata_from_sa),
      .d1_RamAndFlash_sopc_clock_1_in_end_xfer                                                     (d1_RamAndFlash_sopc_clock_1_in_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                                           (d1_cpu_jtag_debug_module_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                                     (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_mmc_spi_spi_control_port_end_xfer                                                        (d1_mmc_spi_spi_control_port_end_xfer),
      .d1_onchip_memory_s1_end_xfer                                                                (d1_onchip_memory_s1_end_xfer),
      .d1_pio_btn0_s1_end_xfer                                                                     (d1_pio_btn0_s1_end_xfer),
      .d1_pio_led_s1_end_xfer                                                                      (d1_pio_led_s1_end_xfer),
      .d1_pio_seg7_s1_end_xfer                                                                     (d1_pio_seg7_s1_end_xfer),
      .d1_pio_sw_s1_end_xfer                                                                       (d1_pio_sw_s1_end_xfer),
      .d1_pll_pll_slave_end_xfer                                                                   (d1_pll_pll_slave_end_xfer),
      .d1_ps2_0_avalon_ps2_slave_end_xfer                                                          (d1_ps2_0_avalon_ps2_slave_end_xfer),
      .d1_spi0_spi_control_port_end_xfer                                                           (d1_spi0_spi_control_port_end_xfer),
      .d1_sysid_control_slave_end_xfer                                                             (d1_sysid_control_slave_end_xfer),
      .d1_timer_s1_end_xfer                                                                        (d1_timer_s1_end_xfer),
      .d1_tri_state_bridge_avalon_slave_end_xfer                                                   (d1_tri_state_bridge_avalon_slave_end_xfer),
      .d1_uart0_s1_end_xfer                                                                        (d1_uart0_s1_end_xfer),
      .d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer                        (d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer),
      .d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer                       (d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer),
      .d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer                                     (d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0                              (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                                     (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                                                (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                                             (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .mmc_spi_spi_control_port_irq_from_sa                                                        (mmc_spi_spi_control_port_irq_from_sa),
      .mmc_spi_spi_control_port_readdata_from_sa                                                   (mmc_spi_spi_control_port_readdata_from_sa),
      .onchip_memory_s1_readdata_from_sa                                                           (onchip_memory_s1_readdata_from_sa),
      .pio_btn0_s1_irq_from_sa                                                                     (pio_btn0_s1_irq_from_sa),
      .pio_btn0_s1_readdata_from_sa                                                                (pio_btn0_s1_readdata_from_sa),
      .pio_led_s1_readdata_from_sa                                                                 (pio_led_s1_readdata_from_sa),
      .pio_seg7_s1_readdata_from_sa                                                                (pio_seg7_s1_readdata_from_sa),
      .pio_sw_s1_readdata_from_sa                                                                  (pio_sw_s1_readdata_from_sa),
      .pll_pll_slave_readdata_from_sa                                                              (pll_pll_slave_readdata_from_sa),
      .ps2_0_avalon_ps2_slave_irq_from_sa                                                          (ps2_0_avalon_ps2_slave_irq_from_sa),
      .ps2_0_avalon_ps2_slave_readdata_from_sa                                                     (ps2_0_avalon_ps2_slave_readdata_from_sa),
      .ps2_0_avalon_ps2_slave_waitrequest_from_sa                                                  (ps2_0_avalon_ps2_slave_waitrequest_from_sa),
      .reset_n                                                                                     (clk_0_reset_n),
      .spi0_spi_control_port_irq_from_sa                                                           (spi0_spi_control_port_irq_from_sa),
      .spi0_spi_control_port_readdata_from_sa                                                      (spi0_spi_control_port_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                                        (sysid_control_slave_readdata_from_sa),
      .timer_s1_irq_from_sa                                                                        (timer_s1_irq_from_sa),
      .timer_s1_readdata_from_sa                                                                   (timer_s1_readdata_from_sa),
      .uart0_s1_irq_from_sa                                                                        (uart0_s1_irq_from_sa),
      .uart0_s1_readdata_from_sa                                                                   (uart0_s1_readdata_from_sa),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa                   (video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa                (video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa),
      .video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa                  (video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa),
      .video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa                                (video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .RamAndFlash_sopc_clock_0_in_readdata_from_sa                         (RamAndFlash_sopc_clock_0_in_readdata_from_sa),
      .RamAndFlash_sopc_clock_0_in_waitrequest_from_sa                      (RamAndFlash_sopc_clock_0_in_waitrequest_from_sa),
      .cfi_flash_s1_wait_counter_eq_0                                       (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                  (clk_0),
      .cpu_instruction_master_address                                       (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                   (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in           (cpu_instruction_master_granted_RamAndFlash_sopc_clock_0_in),
      .cpu_instruction_master_granted_cfi_flash_s1                          (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                 (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in (cpu_instruction_master_qualified_request_RamAndFlash_sopc_clock_0_in),
      .cpu_instruction_master_qualified_request_cfi_flash_s1                (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module       (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in   (cpu_instruction_master_read_data_valid_RamAndFlash_sopc_clock_0_in),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1                  (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module         (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_readdata                                      (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                                 (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in          (cpu_instruction_master_requests_RamAndFlash_sopc_clock_0_in),
      .cpu_instruction_master_requests_cfi_flash_s1                         (cpu_instruction_master_requests_cfi_flash_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_waitrequest                                   (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                               (cpu_jtag_debug_module_readdata_from_sa),
      .d1_RamAndFlash_sopc_clock_0_in_end_xfer                              (d1_RamAndFlash_sopc_clock_0_in_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                    (d1_cpu_jtag_debug_module_end_xfer),
      .d1_tri_state_bridge_avalon_slave_end_xfer                            (d1_tri_state_bridge_avalon_slave_end_xfer),
      .incoming_data_to_and_from_the_cfi_flash                              (incoming_data_to_and_from_the_cfi_flash),
      .reset_n                                                              (clk_0_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_readdatavalid                       (cpu_data_master_readdatavalid),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (clk_0),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_latency_counter                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                           (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                        (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                     (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                               (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                            (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                          (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                      (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                           (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                       (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                           (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                         (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                       (clk_0_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (clk_0),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  mmc_spi_spi_control_port_arbitrator the_mmc_spi_spi_control_port
    (
      .clk                                                        (clk_0),
      .cpu_data_master_address_to_slave                           (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_mmc_spi_spi_control_port           (cpu_data_master_granted_mmc_spi_spi_control_port),
      .cpu_data_master_latency_counter                            (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_mmc_spi_spi_control_port (cpu_data_master_qualified_request_mmc_spi_spi_control_port),
      .cpu_data_master_read                                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_mmc_spi_spi_control_port   (cpu_data_master_read_data_valid_mmc_spi_spi_control_port),
      .cpu_data_master_requests_mmc_spi_spi_control_port          (cpu_data_master_requests_mmc_spi_spi_control_port),
      .cpu_data_master_write                                      (cpu_data_master_write),
      .cpu_data_master_writedata                                  (cpu_data_master_writedata),
      .d1_mmc_spi_spi_control_port_end_xfer                       (d1_mmc_spi_spi_control_port_end_xfer),
      .mmc_spi_spi_control_port_address                           (mmc_spi_spi_control_port_address),
      .mmc_spi_spi_control_port_chipselect                        (mmc_spi_spi_control_port_chipselect),
      .mmc_spi_spi_control_port_dataavailable                     (mmc_spi_spi_control_port_dataavailable),
      .mmc_spi_spi_control_port_dataavailable_from_sa             (mmc_spi_spi_control_port_dataavailable_from_sa),
      .mmc_spi_spi_control_port_endofpacket                       (mmc_spi_spi_control_port_endofpacket),
      .mmc_spi_spi_control_port_endofpacket_from_sa               (mmc_spi_spi_control_port_endofpacket_from_sa),
      .mmc_spi_spi_control_port_irq                               (mmc_spi_spi_control_port_irq),
      .mmc_spi_spi_control_port_irq_from_sa                       (mmc_spi_spi_control_port_irq_from_sa),
      .mmc_spi_spi_control_port_read_n                            (mmc_spi_spi_control_port_read_n),
      .mmc_spi_spi_control_port_readdata                          (mmc_spi_spi_control_port_readdata),
      .mmc_spi_spi_control_port_readdata_from_sa                  (mmc_spi_spi_control_port_readdata_from_sa),
      .mmc_spi_spi_control_port_readyfordata                      (mmc_spi_spi_control_port_readyfordata),
      .mmc_spi_spi_control_port_readyfordata_from_sa              (mmc_spi_spi_control_port_readyfordata_from_sa),
      .mmc_spi_spi_control_port_reset_n                           (mmc_spi_spi_control_port_reset_n),
      .mmc_spi_spi_control_port_write_n                           (mmc_spi_spi_control_port_write_n),
      .mmc_spi_spi_control_port_writedata                         (mmc_spi_spi_control_port_writedata),
      .reset_n                                                    (clk_0_reset_n)
    );

  mmc_spi the_mmc_spi
    (
      .MISO          (MISO_to_the_mmc_spi),
      .MOSI          (MOSI_from_the_mmc_spi),
      .SCLK          (SCLK_from_the_mmc_spi),
      .SS_n          (SS_n_from_the_mmc_spi),
      .clk           (clk_0),
      .data_from_cpu (mmc_spi_spi_control_port_writedata),
      .data_to_cpu   (mmc_spi_spi_control_port_readdata),
      .dataavailable (mmc_spi_spi_control_port_dataavailable),
      .endofpacket   (mmc_spi_spi_control_port_endofpacket),
      .irq           (mmc_spi_spi_control_port_irq),
      .mem_addr      (mmc_spi_spi_control_port_address),
      .read_n        (mmc_spi_spi_control_port_read_n),
      .readyfordata  (mmc_spi_spi_control_port_readyfordata),
      .reset_n       (mmc_spi_spi_control_port_reset_n),
      .spi_select    (mmc_spi_spi_control_port_chipselect),
      .write_n       (mmc_spi_spi_control_port_write_n)
    );

  onchip_memory_s1_arbitrator the_onchip_memory_s1
    (
      .clk                                                (clk_0),
      .cpu_data_master_address_to_slave                   (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                         (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_memory_s1           (cpu_data_master_granted_onchip_memory_s1),
      .cpu_data_master_latency_counter                    (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_onchip_memory_s1 (cpu_data_master_qualified_request_onchip_memory_s1),
      .cpu_data_master_read                               (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_memory_s1   (cpu_data_master_read_data_valid_onchip_memory_s1),
      .cpu_data_master_requests_onchip_memory_s1          (cpu_data_master_requests_onchip_memory_s1),
      .cpu_data_master_write                              (cpu_data_master_write),
      .cpu_data_master_writedata                          (cpu_data_master_writedata),
      .d1_onchip_memory_s1_end_xfer                       (d1_onchip_memory_s1_end_xfer),
      .onchip_memory_s1_address                           (onchip_memory_s1_address),
      .onchip_memory_s1_byteenable                        (onchip_memory_s1_byteenable),
      .onchip_memory_s1_chipselect                        (onchip_memory_s1_chipselect),
      .onchip_memory_s1_clken                             (onchip_memory_s1_clken),
      .onchip_memory_s1_readdata                          (onchip_memory_s1_readdata),
      .onchip_memory_s1_readdata_from_sa                  (onchip_memory_s1_readdata_from_sa),
      .onchip_memory_s1_reset                             (onchip_memory_s1_reset),
      .onchip_memory_s1_write                             (onchip_memory_s1_write),
      .onchip_memory_s1_writedata                         (onchip_memory_s1_writedata),
      .reset_n                                            (clk_0_reset_n)
    );

  onchip_memory_s2_arbitrator the_onchip_memory_s2
    (
      .clk                                                                               (clk_0),
      .d1_onchip_memory_s2_end_xfer                                                      (d1_onchip_memory_s2_end_xfer),
      .onchip_memory_s2_address                                                          (onchip_memory_s2_address),
      .onchip_memory_s2_byteenable                                                       (onchip_memory_s2_byteenable),
      .onchip_memory_s2_chipselect                                                       (onchip_memory_s2_chipselect),
      .onchip_memory_s2_clken                                                            (onchip_memory_s2_clken),
      .onchip_memory_s2_readdata                                                         (onchip_memory_s2_readdata),
      .onchip_memory_s2_readdata_from_sa                                                 (onchip_memory_s2_readdata_from_sa),
      .onchip_memory_s2_reset                                                            (onchip_memory_s2_reset),
      .onchip_memory_s2_write                                                            (onchip_memory_s2_write),
      .onchip_memory_s2_writedata                                                        (onchip_memory_s2_writedata),
      .reset_n                                                                           (clk_0_reset_n),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave                   (video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2           (video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter                    (video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2 (video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_read                               (video_pixel_buffer_dma_avalon_pixel_dma_master_read),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2   (video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2          (video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2)
    );

  onchip_memory the_onchip_memory
    (
      .address     (onchip_memory_s1_address),
      .address2    (onchip_memory_s2_address),
      .byteenable  (onchip_memory_s1_byteenable),
      .byteenable2 (onchip_memory_s2_byteenable),
      .chipselect  (onchip_memory_s1_chipselect),
      .chipselect2 (onchip_memory_s2_chipselect),
      .clk         (clk_0),
      .clk2        (clk_0),
      .clken       (onchip_memory_s1_clken),
      .clken2      (onchip_memory_s2_clken),
      .readdata    (onchip_memory_s1_readdata),
      .readdata2   (onchip_memory_s2_readdata),
      .reset       (onchip_memory_s1_reset),
      .reset2      (onchip_memory_s2_reset),
      .write       (onchip_memory_s1_write),
      .write2      (onchip_memory_s2_write),
      .writedata   (onchip_memory_s1_writedata),
      .writedata2  (onchip_memory_s2_writedata)
    );

  pio_btn0_s1_arbitrator the_pio_btn0_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pio_btn0_s1           (cpu_data_master_granted_pio_btn0_s1),
      .cpu_data_master_latency_counter               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_pio_btn0_s1 (cpu_data_master_qualified_request_pio_btn0_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pio_btn0_s1   (cpu_data_master_read_data_valid_pio_btn0_s1),
      .cpu_data_master_requests_pio_btn0_s1          (cpu_data_master_requests_pio_btn0_s1),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_pio_btn0_s1_end_xfer                       (d1_pio_btn0_s1_end_xfer),
      .pio_btn0_s1_address                           (pio_btn0_s1_address),
      .pio_btn0_s1_chipselect                        (pio_btn0_s1_chipselect),
      .pio_btn0_s1_irq                               (pio_btn0_s1_irq),
      .pio_btn0_s1_irq_from_sa                       (pio_btn0_s1_irq_from_sa),
      .pio_btn0_s1_readdata                          (pio_btn0_s1_readdata),
      .pio_btn0_s1_readdata_from_sa                  (pio_btn0_s1_readdata_from_sa),
      .pio_btn0_s1_reset_n                           (pio_btn0_s1_reset_n),
      .pio_btn0_s1_write_n                           (pio_btn0_s1_write_n),
      .pio_btn0_s1_writedata                         (pio_btn0_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  pio_btn0 the_pio_btn0
    (
      .address    (pio_btn0_s1_address),
      .chipselect (pio_btn0_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_pio_btn0),
      .irq        (pio_btn0_s1_irq),
      .readdata   (pio_btn0_s1_readdata),
      .reset_n    (pio_btn0_s1_reset_n),
      .write_n    (pio_btn0_s1_write_n),
      .writedata  (pio_btn0_s1_writedata)
    );

  pio_led_s1_arbitrator the_pio_led_s1
    (
      .clk                                          (clk_0),
      .cpu_data_master_address_to_slave             (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pio_led_s1           (cpu_data_master_granted_pio_led_s1),
      .cpu_data_master_latency_counter              (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_pio_led_s1 (cpu_data_master_qualified_request_pio_led_s1),
      .cpu_data_master_read                         (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pio_led_s1   (cpu_data_master_read_data_valid_pio_led_s1),
      .cpu_data_master_requests_pio_led_s1          (cpu_data_master_requests_pio_led_s1),
      .cpu_data_master_write                        (cpu_data_master_write),
      .cpu_data_master_writedata                    (cpu_data_master_writedata),
      .d1_pio_led_s1_end_xfer                       (d1_pio_led_s1_end_xfer),
      .pio_led_s1_address                           (pio_led_s1_address),
      .pio_led_s1_chipselect                        (pio_led_s1_chipselect),
      .pio_led_s1_readdata                          (pio_led_s1_readdata),
      .pio_led_s1_readdata_from_sa                  (pio_led_s1_readdata_from_sa),
      .pio_led_s1_reset_n                           (pio_led_s1_reset_n),
      .pio_led_s1_write_n                           (pio_led_s1_write_n),
      .pio_led_s1_writedata                         (pio_led_s1_writedata),
      .reset_n                                      (clk_0_reset_n)
    );

  pio_led the_pio_led
    (
      .address    (pio_led_s1_address),
      .chipselect (pio_led_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_led),
      .readdata   (pio_led_s1_readdata),
      .reset_n    (pio_led_s1_reset_n),
      .write_n    (pio_led_s1_write_n),
      .writedata  (pio_led_s1_writedata)
    );

  pio_seg7_s1_arbitrator the_pio_seg7_s1
    (
      .clk                                           (clk_0),
      .cpu_data_master_address_to_slave              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pio_seg7_s1           (cpu_data_master_granted_pio_seg7_s1),
      .cpu_data_master_latency_counter               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_pio_seg7_s1 (cpu_data_master_qualified_request_pio_seg7_s1),
      .cpu_data_master_read                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pio_seg7_s1   (cpu_data_master_read_data_valid_pio_seg7_s1),
      .cpu_data_master_requests_pio_seg7_s1          (cpu_data_master_requests_pio_seg7_s1),
      .cpu_data_master_write                         (cpu_data_master_write),
      .cpu_data_master_writedata                     (cpu_data_master_writedata),
      .d1_pio_seg7_s1_end_xfer                       (d1_pio_seg7_s1_end_xfer),
      .pio_seg7_s1_address                           (pio_seg7_s1_address),
      .pio_seg7_s1_chipselect                        (pio_seg7_s1_chipselect),
      .pio_seg7_s1_readdata                          (pio_seg7_s1_readdata),
      .pio_seg7_s1_readdata_from_sa                  (pio_seg7_s1_readdata_from_sa),
      .pio_seg7_s1_reset_n                           (pio_seg7_s1_reset_n),
      .pio_seg7_s1_write_n                           (pio_seg7_s1_write_n),
      .pio_seg7_s1_writedata                         (pio_seg7_s1_writedata),
      .reset_n                                       (clk_0_reset_n)
    );

  pio_seg7 the_pio_seg7
    (
      .address    (pio_seg7_s1_address),
      .chipselect (pio_seg7_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_seg7),
      .readdata   (pio_seg7_s1_readdata),
      .reset_n    (pio_seg7_s1_reset_n),
      .write_n    (pio_seg7_s1_write_n),
      .writedata  (pio_seg7_s1_writedata)
    );

  pio_sw_s1_arbitrator the_pio_sw_s1
    (
      .clk                                         (clk_0),
      .cpu_data_master_address_to_slave            (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pio_sw_s1           (cpu_data_master_granted_pio_sw_s1),
      .cpu_data_master_latency_counter             (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_pio_sw_s1 (cpu_data_master_qualified_request_pio_sw_s1),
      .cpu_data_master_read                        (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pio_sw_s1   (cpu_data_master_read_data_valid_pio_sw_s1),
      .cpu_data_master_requests_pio_sw_s1          (cpu_data_master_requests_pio_sw_s1),
      .cpu_data_master_write                       (cpu_data_master_write),
      .d1_pio_sw_s1_end_xfer                       (d1_pio_sw_s1_end_xfer),
      .pio_sw_s1_address                           (pio_sw_s1_address),
      .pio_sw_s1_readdata                          (pio_sw_s1_readdata),
      .pio_sw_s1_readdata_from_sa                  (pio_sw_s1_readdata_from_sa),
      .pio_sw_s1_reset_n                           (pio_sw_s1_reset_n),
      .reset_n                                     (clk_0_reset_n)
    );

  pio_sw the_pio_sw
    (
      .address  (pio_sw_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_pio_sw),
      .readdata (pio_sw_s1_readdata),
      .reset_n  (pio_sw_s1_reset_n)
    );

  pll_pll_slave_arbitrator the_pll_pll_slave
    (
      .clk                                             (clk_0),
      .cpu_data_master_address_to_slave                (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_pll_pll_slave           (cpu_data_master_granted_pll_pll_slave),
      .cpu_data_master_latency_counter                 (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_pll_pll_slave (cpu_data_master_qualified_request_pll_pll_slave),
      .cpu_data_master_read                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pll_pll_slave   (cpu_data_master_read_data_valid_pll_pll_slave),
      .cpu_data_master_requests_pll_pll_slave          (cpu_data_master_requests_pll_pll_slave),
      .cpu_data_master_write                           (cpu_data_master_write),
      .cpu_data_master_writedata                       (cpu_data_master_writedata),
      .d1_pll_pll_slave_end_xfer                       (d1_pll_pll_slave_end_xfer),
      .pll_pll_slave_address                           (pll_pll_slave_address),
      .pll_pll_slave_read                              (pll_pll_slave_read),
      .pll_pll_slave_readdata                          (pll_pll_slave_readdata),
      .pll_pll_slave_readdata_from_sa                  (pll_pll_slave_readdata_from_sa),
      .pll_pll_slave_reset                             (pll_pll_slave_reset),
      .pll_pll_slave_write                             (pll_pll_slave_write),
      .pll_pll_slave_writedata                         (pll_pll_slave_writedata),
      .reset_n                                         (clk_0_reset_n)
    );

  //clk_pllc0 out_clk assignment, which is an e_assign
  assign clk_pllc0 = out_clk_pll_c0;

  //clk_pllc1 out_clk assignment, which is an e_assign
  assign clk_pllc1 = out_clk_pll_c1;

  pll the_pll
    (
      .address   (pll_pll_slave_address),
      .c0        (out_clk_pll_c0),
      .c1        (out_clk_pll_c1),
      .clk       (clk_0),
      .locked    (locked_from_the_pll),
      .phasedone (phasedone_from_the_pll),
      .read      (pll_pll_slave_read),
      .readdata  (pll_pll_slave_readdata),
      .reset     (pll_pll_slave_reset),
      .write     (pll_pll_slave_write),
      .writedata (pll_pll_slave_writedata)
    );

  ps2_0_avalon_ps2_slave_arbitrator the_ps2_0_avalon_ps2_slave
    (
      .clk                                                      (clk_0),
      .cpu_data_master_address_to_slave                         (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                               (cpu_data_master_byteenable),
      .cpu_data_master_granted_ps2_0_avalon_ps2_slave           (cpu_data_master_granted_ps2_0_avalon_ps2_slave),
      .cpu_data_master_latency_counter                          (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave (cpu_data_master_qualified_request_ps2_0_avalon_ps2_slave),
      .cpu_data_master_read                                     (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave   (cpu_data_master_read_data_valid_ps2_0_avalon_ps2_slave),
      .cpu_data_master_requests_ps2_0_avalon_ps2_slave          (cpu_data_master_requests_ps2_0_avalon_ps2_slave),
      .cpu_data_master_write                                    (cpu_data_master_write),
      .cpu_data_master_writedata                                (cpu_data_master_writedata),
      .d1_ps2_0_avalon_ps2_slave_end_xfer                       (d1_ps2_0_avalon_ps2_slave_end_xfer),
      .ps2_0_avalon_ps2_slave_address                           (ps2_0_avalon_ps2_slave_address),
      .ps2_0_avalon_ps2_slave_byteenable                        (ps2_0_avalon_ps2_slave_byteenable),
      .ps2_0_avalon_ps2_slave_chipselect                        (ps2_0_avalon_ps2_slave_chipselect),
      .ps2_0_avalon_ps2_slave_irq                               (ps2_0_avalon_ps2_slave_irq),
      .ps2_0_avalon_ps2_slave_irq_from_sa                       (ps2_0_avalon_ps2_slave_irq_from_sa),
      .ps2_0_avalon_ps2_slave_read                              (ps2_0_avalon_ps2_slave_read),
      .ps2_0_avalon_ps2_slave_readdata                          (ps2_0_avalon_ps2_slave_readdata),
      .ps2_0_avalon_ps2_slave_readdata_from_sa                  (ps2_0_avalon_ps2_slave_readdata_from_sa),
      .ps2_0_avalon_ps2_slave_reset                             (ps2_0_avalon_ps2_slave_reset),
      .ps2_0_avalon_ps2_slave_waitrequest                       (ps2_0_avalon_ps2_slave_waitrequest),
      .ps2_0_avalon_ps2_slave_waitrequest_from_sa               (ps2_0_avalon_ps2_slave_waitrequest_from_sa),
      .ps2_0_avalon_ps2_slave_write                             (ps2_0_avalon_ps2_slave_write),
      .ps2_0_avalon_ps2_slave_writedata                         (ps2_0_avalon_ps2_slave_writedata),
      .reset_n                                                  (clk_0_reset_n)
    );

  ps2_0 the_ps2_0
    (
      .PS2_CLK     (PS2_CLK_to_and_from_the_ps2_0),
      .PS2_DAT     (PS2_DAT_to_and_from_the_ps2_0),
      .address     (ps2_0_avalon_ps2_slave_address),
      .byteenable  (ps2_0_avalon_ps2_slave_byteenable),
      .chipselect  (ps2_0_avalon_ps2_slave_chipselect),
      .clk         (clk_0),
      .irq         (ps2_0_avalon_ps2_slave_irq),
      .read        (ps2_0_avalon_ps2_slave_read),
      .readdata    (ps2_0_avalon_ps2_slave_readdata),
      .reset       (ps2_0_avalon_ps2_slave_reset),
      .waitrequest (ps2_0_avalon_ps2_slave_waitrequest),
      .write       (ps2_0_avalon_ps2_slave_write),
      .writedata   (ps2_0_avalon_ps2_slave_writedata)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .RamAndFlash_sopc_clock_0_out_address_to_slave                        (RamAndFlash_sopc_clock_0_out_address_to_slave),
      .RamAndFlash_sopc_clock_0_out_byteenable                              (RamAndFlash_sopc_clock_0_out_byteenable),
      .RamAndFlash_sopc_clock_0_out_granted_sdram_s1                        (RamAndFlash_sopc_clock_0_out_granted_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1              (RamAndFlash_sopc_clock_0_out_qualified_request_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_read                                    (RamAndFlash_sopc_clock_0_out_read),
      .RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1                (RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register (RamAndFlash_sopc_clock_0_out_read_data_valid_sdram_s1_shift_register),
      .RamAndFlash_sopc_clock_0_out_requests_sdram_s1                       (RamAndFlash_sopc_clock_0_out_requests_sdram_s1),
      .RamAndFlash_sopc_clock_0_out_write                                   (RamAndFlash_sopc_clock_0_out_write),
      .RamAndFlash_sopc_clock_0_out_writedata                               (RamAndFlash_sopc_clock_0_out_writedata),
      .RamAndFlash_sopc_clock_1_out_address_to_slave                        (RamAndFlash_sopc_clock_1_out_address_to_slave),
      .RamAndFlash_sopc_clock_1_out_byteenable                              (RamAndFlash_sopc_clock_1_out_byteenable),
      .RamAndFlash_sopc_clock_1_out_granted_sdram_s1                        (RamAndFlash_sopc_clock_1_out_granted_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1              (RamAndFlash_sopc_clock_1_out_qualified_request_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_read                                    (RamAndFlash_sopc_clock_1_out_read),
      .RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1                (RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register (RamAndFlash_sopc_clock_1_out_read_data_valid_sdram_s1_shift_register),
      .RamAndFlash_sopc_clock_1_out_requests_sdram_s1                       (RamAndFlash_sopc_clock_1_out_requests_sdram_s1),
      .RamAndFlash_sopc_clock_1_out_write                                   (RamAndFlash_sopc_clock_1_out_write),
      .RamAndFlash_sopc_clock_1_out_writedata                               (RamAndFlash_sopc_clock_1_out_writedata),
      .clk                                                                  (clk_pllc0),
      .d1_sdram_s1_end_xfer                                                 (d1_sdram_s1_end_xfer),
      .reset_n                                                              (clk_pllc0_reset_n),
      .sdram_s1_address                                                     (sdram_s1_address),
      .sdram_s1_byteenable_n                                                (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                                  (sdram_s1_chipselect),
      .sdram_s1_read_n                                                      (sdram_s1_read_n),
      .sdram_s1_readdata                                                    (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                            (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                               (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                                     (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                                 (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                         (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                                     (sdram_s1_write_n),
      .sdram_s1_writedata                                                   (sdram_s1_writedata)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (clk_pllc0),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  spi0_spi_control_port_arbitrator the_spi0_spi_control_port
    (
      .clk                                                     (clk_0),
      .cpu_data_master_address_to_slave                        (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_spi0_spi_control_port           (cpu_data_master_granted_spi0_spi_control_port),
      .cpu_data_master_latency_counter                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_spi0_spi_control_port (cpu_data_master_qualified_request_spi0_spi_control_port),
      .cpu_data_master_read                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_spi0_spi_control_port   (cpu_data_master_read_data_valid_spi0_spi_control_port),
      .cpu_data_master_requests_spi0_spi_control_port          (cpu_data_master_requests_spi0_spi_control_port),
      .cpu_data_master_write                                   (cpu_data_master_write),
      .cpu_data_master_writedata                               (cpu_data_master_writedata),
      .d1_spi0_spi_control_port_end_xfer                       (d1_spi0_spi_control_port_end_xfer),
      .reset_n                                                 (clk_0_reset_n),
      .spi0_spi_control_port_address                           (spi0_spi_control_port_address),
      .spi0_spi_control_port_chipselect                        (spi0_spi_control_port_chipselect),
      .spi0_spi_control_port_dataavailable                     (spi0_spi_control_port_dataavailable),
      .spi0_spi_control_port_dataavailable_from_sa             (spi0_spi_control_port_dataavailable_from_sa),
      .spi0_spi_control_port_endofpacket                       (spi0_spi_control_port_endofpacket),
      .spi0_spi_control_port_endofpacket_from_sa               (spi0_spi_control_port_endofpacket_from_sa),
      .spi0_spi_control_port_irq                               (spi0_spi_control_port_irq),
      .spi0_spi_control_port_irq_from_sa                       (spi0_spi_control_port_irq_from_sa),
      .spi0_spi_control_port_read_n                            (spi0_spi_control_port_read_n),
      .spi0_spi_control_port_readdata                          (spi0_spi_control_port_readdata),
      .spi0_spi_control_port_readdata_from_sa                  (spi0_spi_control_port_readdata_from_sa),
      .spi0_spi_control_port_readyfordata                      (spi0_spi_control_port_readyfordata),
      .spi0_spi_control_port_readyfordata_from_sa              (spi0_spi_control_port_readyfordata_from_sa),
      .spi0_spi_control_port_reset_n                           (spi0_spi_control_port_reset_n),
      .spi0_spi_control_port_write_n                           (spi0_spi_control_port_write_n),
      .spi0_spi_control_port_writedata                         (spi0_spi_control_port_writedata)
    );

  spi0 the_spi0
    (
      .MISO          (MISO_to_the_spi0),
      .MOSI          (MOSI_from_the_spi0),
      .SCLK          (SCLK_from_the_spi0),
      .SS_n          (SS_n_from_the_spi0),
      .clk           (clk_0),
      .data_from_cpu (spi0_spi_control_port_writedata),
      .data_to_cpu   (spi0_spi_control_port_readdata),
      .dataavailable (spi0_spi_control_port_dataavailable),
      .endofpacket   (spi0_spi_control_port_endofpacket),
      .irq           (spi0_spi_control_port_irq),
      .mem_addr      (spi0_spi_control_port_address),
      .read_n        (spi0_spi_control_port_read_n),
      .readyfordata  (spi0_spi_control_port_readyfordata),
      .reset_n       (spi0_spi_control_port_reset_n),
      .spi_select    (spi0_spi_control_port_chipselect),
      .write_n       (spi0_spi_control_port_write_n)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                   (clk_0),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_latency_counter                       (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sysid_control_slave (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sysid_control_slave   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (clk_0_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timer_s1_arbitrator the_timer_s1
    (
      .clk                                        (clk_0),
      .cpu_data_master_address_to_slave           (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_timer_s1           (cpu_data_master_granted_timer_s1),
      .cpu_data_master_latency_counter            (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_timer_s1 (cpu_data_master_qualified_request_timer_s1),
      .cpu_data_master_read                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_timer_s1   (cpu_data_master_read_data_valid_timer_s1),
      .cpu_data_master_requests_timer_s1          (cpu_data_master_requests_timer_s1),
      .cpu_data_master_write                      (cpu_data_master_write),
      .cpu_data_master_writedata                  (cpu_data_master_writedata),
      .d1_timer_s1_end_xfer                       (d1_timer_s1_end_xfer),
      .reset_n                                    (clk_0_reset_n),
      .timer_s1_address                           (timer_s1_address),
      .timer_s1_chipselect                        (timer_s1_chipselect),
      .timer_s1_irq                               (timer_s1_irq),
      .timer_s1_irq_from_sa                       (timer_s1_irq_from_sa),
      .timer_s1_readdata                          (timer_s1_readdata),
      .timer_s1_readdata_from_sa                  (timer_s1_readdata_from_sa),
      .timer_s1_reset_n                           (timer_s1_reset_n),
      .timer_s1_write_n                           (timer_s1_write_n),
      .timer_s1_writedata                         (timer_s1_writedata)
    );

  timer the_timer
    (
      .address    (timer_s1_address),
      .chipselect (timer_s1_chipselect),
      .clk        (clk_0),
      .irq        (timer_s1_irq),
      .readdata   (timer_s1_readdata),
      .reset_n    (timer_s1_reset_n),
      .write_n    (timer_s1_write_n),
      .writedata  (timer_s1_writedata)
    );

  tri_state_bridge_avalon_slave_arbitrator the_tri_state_bridge_avalon_slave
    (
      .address_to_the_cfi_flash                                       (address_to_the_cfi_flash),
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                            (clk_0),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                        (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_cfi_flash_s1                           (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_latency_counter                                (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cfi_flash_s1                 (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                   (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_requests_cfi_flash_s1                          (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                    (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cfi_flash_s1          (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1            (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_requests_cfi_flash_s1                   (cpu_instruction_master_requests_cfi_flash_s1),
      .d1_tri_state_bridge_avalon_slave_end_xfer                      (d1_tri_state_bridge_avalon_slave_end_xfer),
      .data_to_and_from_the_cfi_flash                                 (data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash                        (incoming_data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .read_n_to_the_cfi_flash                                        (read_n_to_the_cfi_flash),
      .reset_n                                                        (clk_0_reset_n),
      .select_n_to_the_cfi_flash                                      (select_n_to_the_cfi_flash),
      .write_n_to_the_cfi_flash                                       (write_n_to_the_cfi_flash)
    );

  uart0_s1_arbitrator the_uart0_s1
    (
      .clk                                        (clk_0),
      .cpu_data_master_address_to_slave           (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_uart0_s1           (cpu_data_master_granted_uart0_s1),
      .cpu_data_master_latency_counter            (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_uart0_s1 (cpu_data_master_qualified_request_uart0_s1),
      .cpu_data_master_read                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_uart0_s1   (cpu_data_master_read_data_valid_uart0_s1),
      .cpu_data_master_requests_uart0_s1          (cpu_data_master_requests_uart0_s1),
      .cpu_data_master_write                      (cpu_data_master_write),
      .cpu_data_master_writedata                  (cpu_data_master_writedata),
      .d1_uart0_s1_end_xfer                       (d1_uart0_s1_end_xfer),
      .reset_n                                    (clk_0_reset_n),
      .uart0_s1_address                           (uart0_s1_address),
      .uart0_s1_begintransfer                     (uart0_s1_begintransfer),
      .uart0_s1_chipselect                        (uart0_s1_chipselect),
      .uart0_s1_dataavailable                     (uart0_s1_dataavailable),
      .uart0_s1_dataavailable_from_sa             (uart0_s1_dataavailable_from_sa),
      .uart0_s1_irq                               (uart0_s1_irq),
      .uart0_s1_irq_from_sa                       (uart0_s1_irq_from_sa),
      .uart0_s1_read_n                            (uart0_s1_read_n),
      .uart0_s1_readdata                          (uart0_s1_readdata),
      .uart0_s1_readdata_from_sa                  (uart0_s1_readdata_from_sa),
      .uart0_s1_readyfordata                      (uart0_s1_readyfordata),
      .uart0_s1_readyfordata_from_sa              (uart0_s1_readyfordata_from_sa),
      .uart0_s1_reset_n                           (uart0_s1_reset_n),
      .uart0_s1_write_n                           (uart0_s1_write_n),
      .uart0_s1_writedata                         (uart0_s1_writedata)
    );

  uart0 the_uart0
    (
      .address       (uart0_s1_address),
      .begintransfer (uart0_s1_begintransfer),
      .chipselect    (uart0_s1_chipselect),
      .clk           (clk_0),
      .dataavailable (uart0_s1_dataavailable),
      .irq           (uart0_s1_irq),
      .read_n        (uart0_s1_read_n),
      .readdata      (uart0_s1_readdata),
      .readyfordata  (uart0_s1_readyfordata),
      .reset_n       (uart0_s1_reset_n),
      .rxd           (rxd_to_the_uart0),
      .txd           (txd_from_the_uart0),
      .write_n       (uart0_s1_write_n),
      .writedata     (uart0_s1_writedata)
    );

  video_alpha_blender_avalon_background_sink_arbitrator the_video_alpha_blender_avalon_background_sink
    (
      .clk                                                      (clk_0),
      .reset_n                                                  (clk_0_reset_n),
      .video_alpha_blender_avalon_background_sink_data          (video_alpha_blender_avalon_background_sink_data),
      .video_alpha_blender_avalon_background_sink_endofpacket   (video_alpha_blender_avalon_background_sink_endofpacket),
      .video_alpha_blender_avalon_background_sink_ready         (video_alpha_blender_avalon_background_sink_ready),
      .video_alpha_blender_avalon_background_sink_ready_from_sa (video_alpha_blender_avalon_background_sink_ready_from_sa),
      .video_alpha_blender_avalon_background_sink_startofpacket (video_alpha_blender_avalon_background_sink_startofpacket),
      .video_alpha_blender_avalon_background_sink_valid         (video_alpha_blender_avalon_background_sink_valid),
      .video_scaler_avalon_scaler_source_data                   (video_scaler_avalon_scaler_source_data),
      .video_scaler_avalon_scaler_source_endofpacket            (video_scaler_avalon_scaler_source_endofpacket),
      .video_scaler_avalon_scaler_source_startofpacket          (video_scaler_avalon_scaler_source_startofpacket),
      .video_scaler_avalon_scaler_source_valid                  (video_scaler_avalon_scaler_source_valid)
    );

  video_alpha_blender_avalon_foreground_sink_arbitrator the_video_alpha_blender_avalon_foreground_sink
    (
      .clk                                                              (clk_0),
      .reset_n                                                          (clk_0_reset_n),
      .video_alpha_blender_avalon_foreground_sink_data                  (video_alpha_blender_avalon_foreground_sink_data),
      .video_alpha_blender_avalon_foreground_sink_endofpacket           (video_alpha_blender_avalon_foreground_sink_endofpacket),
      .video_alpha_blender_avalon_foreground_sink_ready                 (video_alpha_blender_avalon_foreground_sink_ready),
      .video_alpha_blender_avalon_foreground_sink_ready_from_sa         (video_alpha_blender_avalon_foreground_sink_ready_from_sa),
      .video_alpha_blender_avalon_foreground_sink_reset                 (video_alpha_blender_avalon_foreground_sink_reset),
      .video_alpha_blender_avalon_foreground_sink_startofpacket         (video_alpha_blender_avalon_foreground_sink_startofpacket),
      .video_alpha_blender_avalon_foreground_sink_valid                 (video_alpha_blender_avalon_foreground_sink_valid),
      .video_character_buffer_with_dma_avalon_char_source_data          (video_character_buffer_with_dma_avalon_char_source_data),
      .video_character_buffer_with_dma_avalon_char_source_endofpacket   (video_character_buffer_with_dma_avalon_char_source_endofpacket),
      .video_character_buffer_with_dma_avalon_char_source_startofpacket (video_character_buffer_with_dma_avalon_char_source_startofpacket),
      .video_character_buffer_with_dma_avalon_char_source_valid         (video_character_buffer_with_dma_avalon_char_source_valid)
    );

  video_alpha_blender_avalon_blended_source_arbitrator the_video_alpha_blender_avalon_blended_source
    (
      .clk                                                         (clk_0),
      .reset_n                                                     (clk_0_reset_n),
      .video_alpha_blender_avalon_blended_source_data              (video_alpha_blender_avalon_blended_source_data),
      .video_alpha_blender_avalon_blended_source_endofpacket       (video_alpha_blender_avalon_blended_source_endofpacket),
      .video_alpha_blender_avalon_blended_source_ready             (video_alpha_blender_avalon_blended_source_ready),
      .video_alpha_blender_avalon_blended_source_startofpacket     (video_alpha_blender_avalon_blended_source_startofpacket),
      .video_alpha_blender_avalon_blended_source_valid             (video_alpha_blender_avalon_blended_source_valid),
      .video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa (video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa)
    );

  video_alpha_blender the_video_alpha_blender
    (
      .background_data          (video_alpha_blender_avalon_background_sink_data),
      .background_endofpacket   (video_alpha_blender_avalon_background_sink_endofpacket),
      .background_ready         (video_alpha_blender_avalon_background_sink_ready),
      .background_startofpacket (video_alpha_blender_avalon_background_sink_startofpacket),
      .background_valid         (video_alpha_blender_avalon_background_sink_valid),
      .clk                      (clk_0),
      .foreground_data          (video_alpha_blender_avalon_foreground_sink_data),
      .foreground_endofpacket   (video_alpha_blender_avalon_foreground_sink_endofpacket),
      .foreground_ready         (video_alpha_blender_avalon_foreground_sink_ready),
      .foreground_startofpacket (video_alpha_blender_avalon_foreground_sink_startofpacket),
      .foreground_valid         (video_alpha_blender_avalon_foreground_sink_valid),
      .output_data              (video_alpha_blender_avalon_blended_source_data),
      .output_endofpacket       (video_alpha_blender_avalon_blended_source_endofpacket),
      .output_ready             (video_alpha_blender_avalon_blended_source_ready),
      .output_startofpacket     (video_alpha_blender_avalon_blended_source_startofpacket),
      .output_valid             (video_alpha_blender_avalon_blended_source_valid),
      .reset                    (video_alpha_blender_avalon_foreground_sink_reset)
    );

  video_character_buffer_with_dma_avalon_char_buffer_slave_arbitrator the_video_character_buffer_with_dma_avalon_char_buffer_slave
    (
      .clk                                                                                        (clk_0),
      .cpu_data_master_address_to_slave                                                           (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                                 (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave        (cpu_data_master_byteenable_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_dbs_address                                                                (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_8                                                                (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave           (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_latency_counter                                                            (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave (cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_read                                                                       (cpu_data_master_read),
      .cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave   (cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave          (cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_buffer_slave),
      .cpu_data_master_write                                                                      (cpu_data_master_write),
      .d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer                       (d1_video_character_buffer_with_dma_avalon_char_buffer_slave_end_xfer),
      .reset_n                                                                                    (clk_0_reset_n),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_address                           (video_character_buffer_with_dma_avalon_char_buffer_slave_address),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable                        (video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect                        (video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_read                              (video_character_buffer_with_dma_avalon_char_buffer_slave_read),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_readdata                          (video_character_buffer_with_dma_avalon_char_buffer_slave_readdata),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa                  (video_character_buffer_with_dma_avalon_char_buffer_slave_readdata_from_sa),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest                       (video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa               (video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest_from_sa),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_write                             (video_character_buffer_with_dma_avalon_char_buffer_slave_write),
      .video_character_buffer_with_dma_avalon_char_buffer_slave_writedata                         (video_character_buffer_with_dma_avalon_char_buffer_slave_writedata)
    );

  video_character_buffer_with_dma_avalon_char_control_slave_arbitrator the_video_character_buffer_with_dma_avalon_char_control_slave
    (
      .clk                                                                                         (clk_0),
      .cpu_data_master_address_to_slave                                                            (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                                  (cpu_data_master_byteenable),
      .cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave           (cpu_data_master_granted_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_latency_counter                                                             (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave (cpu_data_master_qualified_request_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_read                                                                        (cpu_data_master_read),
      .cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave   (cpu_data_master_read_data_valid_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave          (cpu_data_master_requests_video_character_buffer_with_dma_avalon_char_control_slave),
      .cpu_data_master_write                                                                       (cpu_data_master_write),
      .cpu_data_master_writedata                                                                   (cpu_data_master_writedata),
      .d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer                       (d1_video_character_buffer_with_dma_avalon_char_control_slave_end_xfer),
      .reset_n                                                                                     (clk_0_reset_n),
      .video_character_buffer_with_dma_avalon_char_control_slave_address                           (video_character_buffer_with_dma_avalon_char_control_slave_address),
      .video_character_buffer_with_dma_avalon_char_control_slave_byteenable                        (video_character_buffer_with_dma_avalon_char_control_slave_byteenable),
      .video_character_buffer_with_dma_avalon_char_control_slave_chipselect                        (video_character_buffer_with_dma_avalon_char_control_slave_chipselect),
      .video_character_buffer_with_dma_avalon_char_control_slave_read                              (video_character_buffer_with_dma_avalon_char_control_slave_read),
      .video_character_buffer_with_dma_avalon_char_control_slave_readdata                          (video_character_buffer_with_dma_avalon_char_control_slave_readdata),
      .video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa                  (video_character_buffer_with_dma_avalon_char_control_slave_readdata_from_sa),
      .video_character_buffer_with_dma_avalon_char_control_slave_reset                             (video_character_buffer_with_dma_avalon_char_control_slave_reset),
      .video_character_buffer_with_dma_avalon_char_control_slave_write                             (video_character_buffer_with_dma_avalon_char_control_slave_write),
      .video_character_buffer_with_dma_avalon_char_control_slave_writedata                         (video_character_buffer_with_dma_avalon_char_control_slave_writedata)
    );

  video_character_buffer_with_dma_avalon_char_source_arbitrator the_video_character_buffer_with_dma_avalon_char_source
    (
      .clk                                                              (clk_0),
      .reset_n                                                          (clk_0_reset_n),
      .video_alpha_blender_avalon_foreground_sink_ready_from_sa         (video_alpha_blender_avalon_foreground_sink_ready_from_sa),
      .video_character_buffer_with_dma_avalon_char_source_data          (video_character_buffer_with_dma_avalon_char_source_data),
      .video_character_buffer_with_dma_avalon_char_source_endofpacket   (video_character_buffer_with_dma_avalon_char_source_endofpacket),
      .video_character_buffer_with_dma_avalon_char_source_ready         (video_character_buffer_with_dma_avalon_char_source_ready),
      .video_character_buffer_with_dma_avalon_char_source_startofpacket (video_character_buffer_with_dma_avalon_char_source_startofpacket),
      .video_character_buffer_with_dma_avalon_char_source_valid         (video_character_buffer_with_dma_avalon_char_source_valid)
    );

  video_character_buffer_with_dma the_video_character_buffer_with_dma
    (
      .buf_address          (video_character_buffer_with_dma_avalon_char_buffer_slave_address),
      .buf_byteenable       (video_character_buffer_with_dma_avalon_char_buffer_slave_byteenable),
      .buf_chipselect       (video_character_buffer_with_dma_avalon_char_buffer_slave_chipselect),
      .buf_read             (video_character_buffer_with_dma_avalon_char_buffer_slave_read),
      .buf_readdata         (video_character_buffer_with_dma_avalon_char_buffer_slave_readdata),
      .buf_waitrequest      (video_character_buffer_with_dma_avalon_char_buffer_slave_waitrequest),
      .buf_write            (video_character_buffer_with_dma_avalon_char_buffer_slave_write),
      .buf_writedata        (video_character_buffer_with_dma_avalon_char_buffer_slave_writedata),
      .clk                  (clk_0),
      .ctrl_address         (video_character_buffer_with_dma_avalon_char_control_slave_address),
      .ctrl_byteenable      (video_character_buffer_with_dma_avalon_char_control_slave_byteenable),
      .ctrl_chipselect      (video_character_buffer_with_dma_avalon_char_control_slave_chipselect),
      .ctrl_read            (video_character_buffer_with_dma_avalon_char_control_slave_read),
      .ctrl_readdata        (video_character_buffer_with_dma_avalon_char_control_slave_readdata),
      .ctrl_write           (video_character_buffer_with_dma_avalon_char_control_slave_write),
      .ctrl_writedata       (video_character_buffer_with_dma_avalon_char_control_slave_writedata),
      .reset                (video_character_buffer_with_dma_avalon_char_control_slave_reset),
      .stream_data          (video_character_buffer_with_dma_avalon_char_source_data),
      .stream_endofpacket   (video_character_buffer_with_dma_avalon_char_source_endofpacket),
      .stream_ready         (video_character_buffer_with_dma_avalon_char_source_ready),
      .stream_startofpacket (video_character_buffer_with_dma_avalon_char_source_startofpacket),
      .stream_valid         (video_character_buffer_with_dma_avalon_char_source_valid)
    );

  video_dual_clock_buffer_avalon_dc_buffer_sink_arbitrator the_video_dual_clock_buffer_avalon_dc_buffer_sink
    (
      .clk                                                         (clk_0),
      .reset_n                                                     (clk_0_reset_n),
      .video_alpha_blender_avalon_blended_source_data              (video_alpha_blender_avalon_blended_source_data),
      .video_alpha_blender_avalon_blended_source_endofpacket       (video_alpha_blender_avalon_blended_source_endofpacket),
      .video_alpha_blender_avalon_blended_source_startofpacket     (video_alpha_blender_avalon_blended_source_startofpacket),
      .video_alpha_blender_avalon_blended_source_valid             (video_alpha_blender_avalon_blended_source_valid),
      .video_dual_clock_buffer_avalon_dc_buffer_sink_data          (video_dual_clock_buffer_avalon_dc_buffer_sink_data),
      .video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket   (video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket),
      .video_dual_clock_buffer_avalon_dc_buffer_sink_ready         (video_dual_clock_buffer_avalon_dc_buffer_sink_ready),
      .video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa (video_dual_clock_buffer_avalon_dc_buffer_sink_ready_from_sa),
      .video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket (video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket),
      .video_dual_clock_buffer_avalon_dc_buffer_sink_valid         (video_dual_clock_buffer_avalon_dc_buffer_sink_valid)
    );

  video_dual_clock_buffer_avalon_dc_buffer_source_arbitrator the_video_dual_clock_buffer_avalon_dc_buffer_source
    (
      .clk                                                           (clk_pllc1),
      .reset_n                                                       (clk_pllc1_reset_n),
      .video_dual_clock_buffer_avalon_dc_buffer_source_data          (video_dual_clock_buffer_avalon_dc_buffer_source_data),
      .video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket   (video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket),
      .video_dual_clock_buffer_avalon_dc_buffer_source_ready         (video_dual_clock_buffer_avalon_dc_buffer_source_ready),
      .video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket (video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket),
      .video_dual_clock_buffer_avalon_dc_buffer_source_valid         (video_dual_clock_buffer_avalon_dc_buffer_source_valid),
      .video_vga_controller_avalon_vga_sink_ready_from_sa            (video_vga_controller_avalon_vga_sink_ready_from_sa)
    );

  video_dual_clock_buffer the_video_dual_clock_buffer
    (
      .clk_stream_in            (clk_0),
      .clk_stream_out           (clk_pllc1),
      .stream_in_data           (video_dual_clock_buffer_avalon_dc_buffer_sink_data),
      .stream_in_endofpacket    (video_dual_clock_buffer_avalon_dc_buffer_sink_endofpacket),
      .stream_in_ready          (video_dual_clock_buffer_avalon_dc_buffer_sink_ready),
      .stream_in_startofpacket  (video_dual_clock_buffer_avalon_dc_buffer_sink_startofpacket),
      .stream_in_valid          (video_dual_clock_buffer_avalon_dc_buffer_sink_valid),
      .stream_out_data          (video_dual_clock_buffer_avalon_dc_buffer_source_data),
      .stream_out_endofpacket   (video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket),
      .stream_out_ready         (video_dual_clock_buffer_avalon_dc_buffer_source_ready),
      .stream_out_startofpacket (video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket),
      .stream_out_valid         (video_dual_clock_buffer_avalon_dc_buffer_source_valid)
    );

  video_pixel_buffer_dma_avalon_control_slave_arbitrator the_video_pixel_buffer_dma_avalon_control_slave
    (
      .clk                                                                           (clk_0),
      .cpu_data_master_address_to_slave                                              (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                    (cpu_data_master_byteenable),
      .cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave           (cpu_data_master_granted_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_latency_counter                                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave (cpu_data_master_qualified_request_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_read                                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave   (cpu_data_master_read_data_valid_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave          (cpu_data_master_requests_video_pixel_buffer_dma_avalon_control_slave),
      .cpu_data_master_write                                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                                     (cpu_data_master_writedata),
      .d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer                       (d1_video_pixel_buffer_dma_avalon_control_slave_end_xfer),
      .reset_n                                                                       (clk_0_reset_n),
      .video_pixel_buffer_dma_avalon_control_slave_address                           (video_pixel_buffer_dma_avalon_control_slave_address),
      .video_pixel_buffer_dma_avalon_control_slave_byteenable                        (video_pixel_buffer_dma_avalon_control_slave_byteenable),
      .video_pixel_buffer_dma_avalon_control_slave_read                              (video_pixel_buffer_dma_avalon_control_slave_read),
      .video_pixel_buffer_dma_avalon_control_slave_readdata                          (video_pixel_buffer_dma_avalon_control_slave_readdata),
      .video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa                  (video_pixel_buffer_dma_avalon_control_slave_readdata_from_sa),
      .video_pixel_buffer_dma_avalon_control_slave_write                             (video_pixel_buffer_dma_avalon_control_slave_write),
      .video_pixel_buffer_dma_avalon_control_slave_writedata                         (video_pixel_buffer_dma_avalon_control_slave_writedata)
    );

  video_pixel_buffer_dma_avalon_pixel_dma_master_arbitrator the_video_pixel_buffer_dma_avalon_pixel_dma_master
    (
      .clk                                                                               (clk_0),
      .d1_onchip_memory_s2_end_xfer                                                      (d1_onchip_memory_s2_end_xfer),
      .onchip_memory_s2_readdata_from_sa                                                 (onchip_memory_s2_readdata_from_sa),
      .reset_n                                                                           (clk_0_reset_n),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_address                            (video_pixel_buffer_dma_avalon_pixel_dma_master_address),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave                   (video_pixel_buffer_dma_avalon_pixel_dma_master_address_to_slave),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2           (video_pixel_buffer_dma_avalon_pixel_dma_master_granted_onchip_memory_s2),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter                    (video_pixel_buffer_dma_avalon_pixel_dma_master_latency_counter),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2 (video_pixel_buffer_dma_avalon_pixel_dma_master_qualified_request_onchip_memory_s2),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_read                               (video_pixel_buffer_dma_avalon_pixel_dma_master_read),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2   (video_pixel_buffer_dma_avalon_pixel_dma_master_read_data_valid_onchip_memory_s2),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_readdata                           (video_pixel_buffer_dma_avalon_pixel_dma_master_readdata),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid                      (video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2          (video_pixel_buffer_dma_avalon_pixel_dma_master_requests_onchip_memory_s2),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_reset                              (video_pixel_buffer_dma_avalon_pixel_dma_master_reset),
      .video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest                        (video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest)
    );

  video_pixel_buffer_dma_avalon_pixel_source_arbitrator the_video_pixel_buffer_dma_avalon_pixel_source
    (
      .clk                                                      (clk_0),
      .reset_n                                                  (clk_0_reset_n),
      .video_pixel_buffer_dma_avalon_pixel_source_data          (video_pixel_buffer_dma_avalon_pixel_source_data),
      .video_pixel_buffer_dma_avalon_pixel_source_endofpacket   (video_pixel_buffer_dma_avalon_pixel_source_endofpacket),
      .video_pixel_buffer_dma_avalon_pixel_source_ready         (video_pixel_buffer_dma_avalon_pixel_source_ready),
      .video_pixel_buffer_dma_avalon_pixel_source_startofpacket (video_pixel_buffer_dma_avalon_pixel_source_startofpacket),
      .video_pixel_buffer_dma_avalon_pixel_source_valid         (video_pixel_buffer_dma_avalon_pixel_source_valid),
      .video_rgb_resampler_avalon_rgb_sink_ready_from_sa        (video_rgb_resampler_avalon_rgb_sink_ready_from_sa)
    );

  video_pixel_buffer_dma the_video_pixel_buffer_dma
    (
      .clk                  (clk_0),
      .master_address       (video_pixel_buffer_dma_avalon_pixel_dma_master_address),
      .master_arbiterlock   (video_pixel_buffer_dma_avalon_pixel_dma_master_arbiterlock),
      .master_read          (video_pixel_buffer_dma_avalon_pixel_dma_master_read),
      .master_readdata      (video_pixel_buffer_dma_avalon_pixel_dma_master_readdata),
      .master_readdatavalid (video_pixel_buffer_dma_avalon_pixel_dma_master_readdatavalid),
      .master_waitrequest   (video_pixel_buffer_dma_avalon_pixel_dma_master_waitrequest),
      .reset                (video_pixel_buffer_dma_avalon_pixel_dma_master_reset),
      .slave_address        (video_pixel_buffer_dma_avalon_control_slave_address),
      .slave_byteenable     (video_pixel_buffer_dma_avalon_control_slave_byteenable),
      .slave_read           (video_pixel_buffer_dma_avalon_control_slave_read),
      .slave_readdata       (video_pixel_buffer_dma_avalon_control_slave_readdata),
      .slave_write          (video_pixel_buffer_dma_avalon_control_slave_write),
      .slave_writedata      (video_pixel_buffer_dma_avalon_control_slave_writedata),
      .stream_data          (video_pixel_buffer_dma_avalon_pixel_source_data),
      .stream_endofpacket   (video_pixel_buffer_dma_avalon_pixel_source_endofpacket),
      .stream_ready         (video_pixel_buffer_dma_avalon_pixel_source_ready),
      .stream_startofpacket (video_pixel_buffer_dma_avalon_pixel_source_startofpacket),
      .stream_valid         (video_pixel_buffer_dma_avalon_pixel_source_valid)
    );

  video_rgb_resampler_avalon_rgb_sink_arbitrator the_video_rgb_resampler_avalon_rgb_sink
    (
      .clk                                                      (clk_0),
      .reset_n                                                  (clk_0_reset_n),
      .video_pixel_buffer_dma_avalon_pixel_source_data          (video_pixel_buffer_dma_avalon_pixel_source_data),
      .video_pixel_buffer_dma_avalon_pixel_source_endofpacket   (video_pixel_buffer_dma_avalon_pixel_source_endofpacket),
      .video_pixel_buffer_dma_avalon_pixel_source_startofpacket (video_pixel_buffer_dma_avalon_pixel_source_startofpacket),
      .video_pixel_buffer_dma_avalon_pixel_source_valid         (video_pixel_buffer_dma_avalon_pixel_source_valid),
      .video_rgb_resampler_avalon_rgb_sink_data                 (video_rgb_resampler_avalon_rgb_sink_data),
      .video_rgb_resampler_avalon_rgb_sink_endofpacket          (video_rgb_resampler_avalon_rgb_sink_endofpacket),
      .video_rgb_resampler_avalon_rgb_sink_ready                (video_rgb_resampler_avalon_rgb_sink_ready),
      .video_rgb_resampler_avalon_rgb_sink_ready_from_sa        (video_rgb_resampler_avalon_rgb_sink_ready_from_sa),
      .video_rgb_resampler_avalon_rgb_sink_reset                (video_rgb_resampler_avalon_rgb_sink_reset),
      .video_rgb_resampler_avalon_rgb_sink_startofpacket        (video_rgb_resampler_avalon_rgb_sink_startofpacket),
      .video_rgb_resampler_avalon_rgb_sink_valid                (video_rgb_resampler_avalon_rgb_sink_valid)
    );

  video_rgb_resampler_avalon_rgb_source_arbitrator the_video_rgb_resampler_avalon_rgb_source
    (
      .clk                                                 (clk_0),
      .reset_n                                             (clk_0_reset_n),
      .video_rgb_resampler_avalon_rgb_source_data          (video_rgb_resampler_avalon_rgb_source_data),
      .video_rgb_resampler_avalon_rgb_source_endofpacket   (video_rgb_resampler_avalon_rgb_source_endofpacket),
      .video_rgb_resampler_avalon_rgb_source_ready         (video_rgb_resampler_avalon_rgb_source_ready),
      .video_rgb_resampler_avalon_rgb_source_startofpacket (video_rgb_resampler_avalon_rgb_source_startofpacket),
      .video_rgb_resampler_avalon_rgb_source_valid         (video_rgb_resampler_avalon_rgb_source_valid),
      .video_scaler_avalon_scaler_sink_ready_from_sa       (video_scaler_avalon_scaler_sink_ready_from_sa)
    );

  video_rgb_resampler the_video_rgb_resampler
    (
      .clk                      (clk_0),
      .reset                    (video_rgb_resampler_avalon_rgb_sink_reset),
      .stream_in_data           (video_rgb_resampler_avalon_rgb_sink_data),
      .stream_in_endofpacket    (video_rgb_resampler_avalon_rgb_sink_endofpacket),
      .stream_in_ready          (video_rgb_resampler_avalon_rgb_sink_ready),
      .stream_in_startofpacket  (video_rgb_resampler_avalon_rgb_sink_startofpacket),
      .stream_in_valid          (video_rgb_resampler_avalon_rgb_sink_valid),
      .stream_out_data          (video_rgb_resampler_avalon_rgb_source_data),
      .stream_out_endofpacket   (video_rgb_resampler_avalon_rgb_source_endofpacket),
      .stream_out_ready         (video_rgb_resampler_avalon_rgb_source_ready),
      .stream_out_startofpacket (video_rgb_resampler_avalon_rgb_source_startofpacket),
      .stream_out_valid         (video_rgb_resampler_avalon_rgb_source_valid)
    );

  video_scaler_avalon_scaler_sink_arbitrator the_video_scaler_avalon_scaler_sink
    (
      .clk                                                 (clk_0),
      .reset_n                                             (clk_0_reset_n),
      .video_rgb_resampler_avalon_rgb_source_data          (video_rgb_resampler_avalon_rgb_source_data),
      .video_rgb_resampler_avalon_rgb_source_endofpacket   (video_rgb_resampler_avalon_rgb_source_endofpacket),
      .video_rgb_resampler_avalon_rgb_source_startofpacket (video_rgb_resampler_avalon_rgb_source_startofpacket),
      .video_rgb_resampler_avalon_rgb_source_valid         (video_rgb_resampler_avalon_rgb_source_valid),
      .video_scaler_avalon_scaler_sink_data                (video_scaler_avalon_scaler_sink_data),
      .video_scaler_avalon_scaler_sink_endofpacket         (video_scaler_avalon_scaler_sink_endofpacket),
      .video_scaler_avalon_scaler_sink_ready               (video_scaler_avalon_scaler_sink_ready),
      .video_scaler_avalon_scaler_sink_ready_from_sa       (video_scaler_avalon_scaler_sink_ready_from_sa),
      .video_scaler_avalon_scaler_sink_reset               (video_scaler_avalon_scaler_sink_reset),
      .video_scaler_avalon_scaler_sink_startofpacket       (video_scaler_avalon_scaler_sink_startofpacket),
      .video_scaler_avalon_scaler_sink_valid               (video_scaler_avalon_scaler_sink_valid)
    );

  video_scaler_avalon_scaler_source_arbitrator the_video_scaler_avalon_scaler_source
    (
      .clk                                                      (clk_0),
      .reset_n                                                  (clk_0_reset_n),
      .video_alpha_blender_avalon_background_sink_ready_from_sa (video_alpha_blender_avalon_background_sink_ready_from_sa),
      .video_scaler_avalon_scaler_source_data                   (video_scaler_avalon_scaler_source_data),
      .video_scaler_avalon_scaler_source_endofpacket            (video_scaler_avalon_scaler_source_endofpacket),
      .video_scaler_avalon_scaler_source_ready                  (video_scaler_avalon_scaler_source_ready),
      .video_scaler_avalon_scaler_source_startofpacket          (video_scaler_avalon_scaler_source_startofpacket),
      .video_scaler_avalon_scaler_source_valid                  (video_scaler_avalon_scaler_source_valid)
    );

  video_scaler the_video_scaler
    (
      .clk                      (clk_0),
      .reset                    (video_scaler_avalon_scaler_sink_reset),
      .stream_in_data           (video_scaler_avalon_scaler_sink_data),
      .stream_in_endofpacket    (video_scaler_avalon_scaler_sink_endofpacket),
      .stream_in_ready          (video_scaler_avalon_scaler_sink_ready),
      .stream_in_startofpacket  (video_scaler_avalon_scaler_sink_startofpacket),
      .stream_in_valid          (video_scaler_avalon_scaler_sink_valid),
      .stream_out_data          (video_scaler_avalon_scaler_source_data),
      .stream_out_endofpacket   (video_scaler_avalon_scaler_source_endofpacket),
      .stream_out_ready         (video_scaler_avalon_scaler_source_ready),
      .stream_out_startofpacket (video_scaler_avalon_scaler_source_startofpacket),
      .stream_out_valid         (video_scaler_avalon_scaler_source_valid)
    );

  video_vga_controller_avalon_vga_sink_arbitrator the_video_vga_controller_avalon_vga_sink
    (
      .clk                                                           (clk_pllc1),
      .reset_n                                                       (clk_pllc1_reset_n),
      .video_dual_clock_buffer_avalon_dc_buffer_source_data          (video_dual_clock_buffer_avalon_dc_buffer_source_data),
      .video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket   (video_dual_clock_buffer_avalon_dc_buffer_source_endofpacket),
      .video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket (video_dual_clock_buffer_avalon_dc_buffer_source_startofpacket),
      .video_dual_clock_buffer_avalon_dc_buffer_source_valid         (video_dual_clock_buffer_avalon_dc_buffer_source_valid),
      .video_vga_controller_avalon_vga_sink_data                     (video_vga_controller_avalon_vga_sink_data),
      .video_vga_controller_avalon_vga_sink_endofpacket              (video_vga_controller_avalon_vga_sink_endofpacket),
      .video_vga_controller_avalon_vga_sink_ready                    (video_vga_controller_avalon_vga_sink_ready),
      .video_vga_controller_avalon_vga_sink_ready_from_sa            (video_vga_controller_avalon_vga_sink_ready_from_sa),
      .video_vga_controller_avalon_vga_sink_reset                    (video_vga_controller_avalon_vga_sink_reset),
      .video_vga_controller_avalon_vga_sink_startofpacket            (video_vga_controller_avalon_vga_sink_startofpacket),
      .video_vga_controller_avalon_vga_sink_valid                    (video_vga_controller_avalon_vga_sink_valid)
    );

  video_vga_controller the_video_vga_controller
    (
      .VGA_B         (VGA_B_from_the_video_vga_controller),
      .VGA_CLK       (VGA_CLK_from_the_video_vga_controller),
      .VGA_G         (VGA_G_from_the_video_vga_controller),
      .VGA_HS        (VGA_HS_from_the_video_vga_controller),
      .VGA_R         (VGA_R_from_the_video_vga_controller),
      .VGA_VS        (VGA_VS_from_the_video_vga_controller),
      .clk           (clk_pllc1),
      .data          (video_vga_controller_avalon_vga_sink_data),
      .endofpacket   (video_vga_controller_avalon_vga_sink_endofpacket),
      .ready         (video_vga_controller_avalon_vga_sink_ready),
      .reset         (video_vga_controller_avalon_vga_sink_reset),
      .startofpacket (video_vga_controller_avalon_vga_sink_startofpacket),
      .valid         (video_vga_controller_avalon_vga_sink_valid)
    );

  //reset is asserted asynchronously and deasserted synchronously
  RamAndFlash_sopc_reset_clk_0_domain_synch_module RamAndFlash_sopc_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0 |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  RamAndFlash_sopc_reset_clk_pllc0_domain_synch_module RamAndFlash_sopc_reset_clk_pllc0_domain_synch
    (
      .clk      (clk_pllc0),
      .data_in  (1'b1),
      .data_out (clk_pllc0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  RamAndFlash_sopc_reset_clk_pllc1_domain_synch_module RamAndFlash_sopc_reset_clk_pllc1_domain_synch
    (
      .clk      (clk_pllc1),
      .data_in  (1'b1),
      .data_out (clk_pllc1_reset_n),
      .reset_n  (reset_n_sources)
    );

  //RamAndFlash_sopc_clock_0_in_writedata of type writedata does not connect to anything so wire it to default (0)
  assign RamAndFlash_sopc_clock_0_in_writedata = 0;

  //RamAndFlash_sopc_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign RamAndFlash_sopc_clock_0_out_endofpacket = 0;

  //RamAndFlash_sopc_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign RamAndFlash_sopc_clock_1_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane1_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [ 15: 0] data;
  input   [ 20: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_lane0, which is an e_ram
  cfi_flash_lane0_module cfi_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //cfi_flash_lane1, which is an e_ram
  cfi_flash_lane1_module cfi_flash_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.1/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/sgate.v"
`include "pll.vo"
`include "video_alpha_blender.v"
`include "ps2_0.v"
`include "video_character_buffer_with_dma.v"
`include "video_rgb_resampler.v"
`include "video_pixel_buffer_dma.v"
`include "video_dual_clock_buffer.v"
`include "video_scaler.v"
`include "video_vga_controller.v"
`include "sdram.v"
`include "sysid.v"
`include "timer.v"
`include "RamAndFlash_sopc_clock_0.v"
`include "spi0.v"
`include "pio_seg7.v"
`include "pio_led.v"
`include "jtag_uart.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "onchip_memory.v"
`include "pio_sw.v"
`include "RamAndFlash_sopc_clock_1.v"
`include "mmc_spi.v"
`include "uart0.v"
`include "pio_btn0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             MISO_to_the_mmc_spi;
  wire             MISO_to_the_spi0;
  wire             MOSI_from_the_mmc_spi;
  wire             MOSI_from_the_spi0;
  wire             PS2_CLK_to_and_from_the_ps2_0;
  wire             PS2_DAT_to_and_from_the_ps2_0;
  wire             RamAndFlash_sopc_clock_0_in_endofpacket_from_sa;
  wire    [ 15: 0] RamAndFlash_sopc_clock_0_in_writedata;
  wire             RamAndFlash_sopc_clock_0_out_endofpacket;
  wire    [ 21: 0] RamAndFlash_sopc_clock_0_out_nativeaddress;
  wire             RamAndFlash_sopc_clock_1_in_endofpacket_from_sa;
  wire             RamAndFlash_sopc_clock_1_out_endofpacket;
  wire    [ 21: 0] RamAndFlash_sopc_clock_1_out_nativeaddress;
  wire             SCLK_from_the_mmc_spi;
  wire             SCLK_from_the_spi0;
  wire             SS_n_from_the_mmc_spi;
  wire             SS_n_from_the_spi0;
  wire    [  3: 0] VGA_B_from_the_video_vga_controller;
  wire             VGA_CLK_from_the_video_vga_controller;
  wire    [  3: 0] VGA_G_from_the_video_vga_controller;
  wire             VGA_HS_from_the_video_vga_controller;
  wire    [  3: 0] VGA_R_from_the_video_vga_controller;
  wire             VGA_VS_from_the_video_vga_controller;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire             clk;
  reg              clk_0;
  wire             clk_pllc0;
  wire             clk_pllc1;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  wire    [  2: 0] in_port_to_the_pio_btn0;
  wire    [  9: 0] in_port_to_the_pio_sw;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             locked_from_the_pll;
  wire             mmc_spi_spi_control_port_dataavailable_from_sa;
  wire             mmc_spi_spi_control_port_endofpacket_from_sa;
  wire             mmc_spi_spi_control_port_readyfordata_from_sa;
  wire    [ 10: 0] out_port_from_the_pio_led;
  wire    [ 31: 0] out_port_from_the_pio_seg7;
  wire             phasedone_from_the_pll;
  wire             read_n_to_the_cfi_flash;
  reg              reset_n;
  wire             rxd_to_the_uart0;
  wire             select_n_to_the_cfi_flash;
  wire             spi0_spi_control_port_dataavailable_from_sa;
  wire             spi0_spi_control_port_endofpacket_from_sa;
  wire             spi0_spi_control_port_readyfordata_from_sa;
  wire             sysid_control_slave_clock;
  wire             txd_from_the_uart0;
  wire             uart0_s1_dataavailable_from_sa;
  wire             uart0_s1_readyfordata_from_sa;
  wire             video_pixel_buffer_dma_avalon_pixel_dma_master_arbiterlock;
  wire             write_n_to_the_cfi_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  RamAndFlash_sopc DUT
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

  cfi_flash the_cfi_flash
    (
      .address  (address_to_the_cfi_flash[21 : 1]),
      .data     (data_to_and_from_the_cfi_flash),
      .read_n   (read_n_to_the_cfi_flash),
      .select_n (select_n_to_the_cfi_flash),
      .write_n  (write_n_to_the_cfi_flash)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on