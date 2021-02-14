// VGA Driver
// Code By cw1997 <867597730@qq.com>
// 2021-02-06 01:42:58

`timescale 1ns/1ns

module graphics_card(
    output hsync, 
    output vsync, 
    output[2:0] vga_r,
    output[2:0] vga_g,
    output[1:0] vga_b,
    
    input[15:0] gpio,
    input[7:0] key,
    input[4:1] ckey,
    output[7:0] led,
    output[11:1] lcd,
    
    // input rxd,
    
    input clk, 
    input rst_n
);

wire clk_uart;
wire clk_uart_enable;
assign lcd[1] = clk_uart;
assign led[1] = ~clk_uart;
assign led[2] = ~clk_uart_enable;

wire rxd = gpio[15];
assign led[0] = rxd;

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

uart uart_inst(
    .rxd( rxd ),
    
    .clk_uart ( clk_uart ),
    .clk_uart_enable ( clk_uart_enable ),

    .gram_write_data( gram_write_data ),
    .gram_write_address( gram_write_address ),
    .gram_write_enable( gram_write_enable ),
   
    .clk( clk ), 
    .rst_n( rst_n )
);
    
wire clk_25M_from_PLL_1;
wire clk_locked_PLL_1;
pll pll_inst (
    .areset ( rst_n ),
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
assign vga_clk = ckey[4] ? clk_25M_from_div : clk_25M_from_PLL_1;

vga vga_inst (
    .hsync ( hsync ), 
    .vsync ( vsync ), 
    .vga_r ( vga_r ),
    .vga_g ( vga_g ),
    .vga_b ( vga_b ),

    .gram_read_address ( gram_read_address ),
    .gram_out ( gram_out ),
    
    .clk ( vga_clk ), 
    .rst_n ( rst_n )
);
    
endmodule
