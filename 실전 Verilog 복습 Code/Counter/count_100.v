// 3회차 코드 작성
`timescale 1ns / 1ps

module counter_100 (
    input i_clk,
    input i_reset_n,
    output [6:0] o_value,
    output [6:0] o_value_always
);

reg cnt;
always @(posedge i_clk or negedge i_reset_n) begin
    if (!i_reset_n) begin
        cnt <= 0;
    end else if (cnt < 100) begin
        cnt <= cnt + 1;
    end
end
assign cnt = o_value;

reg cnt_always;
always @(posedge i_clk or negedge i_reset_n) begin
    if (!i_reset_n) begin
        cnt_always <= 0;
    end else if (cnt_always == 100 - 1) begin
        cnt_always <= 0;
    end else begin
        cnt_always <= cnt_always + 1;
    end
end
assign cnt_always = o_value_always;
    
endmodule