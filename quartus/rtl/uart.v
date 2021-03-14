module uart(
    input rxd,

    output[6:0] gram_write_data,
    output[11:0] gram_write_address,
    output reg gram_write_enable,
    
    output reg clk_uart,
    output reg clk_uart_enable,
    
    input clk, 
    input rst_n
);

parameter
bps = 115_200,
clk_hz = 50_000_000
;

reg[31:0] div_count;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        div_count <= 0;
        clk_uart <= 0;
    end else if (clk_uart_enable) begin
        if (div_count == clk_hz / bps / 2) begin
            div_count <= 0;
            clk_uart <= ~clk_uart;
        end else begin
            div_count <= div_count + 1;
        end
        if (div_count == clk_hz / bps / 2) begin
        end else begin
        end
    end else begin
        div_count <= 0;
        clk_uart <= 0;
    end
end

wire rxd_edge;
edge_detect #(
    .is_raise ( 0 )
) rxd_edge_detect_inst(
    .signal ( rxd ),
    .signal_edge ( rxd_edge ),
    
    .clk ( clk ), 
    .rst_n ( rst_n )
);

wire clk_uart_edge;
edge_detect #(
    .is_raise ( 1 )
) clk_uart_edge_detect_inst(
    .signal ( clk_uart ),
    .signal_edge ( clk_uart_edge ),
    
    .clk ( clk ), 
    .rst_n ( rst_n )
);

reg[2:0] state;
localparam
STATE_RECV_CHAR = 1,
STATE_WAITING_FOR_CHAR_INDEX_LOW = 2,
STATE_RECV_CHAR_INDEX_LOW = 3,
STATE_WAITING_FOR_CHAR_INDEX_HIGH = 4,
STATE_RECV_CHAR_INDEX_HIGH = 5,
STATE_WRITE_GRAM = 6,
STATE_WAITING_FOR_CHAR = 0
;
reg[3:0] recv_index;
reg[6:0] value;
reg[7:0] char_index_high, char_index_low;
assign gram_write_data = value;
assign gram_write_address = {char_index_high, char_index_low};
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= STATE_WAITING_FOR_CHAR;
        clk_uart_enable <= 0;

        recv_index <= 0;
        gram_write_enable <= 0;

        value <= 0;
        char_index_low <= 0;
        char_index_high <= 0;
    end else begin
        case (state)
            STATE_WAITING_FOR_CHAR : begin
                if (rxd_edge) begin
                    state <= STATE_RECV_CHAR;
                    clk_uart_enable <= 1;
                end else begin
                    clk_uart_enable <= 0;
                end

                recv_index <= 0;
                gram_write_enable <= 0;

                value <= 0;
                char_index_low <= 0;
                char_index_high <= 0;
            end
            STATE_RECV_CHAR : begin
                if (clk_uart_edge) begin
                    if (recv_index <= 0) begin
                        recv_index <= recv_index + 1;
                    end else if (recv_index <= 7) begin
                        value[recv_index - 1] <= rxd;
                        recv_index <= recv_index + 1;
                    end else if (recv_index <= 8) begin
                        recv_index <= recv_index + 1;
                    end else begin
                        recv_index <= 0;
                        clk_uart_enable <= 0;
                        state <= STATE_WAITING_FOR_CHAR_INDEX_LOW;
                    end
                end
            end
            STATE_WAITING_FOR_CHAR_INDEX_LOW : begin
                if (rxd_edge) begin
                    clk_uart_enable <= 1;
                    state <= STATE_RECV_CHAR_INDEX_LOW;
                end else begin
                end
                recv_index <= 0;
            end
            STATE_RECV_CHAR_INDEX_LOW : begin
                if (clk_uart_edge) begin
                    if (recv_index <= 0) begin
                        recv_index <= recv_index + 1;
                    end else if (recv_index <= 8) begin
                        char_index_low[recv_index - 1] <= rxd;
                        recv_index <= recv_index + 1;
                    end else begin
                        recv_index <= 0;
                        clk_uart_enable <= 0;
                        state <= STATE_WAITING_FOR_CHAR_INDEX_HIGH;
                    end
                end
            end
            STATE_WAITING_FOR_CHAR_INDEX_HIGH : begin
                if (rxd_edge) begin
                    state <= STATE_RECV_CHAR_INDEX_HIGH;
                    clk_uart_enable <= 1;
                end else begin
                    clk_uart_enable <= 0;
                end
                recv_index <= 0;
            end
            STATE_RECV_CHAR_INDEX_HIGH : begin
                if (clk_uart_edge) begin
                    if (recv_index <= 0) begin
                        recv_index <= recv_index + 1;
                    end else if (recv_index <= 8) begin
                        char_index_high[recv_index - 1] <= rxd;
                        recv_index <= recv_index + 1;
                    end else begin
                        recv_index <= 0;
                        clk_uart_enable <= 0;
                        gram_write_enable <= 1;
                        state <= STATE_WRITE_GRAM;
                    end
                end
            end
            STATE_WRITE_GRAM : begin
                gram_write_enable <= 0;
                state <= STATE_WAITING_FOR_CHAR;
            end
            default: state <= STATE_WAITING_FOR_CHAR;
        endcase
    end
end

endmodule
