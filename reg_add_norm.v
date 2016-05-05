module reg_add_norm
	(input [47:0] c,
	 input reg_sign,
	 input [8:0]reg_expc,
	 input clk,
	 input rst_n,
	 
	 output reg [47:0]reg_c,
	 output reg reg_sign1,
	 output reg [8:0]reg_expc1
	);
	
	always @ (posedge clk or negedge rst_n)
		if(~rst_n)
			begin
				reg_c <= 0;
				reg_sign1 <= 0;
				reg_expc1 <= 0;
			end
		else
			begin	
				reg_c <= c;
				reg_sign1 <= reg_sign;
				reg_expc1 <= reg_expc;
			end
			
	
endmodule