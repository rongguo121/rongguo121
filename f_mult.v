`timescale 1ns/1ns
module f_mult(
	input clk,
	input rst_n,
	input [31:0] A1,
	input [31:0] B1,
	output reg [31:0] C,
	output error_flag);
	reg [31:0] A;
	reg [31:0] B;
	wire single_A = A[31];
	wire single_B = B[31];
	wire single_C;
	wire buzy;
	assign single_C = single_A ^ single_B;
	
	wire [23:0]mantissa_A = {1'b1,A[22:0]};
	wire [23:0]mantissa_B = {1'b1,B[22:0]};
	wire [47:0]mantissa_C;
	wire flag_M;
	
	//assign mantissa_C = mantissa_A * mantissa_B;
	assign flag_M = (mantissa_C[47:46] == 2'b11)? 1:(mantissa_C[47:46] == 2'b10) ? 1:0;
	
	wire [2:0]GRS;
	reg GRS_flag;
	wire [7:0] expoent_A = A[30:23];
	wire [7:0] expoent_B = B[30:23];
	wire [7:0] expoent_C;
//	wire flag_E;
	reg [8:0]expoent;
	assign GRS = (flag_M == 1) ? mantissa_C[23:21] :mantissa_C[22:20];
	//assign {flag_E,expoent_C} = (buzy)? {flag_E,expoent_C} : expoent_A + expoent_B + flag_M -127;
	assign error_flag = expoent[8];
	
	wire result1 = single_C;
	wire [22:0]result2 = (flag_M == 1) ? mantissa_C[46:24] : mantissa_C[45:23];
	wire [7:0]result3 = expoent_C;
	wire [22:0]result4 = result2 + GRS_flag;
	//assign C = {result1 , result3 , result2};
	
	always @ (*)
		if(!rst_n)
			expoent <= 0;
		else
			if (buzy)
				expoent <= expoent ;
			else
				expoent <=  expoent_A + expoent_B + flag_M - 127;
				
	assign expoent_C = expoent[7:0] ;
	always @ (*)
		if(GRS > 3'b100)
			GRS_flag <= 1;
		else if(GRS < 3'b100 )
			GRS_flag <= 0;
		else 
			GRS_flag = (flag_M == 1) ? mantissa_C[24] : mantissa_C[23];
			
	always @ (posedge clk or negedge rst_n)
		if(!rst_n)
			C <= 0;
		else
			if(buzy)
				C <= C;
			else if((A[30:0] == 0) |(B[30:0] == 0))
				C <= 0;
		else
			C =  {result1 , result3 , result4};
	
	always @ (posedge clk or negedge rst_n)
		if(!rst_n)
			begin
				A <= 0;
				B <= 0;
			end
		else if(buzy) begin
				A <= A;
				B <= B;
				end
			else begin
				A <= A1;
				B <= B1;
				end
			
			
	multi u1 (.clk(clk),
			  .rst_n(rst_n),
			  .a(mantissa_A),
			  .b(mantissa_B),
			  .reg_c(mantissa_C),
			  .buzy(buzy));
endmodule
	
	
	
	

