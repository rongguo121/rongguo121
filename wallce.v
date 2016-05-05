module wallce
	(input [48:0] P0,
	 input [48:0] P1,
	 input [48:0] P2,
	 input [48:0] P3,
	 input [48:0] P4,
	 input [48:0] P5,
	 input [48:0] P6,
	 input [48:0] P7,
	 input [48:0] P8,
	 input [48:0] P9,
	 input [48:0] P10,
	 input [48:0] P11,
	 input [48:0] P12,
	 
	 output [47:0] c);
	wire [48:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
	wire [48:0] out;
	wire [48:0] m1,m2,m3,m4,m5,m6,m7,m8,m9,m10;
	add u1 (.a(P0),
			.b(P1),
			.cin(P2),
			.sum(s1),
			.cout(c1));
	
	add u2 (.a(P3),
			.b(P4),
			.cin(P5),
			.sum(s2),
			.cout(c2));
			
	add u3 (.a(P6),
			.b(P7),
			.cin(P8),
			.sum(s3),
			.cout(c3));
	
	add u4 (.a(P9),
			.b(P10),
			.cin(P11),
			.sum(s4),
			.cout(c4));
			
//		
		 assign m1 = c1 << 1;
		 assign m2 = c2 << 1;
		 assign m3 = c3 << 1;
		 assign m4 = c4 << 1;
	
	add u5 (.a(s1),
			.b(m1),
			.cin(s2),
			.sum(s5),
			.cout(c5));
	
	add u6 (.a(s3),
			.b(m3),
			.cin(m2),
			.sum(s6),
			.cout(c6));
	
	add u7 (.a(s4),
			.b(m4),
			.cin(P12),
			.sum(s7),
			.cout(c7));
	
//	

	assign m5 = c5 << 1;
	assign m6 = c6 << 1;
	assign m7 = c7 << 1;
	add u8 (.a(s5),
			.b(m5),
			.cin(s6),
			.sum(s8),
			.cout(c8));
			
	add u9 (.a(s7),
			.b(m7),
			.cin(m6),
			.sum(s9),
			.cout(c9));

//
	assign m8 = c8 << 1;
	add u10 (.a(s8),
			.b(m8),
			.cin(s9),
			.sum(s10),
			.cout(c10));
			
//
	assign m9 = c9 << 1;
	assign m10 = c10 << 1;
	add u11 (.a(s10),
			.b(m10),
			.cin(m9),
			.sum(s11),
			.cout(c11));
			
	assign out = s11 + (c11<<1);
	assign c = out[47:0];
	
			
endmodule
