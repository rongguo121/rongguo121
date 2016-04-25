`timescale 1ns / 1ns

	module multi
	(input [23:0] a,
	 input [23:0] b,
	 input  clk,
	 input rst_n,
	 
	 output reg  buzy,
	 output  reg [47:0]reg_c);
	 //reg buzy;
	 reg [4:0]state;
	parameter s0=5'b00000,s1=5'b00001,s2=5'b00010,s3=5'b00011,s4=5'b00100,s5=5'b00101,s6=5'b00110,s7=5'b00111,s8=5'b01000;
	parameter s9=5'b01001,s10=5'b01010,s11=5'b01011,s12=5'b01100,s13=5'b1101,s14=5'b01110,s15=5'b01111,s16=5'b10000,s17=5'b10001,s18=5'b10010;
	parameter s19=5'b10011,s20=5'b10100,s21=5'b10101,s22=5'b10110,s23=5'b10111,s24=5'b11000;
	// reg [47:0] reg_c;
	 //wire [23:0] a1;
	// wire [23:0] b1;
	 
	//assign a1 = (buzy)?a1:a;
	// assign b1 = (buzy)?b1:b;
	 always@(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					reg_c <= 0;
					state <= s0;
					buzy <=1;
					end
			else
				case(state)
					s0: begin
							if(a[0])
								reg_c <= {24'b0,b};
							else	
								reg_c <= reg_c;
							state <= s1;
							buzy <= 1;
						end
						
					s1: begin
							if(a[1])
								reg_c <= reg_c + {23'b0,b,1'b0};
							else	
								reg_c <= reg_c;
							state <= s2;
						end
						
					s2: begin
							if(a[2])
								reg_c <= reg_c + {22'b0,b,2'b0};
							else
								reg_c <= reg_c;
							state <= s3;
						end	
					s3: begin
							if(a[3])
								reg_c <= reg_c + {21'b0,b,3'b0};
							else
								reg_c <= reg_c;
							state <= s4;
						end
					s4: begin
							if(a[4])
								reg_c <= reg_c + {20'b0,b,4'b0};
							else
								reg_c <= reg_c;
							state <= s5;
						end
					s5: begin
							if(a[5])
								reg_c <= reg_c + {19'b0,b,5'b0};
							else
								reg_c <= reg_c;
							state <= s6;
						end	
					s6: begin
							if(a[6])
								reg_c <= reg_c + {18'b0,b,6'b0};
							else
								reg_c <= reg_c;
							state <= s7;
						end
					s7: begin
							if(a[7])
								reg_c <= reg_c + {17'b0,b,7'b0};
							else
								reg_c <= reg_c;
							state <= s8;
						end
					s8: begin
							if(a[8])
								reg_c <= reg_c + {16'b0,b,8'b0};
							else
								reg_c <= reg_c;
							state <= s9;
						end
					s9: begin
							if(a[9])
								reg_c <= reg_c + {15'b0,b,9'b0};
							else
								reg_c <= reg_c;
							state <= s10;
						end	
					s10: begin
							if(a[10])
								reg_c <= reg_c + {14'b0,b,10'b0};
							else
								reg_c <= reg_c;
							state <= s11;
						end
					s11: begin
							if(a[11])
								reg_c <= reg_c + {13'b0,b,11'b0};
							else
								reg_c <= reg_c;
							state <= s12;
						end	
					s12: begin
							if(a[12])
								reg_c <= reg_c + {12'b0,b,12'b0};
							else
								reg_c <= reg_c;
							state <= s13;
						end
					s13: begin
							if(a[13])
								reg_c <= reg_c + {11'b0,b,13'b0};
							else
								reg_c <= reg_c;
							state <= s14;
						end
					s14:begin
							if(a[14])
								reg_c <= reg_c + {10'b0,b,14'b0};
							else
								reg_c <= reg_c;
							state <= s15;
						end
					s15:begin
							if(a[15])
								reg_c <= reg_c + {9'b0,b,15'b0};
							else
								reg_c <= reg_c;
							state <= s16;
						end
					s16:begin
							if(a[16])
								reg_c <= reg_c + {8'b0,b,16'b0};
							else
								reg_c <= reg_c;
							state <= s17;
						end
					s17:begin
							if(a[17])
								reg_c <= reg_c + {7'b0,b,17'b0};
							else
								reg_c <= reg_c;
							state <= s18;
						end
					s18:begin
							if(a[18])
								reg_c <= reg_c + {6'b0,b,18'b0};
							else
								reg_c <= reg_c;
							state <= s19;
						end
					s19:begin
							if(a[19])
								reg_c <= reg_c + {5'b0,b,19'b0};
							else
								reg_c <= reg_c;
							state <= s20;
						end
					s20:begin
							if(a[20])
								reg_c <= reg_c + {4'b0,b,20'b0};
							else
								reg_c <= reg_c;
							state <= s21;
						end
					s21:begin
							if(a[21])
								reg_c <= reg_c + {3'b0,b,21'b0};
							else
								reg_c <= reg_c;
							state <= s22;
						end
					s22:begin
							if(a[22])
								reg_c <= reg_c + {2'b0,b,22'b0};
							else
								reg_c <= reg_c;
							state <= s23;
						end
					s23:begin
							if(a[23])
								reg_c <= reg_c + {1'b0,b,23'b0};
							else
								reg_c <= reg_c;
							state <= s24;
							buzy  <= 0;
						//	c <= reg_c;
						end
					s24: begin
						//	c <= reg_c;
							reg_c <= 0;
							state <= s0;
							buzy  <= 1;
						end
			endcase
		end
		
	//	assign c = (buzy)?c:reg_c;
	endmodule
	