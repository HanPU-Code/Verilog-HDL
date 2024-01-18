module count_100 (
    input clk,
    input reset_n,
    output o_cnt,
    output o_cnt_always,
);

integer i;

    always @(posedge clk or negedge reset_n) begin
        if (i = 0 ;i < 100; i = i + 1) begin
            assign o_cnt = i;
        end        
    end
    
endmodule