// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus II 64-Bit"
// VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

// DATE "03/13/2021 16:58:16"

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module pll (
	areset,
	inclk0,
	c0,
	locked)/* synthesis synthesis_greybox=0 */;
input 	areset;
input 	inclk0;
output 	c0;
output 	locked;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \altpll_component|_locked ;
wire \altpll_component|_clk0 ;


pll_altpll_1 altpll_component(
	.locked(\altpll_component|_locked ),
	._clk0(\altpll_component|_clk0 ),
	.areset(areset),
	.inclk({gnd,inclk0}));

assign c0 = \altpll_component|_clk0 ;

assign locked = \altpll_component|_locked ;

endmodule

module pll_altpll_1 (
	locked,
	_clk0,
	areset,
	inclk)/* synthesis synthesis_greybox=0 */;
output 	locked;
output 	_clk0;
input 	areset;
input 	[1:0] inclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \pll~CLK1 ;
wire \pll~CLK2 ;

wire [2:0] pll_CLK_bus;

assign _clk0 = pll_CLK_bus[0];
assign \pll~CLK1  = pll_CLK_bus[1];
assign \pll~CLK2  = pll_CLK_bus[2];

cycloneii_pll pll(
	.ena(vcc),
	.clkswitch(gnd),
	.areset(areset),
	.pfdena(vcc),
	.testclearlock(gnd),
	.sbdin(gnd),
	.inclk({gnd,inclk[0]}),
	.locked(locked),
	.testupout(),
	.testdownout(),
	.sbdout(),
	.clk(pll_CLK_bus));
defparam pll.bandwidth = 0;
defparam pll.bandwidth_type = "auto";
defparam pll.c0_high = 16;
defparam pll.c0_initial = 1;
defparam pll.c0_low = 16;
defparam pll.c0_mode = "even";
defparam pll.c0_ph = 0;
defparam pll.c1_mode = "bypass";
defparam pll.c1_ph = 0;
defparam pll.c2_mode = "bypass";
defparam pll.c2_ph = 0;
defparam pll.clk0_counter = "c0";
defparam pll.clk0_divide_by = 2;
defparam pll.clk0_duty_cycle = 50;
defparam pll.clk0_multiply_by = 1;
defparam pll.clk0_phase_shift = "0";
defparam pll.clk1_divide_by = 1;
defparam pll.clk1_duty_cycle = 50;
defparam pll.clk1_multiply_by = 1;
defparam pll.clk1_phase_shift = "0";
defparam pll.clk2_divide_by = 1;
defparam pll.clk2_duty_cycle = 50;
defparam pll.clk2_multiply_by = 1;
defparam pll.clk2_phase_shift = "0";
defparam pll.compensate_clock = "clk0";
defparam pll.gate_lock_counter = 0;
defparam pll.gate_lock_signal = "no";
defparam pll.inclk0_input_frequency = 20000;
defparam pll.inclk1_input_frequency = 20000;
defparam pll.invalid_lock_multiplier = 5;
defparam pll.m = 16;
defparam pll.m_initial = 1;
defparam pll.m_ph = 0;
defparam pll.n = 1;
defparam pll.operation_mode = "normal";
defparam pll.self_reset_on_gated_loss_lock = "off";
defparam pll.sim_gate_lock_device_behavior = "off";
defparam pll.simulation_type = "timing";
defparam pll.valid_lock_multiplier = 1;

endmodule
