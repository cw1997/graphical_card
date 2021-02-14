library verilog;
use verilog.vl_types.all;
entity graphics_card is
    port(
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        vga_r           : out    vl_logic_vector(0 to 2);
        vga_g           : out    vl_logic_vector(0 to 2);
        vga_b           : out    vl_logic_vector(0 to 1);
        gpio            : in     vl_logic_vector(15 downto 0);
        led             : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst_n           : in     vl_logic
    );
end graphics_card;
