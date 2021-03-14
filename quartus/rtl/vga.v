// VGA Driver
// Code By cw1997 <867597730@qq.com>
// 2021-02-06 01:42:58

`timescale 1ns/1ns

module vga(
    output hsync, 
    output vsync, 
    output reg[2:0] vga_r,
    output reg[2:0] vga_g,
    output reg[1:0] vga_b,
    
    output[11:0] gram_read_address,
    input[6:0] gram_out,
    
    input clk, 
    input rst_n
);

// reference : http://tinyvga.com/vga-timing/640x480@60Hz
// 640x480@60Hz
// General timing
// Screen refresh rate	60 Hz
// Vertical refresh		31.46875 kHz
// Pixel freq.			25.175 MHz
// Horizontal timing (line)
// Polarity of horizontal sync pulse is negative.
// Scanline part	Pixels	Time [ms]
// Visible area		640		25.422045680238
// Front porch		16		0.63555114200596
// Sync pulse		96		3.8133068520357
// Back porch		48		1.9066534260179
// Whole line		800		31.777557100298
// Vertical timing (frame)
// Polarity of vertical sync pulse is negative.
// Frame part	Lines	Time [ms]
// Visible area	480		15.253227408143
// Front porch	10		0.31777557100298
// Sync pulse	2		0.063555114200596
// Back porch	33		1.0486593843098
// Whole frame	525		16.683217477656
// (a + b + ( a + b + c * h + d ) + d ) * v = 25.175 MHz
parameter

HORIZONTAL_FRONT_PORCH = 16,
HORIZONTAL_SYNC_PULSE = 96,
HORIZONTAL_VISIBLE_AREA = 640,
HORIZONTAL_BACK_PORCH = 48,
HORIZONTAL_WHOLE_LINE = HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH + HORIZONTAL_VISIBLE_AREA + HORIZONTAL_FRONT_PORCH,

VERTICAL_FRONT_PORCH = 10,
VERTICAL_SYNC_PULSE = 2,
VERTICAL_VISIBLE_AREA = 480,
VERTICAL_BACK_PORCH = 33,
VERTICAL_WHOLE_LINE = VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH + VERTICAL_VISIBLE_AREA + VERTICAL_FRONT_PORCH;

localparam
CHAR_WIDTH = 8,
CHAR_HEIGHT = 16,
CHAR_COUNT_ROW = VERTICAL_VISIBLE_AREA / CHAR_HEIGHT,
CHAR_COUNT_COLUMN = HORIZONTAL_VISIBLE_AREA / CHAR_WIDTH,
COLOR_WIDTH = 80
;
reg[15:0] horizontal_count, vertical_count;

assign hsync = horizontal_count < HORIZONTAL_SYNC_PULSE ? 0 : 1;
assign vsync = vertical_count < VERTICAL_SYNC_PULSE ? 0 : 1;

wire active_video = (
    (horizontal_count >= HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH) && 
    (horizontal_count < HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH + HORIZONTAL_VISIBLE_AREA) && 
    (vertical_count >= VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH) && 
    (vertical_count < VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH + VERTICAL_VISIBLE_AREA)
);

// horizontal
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        horizontal_count <= 0;
    end else if (horizontal_count == HORIZONTAL_WHOLE_LINE - 1) begin
        horizontal_count <= 0;
    end else begin
        horizontal_count <= horizontal_count + 1;
    end
end

// vertical
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        vertical_count <= 0;
    end else if (vertical_count == VERTICAL_WHOLE_LINE - 1) begin
        vertical_count <= 0;
    end else if (horizontal_count == HORIZONTAL_WHOLE_LINE - 1) begin
        vertical_count <= vertical_count + 1;
    end else begin
        vertical_count <= vertical_count;
    end
end

wire[6:0] font_read_address = gram_out - 6'h20;
wire[127:0] font_read_data;
font font_inst (
    .address ( font_read_address ),
    .clock ( clk ),
    .q ( font_read_data )
);

wire[15:0] pixel_x = active_video ? horizontal_count - (HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH) : pixel_x;
wire[15:0] pixel_y = active_video ? vertical_count - (VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH) : pixel_y;

assign gram_read_address = pixel_x / CHAR_WIDTH + pixel_y / CHAR_HEIGHT * CHAR_COUNT_COLUMN;

wire is_light = font_read_data[pixel_x % CHAR_WIDTH + (pixel_y % CHAR_HEIGHT) * CHAR_WIDTH];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        vga_r <= 0;
        vga_g <= 0;
        vga_b <= 0;
    end else if (active_video) begin
        if (is_light) begin
            vga_r <= 3'b111;
            vga_g <= 3'b111;
            vga_b <= 2'b11;
        end else begin
            vga_r <= 3'b000;
            vga_g <= 3'b000;
            vga_b <= 2'b00;
        end
    end else begin
        vga_r <= 0;
        vga_g <= 0;
        vga_b <= 0;
    end
end
    
    
endmodule