`timescale 1ns/1ps

module tb_counter_100;
reg tb_clk, tb_reset_n;
wire [6:0] o_cnt;
wire [6:0] o_cnt_always;

always
    #5 clk = ~clk;

initial begin
    #100
    $display("initialize at [%d]", $time);
    tb_reset_n <= 1;
    tb_clk     <= 0;

    $display("reset at [%d]", $time);
    #100
    tb_reset_n <= 0;    
    #10
    tb_reset_n <= 1;
    #10
    $display("start at [%d]", $time);
    #2000
    $display("finish at [%d]", $time);
    $finish
end

counter_100 u_counter_100 (
    .clk (tb_clk),
    .reset_n (tb_reset_n),
    .o_cnt (tb_o_cnt),
    .o_cnt_always (tb_o_cnt_always)
);

endmodule