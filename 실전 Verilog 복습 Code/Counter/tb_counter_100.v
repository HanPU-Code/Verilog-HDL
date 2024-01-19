// 2회차 tb 코딩

`timescale 1ns / 1ps

module tb_counter_100 ();
    reg tb_clk; 
    reg tb_reset_n;
    reg [6:0] tb_o_cnt; 
    reg [6:0] tb_o_cnt_always;

    initial begin
        $display("initialize at [%d]", $time);
        tb_clk <= 0;
        tb_reset_n <= 1;
        #5
        tb_reset_n <=0;
        #5
        $display("start at [%d]", $time);
        #200
        tb_reset_n <=1;
        #5
        $display("stop at [%d]", $time);
    end

    always
        #5 tb_clk = ~tb_clk;

    counter_100 u_counter_100(
        .clk (tb_clk),
        .reset_n (tb_reset_n),
        .o_cnt (tb_o_cnt),
        .o_cnt_always (tb_o_cnt_always)
    );
endmodule