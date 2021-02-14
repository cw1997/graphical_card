library verilog;
use verilog.vl_types.all;
entity edge_detect is
    generic(
        is_raise        : integer := 1
    );
    port(
        \signal\        : in     vl_logic;
        signal_edge     : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of is_raise : constant is 1;
end edge_detect;
