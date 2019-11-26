`timescale 10ns / 100ps
module top_test();
    reg clk;
    reg rst;
    wire tx_p;
    wire tx_n;
    
	//reg [7:0] data;


initial begin
    clk = 0;
    forever #10 clk = ~clk;
end
initial begin
    rst = 1;
    #20
    rst = 0;
    //#10
    //data = 8'b00001011;
end

top t(.CLK(clk),.RST(rst));


endmodule