`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:50:00 07/16/2014
// Design Name:   CORDIC_angle
// Module Name:   F:/study/FPGA project/DSP/CORDIC/CORDIC_angle_tb.v
// Project Name:  CORDIC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CORDIC_angle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CORDIC_angle_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg [15:0]A;
	reg [15:0]W;
	// Outputs
	wire signed[32:0] x_out;
	wire signed[32:0] y_out;

	// Instantiate the Unit Under Test (UUT)
	CORDIC_angle uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.A(A),
		.W(W),
		.x_out(x_out), 
		.y_out(y_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		A = 1024;
		W = 1024;
		
		
		

		// Wait 100 ns for global reset to finish
		#1;rst_n = 1;
		#1;rst_n = 0;
		#1;rst_n = 1;
		
		#13680;
		#136800;
		#136800; W= 2048;A=2048;
		#13680;
		#13680;
		#13680 W= 4096;A=2048;
		#13680;
		#13680;
		#13680 W= 182;A=1024;
		
	end
      always #10 clk=~clk;
	 
endmodule



