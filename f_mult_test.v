`timescale 1ns/1ns
module f_mult_test;
	reg clk;
	reg rst_n;
	reg [31:0] A;
	reg [31:0] B;
	wire[31:0] C;
	wire error_flag;
	
	f_mult u1 (.A1(A),
			   .B1(B),
			   .C(C),
			   .clk(clk),
			   .rst_n(rst_n),
			   .error_flag(error_flag));

	initial
		begin
			clk = 0;
			rst_n = 0;
			#10;rst_n  = 1;
			A = 32'h41360000;
			B = 32'h41a4c000;
			#1000;
			A=32'h3fc00000;
			B=32'h3fc00000;
			#1000;
			A=32'h3fe00000;
			B=32'h3fe00000;
			#1000;
			A=32'h53724E7E;
			B=32'h3B9ACA80;
		
		end
	always #10 clk= ~clk ;	
endmodule
