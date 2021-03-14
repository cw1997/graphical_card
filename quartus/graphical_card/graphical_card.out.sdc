## Generated SDC file "graphical_card.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

## DATE    "Sun Mar 14 14:47:54 2021"

##
## DEVICE  "EP2C35F672C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clock_50m} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {pll:pll_inst|altpll:altpll_component|_clk0} -source [get_pins {pll_inst|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 2 -master_clock {clock_50m} [get_pins {pll_inst|altpll_component|pll|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clock_50m}]  0.000 [get_ports {GPIO_0[0]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {GPIO_0[1]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_BLANK}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[0]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[1]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[2]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[3]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[4]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[5]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[6]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[7]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[8]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_B[9]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_CLK}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[0]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[1]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[2]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[3]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[4]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[5]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[6]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[7]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[8]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_G[9]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_HS}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[0]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[1]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[2]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[3]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[4]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[5]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[6]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[7]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[8]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_R[9]}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_SYNC}]
set_output_delay -add_delay  -clock [get_clocks {pll:pll_inst|altpll:altpll_component|_clk0}]  0.000 [get_ports {VGA_VS}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

