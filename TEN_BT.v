 module TEN_BT(
	input PLL_CLK,
	output reg TX_P,
	output reg TX_N
 );
 
 
	reg [17:0] NLP_count = 0;
	reg NLP_valid;
	reg tx_signal = 0;
	reg idle = 1;
	
	always@(posedge PLL_CLK)begin
	
		if(&NLP_count)begin //2^18 = 262144 count 262144count /20MHz = 13ms
			NLP_valid <= 1;
 			NLP_count <= 0;
		end
		else begin
			NLP_valid <= 0;
			NLP_count <= NLP_count + 1;
		end
		
		if(idle == 1)begin
			if(NLP_valid)begin //NLP signal
				TX_P <= 1;
				TX_N <= 0;
			end
			else begin 
				TX_P <= 0;
				TX_N <= 0;
			end
		end
		else begin //not idle
			if(tx_signal == 1)begin
				TX_P <= 1;
				TX_N <= 0;
			end
			else begin
				TX_P <= 0;
				TX_N <= 1;
			end
		end
		
	
	end
 
 endmodule
 