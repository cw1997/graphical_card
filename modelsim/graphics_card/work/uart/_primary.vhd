library verilog;
use verilog.vl_types.all;
entity uart is
    generic(
        one_second      : integer := 1000000000;
        bps             : integer := 115200;
        clk_hz          : integer := 50000000
    );
    port(
        rxd             : in     vl_logic;
        gram_write_data : out    vl_logic_vector(6 downto 0);
        gram_write_address: out    vl_logic_vector(11 downto 0);
        gram_write_enable: out    vl_logic;
        clk_uart        : out    vl_logic;
        clk_uart_enable : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of one_second : constant is 1;
    attribute mti_svvh_generic_type of bps : constant is 1;
    attribute mti_svvh_generic_type of clk_hz : constant is 1;
end uart;
