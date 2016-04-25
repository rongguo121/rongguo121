
`timescale 1ns/1ps
module multi_tb;

	wire [47:0] c;
	
	reg [23:0] b;
	reg [23:0] a;
	reg clk;
	reg rst_n; 
	
	multi u1(.clk(clk),
			 .rst_n(rst_n),
			 .a(a),
			 .b(b),
			 .c(c)
			 );
	initial
		begin
			clk = 0;
			rst_n = 0;
			#10;
			rst_n = 1;
			
			a= 123;
			b= 145;
		#50
			a= 200;
			b= 212;
		end
		
	always #1 clk =~clk;
	
endmodule