// 2회차 tb 답안

`timescale 1ns / 1ps

module tb_counter_100 ();
    reg tb_clk; 
    reg tb_reset_n;
    reg [6:0] tb_o_cnt; 
    reg [6:0] tb_o_cnt_always;

    always
    #5 tb_clk = ~tb_clk;

    initial begin
        // initialize
        $display("initialize at [%d]", $time);
            tb_clk <= 0;
            tb_reset_n <= 1;
        
        // reset_n gen
        $display("reset at [%d]", $time);
        #100
            tb_reset_n <=0;
        #10
            tb_reset_n <=1;
        #10
        $display("start at [%d]", $time);
        #2000
        $display("finish at [%d]", $time);
        $finish;
    end

    counter_100 u_counter_100(
        .clk (tb_clk),
        .reset_n (tb_reset_n),
        .o_cnt (tb_o_cnt),
        .o_cnt_always (tb_o_cnt_always)
    );
endmodule