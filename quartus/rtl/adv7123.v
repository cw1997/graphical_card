// VGA Driver By ADV7123
// Code By cw1997 <867597730@qq.com>
// 2021-03-12 18:42:12

`timescale 1ns/1ns

module adv7123(
    output sync_n,
    output blank_n,
    output horizontal_sync,
    output vertical_sync,
    output[9:0] vga_r,
    output[9:0] vga_g,
    output[9:0] vga_b,
    
    output[11:0] gram_read_address,
    input[6:0] gram_out,
    
    output[6:0] font_read_data_index,
    output[15:0] pixel_x,
    output[15:0] pixel_y,
    output reg[15:0] horizontal_count,
    output reg[15:0] vertical_count,

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
CHAR_WIDTH = 16'd8,
CHAR_HEIGHT = 16'd16,
CHAR_COUNT_ROW = VERTICAL_VISIBLE_AREA / CHAR_HEIGHT,
CHAR_COUNT_COLUMN = HORIZONTAL_VISIBLE_AREA / CHAR_WIDTH
;

assign horizontal_sync = horizontal_count >= HORIZONTAL_SYNC_PULSE;
assign vertical_sync = vertical_count >= VERTICAL_SYNC_PULSE;
assign sync_n = 0;

wire active_video = (
    (horizontal_count >= HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH) && 
    (horizontal_count < HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH + HORIZONTAL_VISIBLE_AREA) && 
    (vertical_count >= VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH) && 
    (vertical_count < VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH + VERTICAL_VISIBLE_AREA)
);
assign blank_n = active_video;

// horizontal
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        horizontal_count <= 0;
    end else if (horizontal_count == (HORIZONTAL_WHOLE_LINE - 1)) begin
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
    end else if (vertical_count == (VERTICAL_WHOLE_LINE - 1)) begin
        vertical_count <= 0;
    end else if (horizontal_count == (HORIZONTAL_WHOLE_LINE - 1)) begin
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

assign pixel_x = horizontal_count >= (HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH) ? horizontal_count - (HORIZONTAL_SYNC_PULSE + HORIZONTAL_BACK_PORCH) : 0;
assign pixel_y = vertical_count >= (VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH) ? vertical_count - (VERTICAL_SYNC_PULSE + VERTICAL_BACK_PORCH) : 0;

assign gram_read_address = (pixel_x / CHAR_WIDTH) + ((pixel_y / CHAR_HEIGHT) * CHAR_COUNT_COLUMN);

assign font_read_data_index = (pixel_x % CHAR_WIDTH) + ((pixel_y % CHAR_HEIGHT) * CHAR_WIDTH);

wire is_light = font_read_data[font_read_data_index] && active_video;

assign vga_r = is_light ? 10'b11_1111_1111 : 10'b00_0000_0000;
assign vga_g = is_light ? 10'b11_1111_1111 : 10'b00_0000_0000;
assign vga_b = is_light ? 10'b11_1111_1111 : 10'b00_0000_0000;

//always @(posedge clk) begin
//    if (active_video) begin
//        if (is_light) begin
//            vga_r <= 10'b11_1111_1111;
//            vga_g <= 10'b11_1111_1111;
//            vga_b <= 10'b11_1111_1111;
//        end else begin
//            vga_r <= 10'b00_0000_0000;
//            vga_g <= 10'b00_0000_0000;
//            vga_b <= 10'b00_0000_0000;
//        end
//    end else begin
//        vga_r <= 10'b0;
//        vga_g <= 10'b0;
//        vga_b <= 10'b0;
//    end
//end
    
    
endmodule
