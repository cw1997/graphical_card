module edge_detect(
    input signal,
    output signal_edge,
    
    input clk, 
    input rst_n
);

parameter is_raise = 1;

reg signal_1, signal_0;
assign signal_edge = is_raise ? signal_0 && ~signal_1 : ~signal_0 && signal_1;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        signal_0 <= 0;
        signal_1 <= 0;
    end else begin
        signal_0 <= signal;
        signal_1 <= signal_0;
    end
end

endmodule
