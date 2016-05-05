`timescale 1ns/1ns
module piplined_mult_tb;
	reg clk;
	reg rst_n;
	reg [31:0] A;
	reg [31:0] B;
	wire[31:0] C;
	wire error_flag;
	
	pipelined_mult u1 (.A(A),
			   .B(B),
			   .C(C),
			   .clk(clk),
			   .rst_n(rst_n),
			   .error_flag(error_flag));

	initial
		begin
			clk = 0;
			rst_n = 0;
			A = 32'h41360000;
			B = 32'h41a4c000;
			
			#20;rst_n  = 1;
			
			#20;
			A=32'h3fc00000;
			B=32'h3fc00000;
			#20;
			A=32'h3fe00000;
			B=32'h3fe00000;
			#20;
			A=32'h53724E7E;
			B=32'h3B9ACA80;
		
		end
	always #10 clk= ~clk ;	
endmodule