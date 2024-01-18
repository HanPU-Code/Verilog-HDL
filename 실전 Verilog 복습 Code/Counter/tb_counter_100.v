`timescale 1ns/1ps

module tb_counter_100 (
    input tb_clk,
    input tb_reset_n,
    output [6:0] tb_o_cnt,
    output [6:0] tb_o_cnt_always
);

reg tb_clk, tb_reset_n;
initial begin
    #100
    $display("initialize at [%d]", $time);
    tb_reset_n <= 1;
    #10
    tb_reset_n <= 0;    
    #10
    $display("start at [%d]", $time);
    tb_reset_n <= 1;
    #2000
    $display("finish at [%d]", $time);
    $finish
end

always begin
    #5 clk = ~clk;
end

counter_100 u_counter_100 (
    .clk (tb_clk),
    .reset_n (tb_reset_n),
    .o_cnt (tb_o_cnt),
    .o_cnt_always (tb_o_cnt_always)
);

endmodule