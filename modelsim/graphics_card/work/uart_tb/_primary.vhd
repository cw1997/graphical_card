library verilog;
use verilog.vl_types.all;
entity uart_tb is
    generic(
        one_second      : integer := 1000000000;
        clk_hz          : integer := 50000000;
        uart_bps        : integer := 115200
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of one_second : constant is 1;
    attribute mti_svvh_generic_type of clk_hz : constant is 1;
    attribute mti_svvh_generic_type of uart_bps : constant is 1;
end uart_tb;
