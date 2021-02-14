library verilog;
use verilog.vl_types.all;
entity vga is
    generic(
        HORIZONTAL_FRONT_PORCH: integer := 16;
        HORIZONTAL_SYNC_PULSE: integer := 96;
        HORIZONTAL_VISIBLE_AREA: integer := 640;
        HORIZONTAL_BACK_PORCH: integer := 48;
        HORIZONTAL_WHOLE_LINE: vl_notype;
        VERTICAL_FRONT_PORCH: integer := 10;
        VERTICAL_SYNC_PULSE: integer := 2;
        VERTICAL_VISIBLE_AREA: integer := 480;
        VERTICAL_BACK_PORCH: integer := 33;
        VERTICAL_WHOLE_LINE: vl_notype
    );
    port(
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        vga_r           : out    vl_logic_vector(0 to 2);
        vga_g           : out    vl_logic_vector(0 to 2);
        vga_b           : out    vl_logic_vector(0 to 1);
        gram_read_address: out    vl_logic_vector(11 downto 0);
        gram_out        : in     vl_logic_vector(6 downto 0);
        clk             : in     vl_logic;
        rst_n           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of HORIZONTAL_FRONT_PORCH : constant is 1;
    attribute mti_svvh_generic_type of HORIZONTAL_SYNC_PULSE : constant is 1;
    attribute mti_svvh_generic_type of HORIZONTAL_VISIBLE_AREA : constant is 1;
    attribute mti_svvh_generic_type of HORIZONTAL_BACK_PORCH : constant is 1;
    attribute mti_svvh_generic_type of HORIZONTAL_WHOLE_LINE : constant is 3;
    attribute mti_svvh_generic_type of VERTICAL_FRONT_PORCH : constant is 1;
    attribute mti_svvh_generic_type of VERTICAL_SYNC_PULSE : constant is 1;
    attribute mti_svvh_generic_type of VERTICAL_VISIBLE_AREA : constant is 1;
    attribute mti_svvh_generic_type of VERTICAL_BACK_PORCH : constant is 1;
    attribute mti_svvh_generic_type of VERTICAL_WHOLE_LINE : constant is 3;
end vga;
