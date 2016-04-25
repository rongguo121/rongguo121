`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:02:14 07/16/2014 
// Design Name: 
// Module Name:    CORDIC_angle 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CORDIC_angle
#(parameter DATA_WIDTH = 16)
	(
		input clk,
		input rst_n,
		input [3:0]A,
		input [3:0]W,
		//input  [DATA_WIDTH-1:0]z_in,
		output reg signed[DATA_WIDTH+4:0]x_out,
		output reg signed [DATA_WIDTH+4 :0]y_out
    );
	
	
	`define rot0  16'h2000    //45
	`define rot1  16'h12e4    //26.5651
	`define rot2  16'h09fb    //14.0362
	`define rot3  16'h0511    //7.1250
	`define rot4  16'h028b    //3.5763
	`define rot5  16'h0145    //1.7899
	`define rot6  16'h00a3    //0.8952
	`define rot7  16'h0051    //0.4476
	`define rot8  16'h0028    //0.2238
	`define rot9  16'h0014    //0.1119
	`define rot10 16'h000a    //0.0560
	`define rot11 16'h0005    //0.0280
	`define rot12 16'h0003    //0.0140
	`define rot13 16'h0001    //0.0070
	`define rot14 16'h0001    //0.0035
	`define rot15 16'h0000    //0.0018
		reg signed[DATA_WIDTH-1:0]z_in;
		reg signed [DATA_WIDTH-1:0]z;
		reg  signed[DATA_WIDTH:0]x;
		reg  signed[DATA_WIDTH:0]y;
		reg [4:0]state;
		
		parameter s0=5'b00000,s1=5'b00001,s2=5'b00010,s3=5'b00011,s4=5'b00100,s5=5'b00101,s6=5'b00110,s7=5'b00111,s8=5'b01000;
		parameter s9=5'b01001,s10=5'b01010,s11=5'b01011,s12=5'b01100,s13=5'b1101,s14=5'b01110,s15=5'b01111,s16=5'b10000,s17=5'b10001,s18=5'b10010;
		
		parameter k=16'h9b74;//0.607253*2^16
			
		reg buzy;
		
		wire signed[DATA_WIDTH-1:0]z_in1;
		
		assign z_in1 = (state == s18)? z_in1:{2'b0,z_in[13:0]};
		
		always@(posedge clk or negedge rst_n)
			if(!rst_n)
				z_in<=0;
			else if(buzy == 0)
					if(z_in[13:0] == 16380)
						begin	
							z_in[13:0]  <= 0;
							z_in[15:14] <= z_in[15:14] + 1;
						end
					else
					    z_in  <= z_in +182*W;
				else z_in <= z_in;
				
				
		always@(posedge clk or negedge rst_n)
			if(!rst_n)begin
				state<=s0;
				buzy <= 0;
				end
			//else if(z_in1 == 0)
			//		begin
			//			x_out <= 17'b01111111111111111;
			//			y_out <= 0;
			//		end	
				else case(state)
					s0:begin 	x<={1'b0,k};
								y<=0;
								z<=0;
								buzy <= 1;
								state<=s1;
						end
					s1:begin if(z < z_in1)
									begin
										x<=x-y;
										y<=y+x;
										z<=z+`rot0;
									end
								else
									begin
										x<=x+y;
										y<=y-x;
										z<=z-`rot0;
									end
								state<=s2;
						end
					s2:begin if(z < z_in1)
									begin
										x<=x-y/2;
										y<=y+x/2;
										z<=z+`rot1;
									end
								else
									begin
										x<=x+y/2;
										y<=y-x/2;
										z<=z-`rot1;
									end
								state<=s3;
						end
					s3:begin if(z < z_in1)
									begin
										x<=x-y/4;
										y<=y+x/4;
										z<=z+`rot2;
									end
								else
									begin
										x<=x+y/4;
										y<=y-x/4;
										z<=z-`rot2;
									end
								state<=s4;
						end
					s4:begin if(z < z_in1)
									begin
										x<=x-y/8;
										y<=y+x/8;
										z<=z+`rot3;
									end
								else
									begin
										x<=x+y/8;
										y<=y-x/8;
										z<=z-`rot3;
									end
								state<=s5;
						end
					s5:begin if(z < z_in1)
									begin
										x<=x-y/16;
										y<=y+x/16;
										z<=z+`rot4;
									end
								else
									begin
										x<=x+y/16;
										y<=y-x/16;
										z<=z-`rot4;
									end
								state<=s6;
						end
					s6:begin if(z < z_in1)
									begin
										x<=x-y/32;
										y<=y+x/32;
										z<=z+`rot5;
									end
								else
									begin
										x<=x+y/32;
										y<=y-x/32;
										z<=z-`rot5;
									end
								state<=s7;
						end
					s7:begin if(z < z_in1)
									begin
										x<=x-y/64;
										y<=y+x/64;
										z<=z+`rot6;
									end
								else
									begin
										x<=x+y/64;
										y<=y-x/64;
										z<=z-`rot6;
									end
								state<=s8;
						end
					s8:begin if(z <z_in1)
									begin
										x<=x-y/128;
										y<=y+x/128;
										z<=z+`rot7;
									end
								else
									begin
										x<=x+y/128;
										y<=y-x/128;
										z<=z-`rot7;
									end
								state<=s9;
						end
					s9:begin if(z <z_in1)
									begin
										x<=x-y/256;
										y<=y+x/256;
										z<=z+`rot8;
									end
								else
									begin
										x<=x+y/256;
										y<=y-x/256;
										z<=z-`rot8;
									end
								state<=s10;
						end
					s10:begin if(z <z_in1)
									begin
										x<=x-y/512;
										y<=y+x/512;
										z<=z+`rot9;
									end
								else
									begin
										x<=x+y/512;
										y<=y-x/512;
										z<=z-`rot9;
									end
								state<=s11;
						end
					s11:begin if(z <z_in1)
									begin
										x<=x-y/1024;
										y<=y+x/1024;
										z<=z+`rot10;
									end
								else
									begin
										x<=x+y/1024;
										y<=y-x/1024;
										z<=z-`rot10;
									end
								state<=s12;
						end
					s12:begin if(z <z_in1)
									begin
										x<=x-y/2048;
										y<=y+x/2048;
										z<=z+`rot11;
									end
								else
									begin
										x<=x+y/2048;
										y<=y-x/2048;
										z<=z-`rot11;
									end
								state<=s13;
						end
					s13:begin if(z <z_in1)
									begin
										x<=x-y/4096;
										y<=y+x/4096;
										z<=z+`rot12;
									end
								else
									begin
										x<=x+y/4096;
										y<=y-x/4096;
										z<=z-`rot12;
									end
								state<=s14;
						end
					s14:begin if(z <z_in1)
									begin
										x<=x-y/8192;
										y<=y+x/8192;
										z<=z+`rot13;
									end
								else
									begin
										x<=x+y/8192;
										y<=y-x/8192;
										z<=z-`rot13;
									end
								state<=s15;
						end
					s15:begin if(z <z_in1)
									begin
										x<=x-y/16384;
										y<=y+x/16384;
										z<=z+`rot14;
									end
								else
									begin
										x<=x+y/16384;
										y<=y-x/16384;
										z<=z-`rot14;
									end
								state<=s16;
						end
					s16:begin if(z <z_in1)
									begin
										x<=x-y/32768;
										y<=y+x/32768;
										z<=z+`rot15;
									end
								else
									begin
										x<=x+y/32768;
										y<=y-x/32768;
										z<=z-`rot15;
									end
								state<=s17;
						end
					s17: begin
						    x<=x[16]?~x+1:x;
							y<=y[16]?~y+1:y;
							state<=s18;
							
						end	
					s18:begin
							case(z_in[15:14])
								2'b00:begin
										x_out <=A*x;
										y_out <=A*y;
										end
								2'b01:begin
										x_out <= A*(~y+1);
										y_out <= A*x;
										end
								2'b10:begin
										x_out <=A*(~x+1);
										y_out <= A*(~y+1);
										end
								2'b11:begin
										x_out <= A*y;
										y_out <= A*(~x+1);
										end
							endcase
							buzy <= 0;
							state <= s0;
						end
				endcase
				
endmodule

