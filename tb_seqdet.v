module tb_seqdet ();
    reg a, clk = 0, reset;
    wire y;
    reg[31:0] aa = 32'b10010010100100101001001010010010;

    seqdet det1 ( .a(a), .clk(clk), .reset(reset), .y(y));

    always #10 clk = ~clk;

    initial begin
        reset = 1;
        a = 0;
        @(posedge clk);
        #1 reset = 0;
        repeat (32) begin
            a = aa[31];
            aa = aa << 1;
            @(posedge clk);
            #1;
        end
    end
endmodule