module fmul_mul
	(input [31:0]A,
	 input [31:0]B,
	 
	 output [48:0] P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,
	 output sign,
	 output [8:0]expc);
	 

	
	//single 
	
	wire single_A = A[31];
	wire single_B = B[31];
	assign sign = single_A ^ single_B;
	
	//mantissa
	wire [23:0]a = {1'b1,A[22:0]};
	wire [23:0]b = {1'b1,B[22:0]};
	//阶码运算
	wire [7:0] expoent_A = A[30:23];
	wire [7:0] expoent_B = B[30:23];
	
	assign expc =  expoent_A + expoent_B;

	wire [24:0] a1 = {1'b0,a}; //扩展为有符号数，进行booth编码
	wire [24:0] b1 = {1'b0,b}; //扩展为有符号数，进行booth编码
	
	reg [25:0]M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12; 
	
	//根据三位选择
	
	always @ (a or b)
		begin
			case(b1[24:22])
				3'b000:M0  = 26'b0;
				3'b001:M0  = {1'b0,a1};
				3'b010:M0  = {1'b0,a1};
				3'b011:M0  = {a1,1'b0};
				3'b100:M0  = ~{a1,1'b0} + 1'b1;
				3'b101:M0  = ~{1'b0,a1} +1'b1;
				3'b110:M0  = ~{1'b0,a1} +1'b1;
				3'b111:M0  = 26'b0;
				default:M0 = 26'b0;
			endcase
		end
	
	always @ (a or b)
		begin
			case(b1[22:20])
				3'b000:M1  = 26'b0;
				3'b001:M1  = {1'b0,a1};
				3'b010:M1  = {1'b0,a1};
				3'b011:M1  = {a1,1'b0};
				3'b100:M1  = ~{a1,1'b0} + 1'b1;
				3'b101:M1  = ~{1'b0,a1} +1'b1;
				3'b110:M1  = ~{1'b0,a1} +1'b1;
				3'b111:M1  = 26'b0;
				default:M1 = 26'b0;
			endcase
		end
	
	always @ (a or b)
		begin
			case(b1[20:18])
				3'b000:M2  = 26'b0;
				3'b001:M2  = {1'b0,a1};
				3'b010:M2  = {1'b0,a1};
				3'b011:M2  = {a1,1'b0};
				3'b100:M2  = ~{a1,1'b0} + 1'b1;
				3'b101:M2  = ~{1'b0,a1} +1'b1;
				3'b110:M2  = ~{1'b0,a1} +1'b1;
				3'b111:M2  = 26'b0;
				default:M2 = 26'b0;
			endcase
		end
		
	always @ (a or b)
		begin
			case(b1[18:16])
				3'b000:M3  = 26'b0;
				3'b001:M3  = {1'b0,a1};
				3'b010:M3  = {1'b0,a1};
				3'b011:M3  = {a1,1'b0};
				3'b100:M3  = ~{a1,1'b0} + 1'b1;
				3'b101:M3  = ~{1'b0,a1} +1'b1;
				3'b110:M3  = ~{1'b0,a1} +1'b1;
				3'b111:M3  = 26'b0;
				default:M3 = 26'b0;
			endcase
		end
	
	always @ (a or b)
		begin
			case(b1[16:14])
				3'b000:M4  = 26'b0;
				3'b001:M4  = {1'b0,a1};
				3'b010:M4  = {1'b0,a1};
				3'b011:M4  = {a1,1'b0};
				3'b100:M4  = ~{a1,1'b0} + 1'b1;
				3'b101:M4  = ~{1'b0,a1} +1'b1;
				3'b110:M4  = ~{1'b0,a1} +1'b1;
				3'b111:M4  = 26'b0;
				default:M4 = 26'b0;
			endcase
		end
	
	always @ (a or b)
		begin
			case(b1[14:12])
				3'b000:M5  = 26'b0;
				3'b001:M5  = {1'b0,a1};
				3'b010:M5  = {1'b0,a1};
				3'b011:M5  = {a1,1'b0};
				3'b100:M5  = ~{a1,1'b0} + 1'b1;
				3'b101:M5  = ~{1'b0,a1} +1'b1;
				3'b110:M5  = ~{1'b0,a1} +1'b1;
				3'b111:M5  = 26'b0;
				default:M5 = 26'b0;
			endcase
		end
	
	always @ (a or b)
		begin
			case(b1[12:10])
				3'b000:M6  = 26'b0;
				3'b001:M6  = {1'b0,a1};
				3'b010:M6  = {1'b0,a1};
				3'b011:M6  = {a1,1'b0};
				3'b100:M6  = ~{a1,1'b0} + 1'b1;
				3'b101:M6  = ~{1'b0,a1} +1'b1;
				3'b110:M6  = ~{1'b0,a1} +1'b1;
				3'b111:M6  = 26'b0;
				default:M6 = 26'b0;
			endcase
		end
		
	always @ (a or b)
		begin
			case(b1[10:8])
				3'b000:M7  = 26'b0;
				3'b001:M7  = {1'b0,a1};
				3'b010:M7  = {1'b0,a1};
				3'b011:M7  = {a1,1'b0};
				3'b100:M7  = ~{a1,1'b0} + 1'b1;
				3'b101:M7  = ~{1'b0,a1} +1'b1;
				3'b110:M7  = ~{1'b0,a1} +1'b1;
				3'b111:M7  = 26'b0;
				default:M7 = 26'b0;
			endcase
		end
		
	always @ (a or b)
		begin
			case(b1[8:6])
				3'b000:M8  = 26'b0;
				3'b001:M8  = {1'b0,a1};
				3'b010:M8  = {1'b0,a1};
				3'b011:M8  = {a1,1'b0};
				3'b100:M8  = ~{a1,1'b0} + 1'b1;
				3'b101:M8  = ~{1'b0,a1} +1'b1;
				3'b110:M8  = ~{1'b0,a1} +1'b1;
				3'b111:M8  = 26'b0;
				default:M8 = 26'b0;
			endcase
		end
		
	always @ (a or b)
		begin
			case(b1[6:4])
				3'b000:M9  = 26'b0;
				3'b001:M9  = {1'b0,a1};
				3'b010:M9  = {1'b0,a1};
				3'b011:M9  = {a1,1'b0};
				3'b100:M9  = ~{a1,1'b0} + 1'b1;
				3'b101:M9  = ~{1'b0,a1} +1'b1;
				3'b110:M9  = ~{1'b0,a1} +1'b1;
				3'b111:M9  = 26'b0;
				default:M9 = 26'b0;
			endcase
		end
		
	always @ (a or b)
		begin
			case(b1[4:2])
				3'b000:M10  = 26'b0;
				3'b001:M10  = {1'b0,a1};
				3'b010:M10  = {1'b0,a1};
				3'b011:M10  = {a1,1'b0};
				3'b100:M10  = ~{a1,1'b0} + 1'b1;
				3'b101:M10  = ~{1'b0,a1} +1'b1;
				3'b110:M10  = ~{1'b0,a1} +1'b1;
				3'b111:M10  = 26'b0;
				default:M10 = 26'b0;
			endcase
		end
		
	always @ (a or b)
		begin
			case(b1[2:0])
				3'b000:M11  = 26'b0;
				3'b001:M11  = {1'b0,a1};
				3'b010:M11  = {1'b0,a1};
				3'b011:M11  = {a1,1'b0};
				3'b100:M11  = ~{a1,1'b0} + 1'b1;
				3'b101:M11  = ~{1'b0,a1} +1'b1;
				3'b110:M11  = ~{1'b0,a1} +1'b1;
				3'b111:M11  = 26'b0;
				default:M11 = 26'b0;
			endcase
		end
		
	always @ (a or b)
		begin
			case (b1[0])
			1'b1:M12 = ~{1'b0,a1} +1'b1;
			1'b0:M12 = 0;
			endcase
		end
		
	assign	P0 = {M0,23'b0};
	assign P1 = {{2{M1[25]}}, M1, 21'b0};
	assign P2 = {{4{M2[25]}}, M2, 19'b0};
	assign P3 = {{6{M3[25]}}, M3, 17'b0};
	assign P4 = {{8{M4[25]}}, M4, 15'b0};
	assign P5 = {{10{M5[25]}}, M5, 13'b0};
	assign P6 = {{12{M6[25]}}, M6, 11'b0};
	assign P7 = {{14{M7[25]}}, M7, 9'b0};
	assign P8 = {{16{M8[25]}}, M8, 7'b0};
	assign P9 = {{18{M9[25]}}, M9, 5'b0};
	assign P10 = {{20{M10[25]}}, M10, 3'b0};
	assign P11 = {{22{M11[25]}}, M11, 1'b0};
	assign P12 = {{23{M12[25]}},M12};
	
	//assign c = P0 + P1+P2+P3+P4+P5+P6+P7+P8+P9+P10+P11+P12;
	
	


	
	
	
endmodule
	
	
	
	

