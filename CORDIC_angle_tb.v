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
	//reg [15:0] z_in;
	reg [3:0]A;
	reg [3:0]W;
	// Outputs
	wire signed[20:0] x_out;
	wire signed[20:0] y_out;

	// Instantiate the Unit Under Test (UUT)
	CORDIC_angle uut (
		.clk(clk), 
		.rst_n(rst_n), 
		//.z_in(z_in),
		.A(A),
		.W(W),
		.x_out(x_out), 
		.y_out(y_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
	//	z_in = 0;
		A = 1;
		W = 1;
		
		
		

		// Wait 100 ns for global reset to finish
		#1;rst_n = 1;
		#1;rst_n = 0;
		#1;rst_n = 1;
		//repeat(20)
		//#100
		//z_in=z_in+3;
        
		// Add stimulus here
		
		//#500 A= 2; W= 2;
		//#500 A= 4; W= 4;
		#13680;
		#13680;
		#13680; W= 2;A=2;
		#13680;
		#13680;
		#13680 W= 4;A=4;
		
	end
      always #1 clk=~clk;
	 // always #38 z_in = z_in + 182;
endmodule


