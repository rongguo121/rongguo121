module reg_mul_add
	(input [48:0] P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,
	 input sign,
	 input [8:0]expc,
	 input clk,
	 input rst_n,
	 output reg [48:0] reg_P0,reg_P1,reg_P2,reg_P3,reg_P4,reg_P5,reg_P6,reg_P7,reg_P8,reg_P9,reg_P10,reg_P11,reg_P12,
	 output reg reg_sign,
	 output reg [8:0]reg_expc);
	 
	//reg [48:0] reg_P0;
	//reg [48:0] reg_P1;
	//reg [48:0] reg_P2;
	//reg [48:0] reg_P3;
	//reg [48:0] reg_P4;
	//reg [48:0] reg_P5;
	//reg [48:0] reg_P6;
	//reg [48:0] reg_P7;
	//reg [48:0] reg_P8;
	//reg [48:0] reg_P9;
	//reg [48:0] reg_P10;
	//reg [48:0] reg_P11;
	//reg [48:0] reg_P12;
	
	//reg reg_sign;
	//reg [8:0] reg_expc;
	
	always @ (posedge clk or negedge rst_n)
		if(~rst_n)
			begin
				reg_P0 <= 0;
				reg_P1 <= 0;
				reg_P2 <= 0;
				reg_P3 <= 0;
				reg_P4 <= 0;
				reg_P5 <= 0;
				reg_P6 <= 0;
				reg_P7 <= 0;
				reg_P8 <= 0;
				reg_P9 <= 0;
				reg_P10 <= 0;
				reg_P11 <= 0;
				reg_P12 <= 0;
				reg_sign <= 0;
				reg_expc <= 0;
			end
		else begin 
				reg_P0 <= P0;
				reg_P1 <= P1;
				reg_P2 <= P2;
				reg_P3 <= P3;
				reg_P4 <= P4;
				reg_P5 <= P5;
				reg_P6 <= P6;
				reg_P7 <= P7;
				reg_P8 <= P8;
				reg_P9 <= P9;
				reg_P10 <= P10;
				reg_P11 <= P11;
				reg_P12 <= P12;
				reg_sign <= sign;
				reg_expc <= expc;
			end
			
endmodule

				
	   
	 
	