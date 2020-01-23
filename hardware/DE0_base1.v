module DE0_base1(
	CLOCK_50,
);

	input CLOCK_50;
	
DE0_base1_sopc DE0_base1_sopc_inst(
	.clk_0(CLOCK_50),
	.reset_n(1'b1)
);
endmodule
