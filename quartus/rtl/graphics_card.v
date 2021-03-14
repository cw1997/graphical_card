// VGA Driver
// Code By cw1997 <867597730@qq.com>
// 2021-02-06 01:42:58

`timescale 1ns/1ns

module graphics_card(

    output VGA_CLK,
    output VGA_SYNC,
    output VGA_BLANK,
    output VGA_HS,
    output VGA_VS,
    output [9:0] VGA_R,
    output [9:0] VGA_G,
    output [9:0] VGA_B,
    
    // input  [15:0] gpio,
    // input  [7:0] key,
    // input  [4:1] ckey,
    // output [7:0] led,
    // output [11:1] lcd,
    
    // input rxd,
    
    input [17:0] SW,
    input [3:0] KEY,
    output [35:0] GPIO_0,
    input CLOCK_50
);

wire clk = CLOCK_50;
wire rst_n = KEY[0];

wire vga_clk_switch = SW[0];

// wire clk_uart;
// wire clk_uart_enable;
// assign lcd[1] = clk_uart;
// assign led[1] = ~clk_uart;
// assign led[2] = ~clk_uart_enable;

// wire rxd = gpio[15];
// assign led[0] = rxd;

wire gram_write_enable;

wire[11:0] gram_read_address;
wire[6:0] gram_out;

wire[11:0] gram_write_address;
wire[6:0] gram_write_data;
gram gram_inst (
    .clock ( clk ),
    .data ( gram_write_data ),
    .rdaddress ( gram_read_address ),
    .wraddress ( gram_write_address ),
    .wren ( gram_write_enable ),
    .q ( gram_out )
);

// uart uart_inst(
//     .rxd( rxd ),
    
//     .clk_uart ( clk_uart ),
//     .clk_uart_enable ( clk_uart_enable ),

//     .gram_write_data( gram_write_data ),
//     .gram_write_address( gram_write_address ),
//     .gram_write_enable( gram_write_enable ),
   
//     .clk( clk ), 
//     .rst_n( rst_n )
// );
    
wire clk_25M_from_PLL_1;
wire clk_locked_PLL_1;
pll pll_inst (
    .areset ( !rst_n ),
    .inclk0 ( clk ),
    .c0 ( clk_25M_from_PLL_1 )
    // .locked ( clk_locked_PLL_1 )
);

reg clk_25M_from_div;
reg div_count;
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        div_count <= 0;
        clk_25M_from_div <= 0;
    end
    else if (div_count == 0)
    begin
        div_count <= 0;
        clk_25M_from_div <= !clk_25M_from_div;
    end
    else
    begin
        div_count <= div_count + 1;
    end
end

//wire vga_clk = clk_25M_from_div;
wire vga_clk_25M = vga_clk_switch ? clk_25M_from_div : clk_25M_from_PLL_1;
assign VGA_CLK = vga_clk_25M;

adv7123 adv7123_inst (
    .sync_n ( VGA_SYNC ),
    .blank_n ( VGA_BLANK ),
    .horizontal_sync ( VGA_HS ), 
    .vertical_sync ( VGA_VS ), 
    .vga_r ( VGA_R ),
    .vga_g ( VGA_G ),
    .vga_b ( VGA_B ),

    .gram_read_address ( gram_read_address ),
    .gram_out ( gram_out ),
    
    .clk ( vga_clk_25M ), 
    .rst_n ( rst_n )
);


assign GPIO_0[0] = clk;
assign GPIO_0[1] = vga_clk_25M;

    
endmodule
