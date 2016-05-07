module pipelined_mult
	(input clk,
	 input rst_n,
	 input [31:0]A,
	 input [31:0]B,
	 
	 output [31:0]C
	);
	 
	 wire [48:0] P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12;
	 wire [48:0] reg_P0,reg_P1,reg_P2,reg_P3,reg_P4,reg_P5,reg_P6,reg_P7,reg_P8,reg_P9,reg_P10,reg_P11,reg_P12;
	 wire sign;
	 wire reg_sign;
	 wire reg_sign1;
	 wire [8:0]expc;
	 wire [8:0]reg_expc1;
	 wire [8:0]reg_expc;
	 wire [47:0]reg_c;
	 wire [47:0]c;
	 
	 fmul_mul u1 (.A(A),
				  .B(B),
				  .P0(P0),
				  .P1(P1),
				  .P2(P2),
				  .P3(P3),
				  .P4(P4),
				  .P5(P5),
				  .P6(P6),
				  .P7(P7),
				  .P8(P8),
				  .P9(P9),
				  .P10(P10),
				  .P11(P11),
				  .P12(P12),
				  .sign(sign),
				  .expc(expc));
				  
	reg_mul_add u2 (.clk(clk),
					.rst_n(rst_n),
					.P0(P0),
				    .P1(P1),
				    .P2(P2),
				    .P3(P3),
				    .P4(P4),
				    .P5(P5),
				    .P6(P6),
				    .P7(P7),
				    .P8(P8),
				    .P9(P9),
				    .P10(P10),
				    .P11(P11),
				    .P12(P12),
					.sign(sign),
					.expc(expc),
					.reg_P0(reg_P0),
				    .reg_P1(reg_P1),
				    .reg_P2(reg_P2),
				    .reg_P3(reg_P3),
				    .reg_P4(reg_P4),
				    .reg_P5(reg_P5),
				    .reg_P6(reg_P6),
				    .reg_P7(reg_P7),
				    .reg_P8(reg_P8),
				    .reg_P9(reg_P9),
				    .reg_P10(reg_P10),
				    .reg_P11(reg_P11),
				    .reg_P12(reg_P12),
					.reg_sign(reg_sign),
					.reg_expc(reg_expc)
					);
					
					
	wallce u3 (   .P0(reg_P0),
				  .P1(reg_P1),
				  .P2(reg_P2),
				  .P3(reg_P3),
				  .P4(reg_P4),
				  .P5(reg_P5),
				  .P6(reg_P6),
				  .P7(reg_P7),
				  .P8(reg_P8),
				  .P9(reg_P9),
				  .P10(reg_P10),
				  .P11(reg_P11),
				  .P12(reg_P12),
				  .c(c));
				  
	reg_add_norm u4 (.clk(clk),
				     .rst_n(rst_n),
				     .reg_sign(reg_sign),
				     .reg_expc(reg_expc),
				     .c(c),
				     .reg_sign1(reg_sign1),
				     .reg_expc1(reg_expc1),
				     .reg_c(reg_c)
				    );
					
	fmul_norm u5  (.sign(reg_sign1),
				   .expc2(reg_expc1),
				   .reg_c(reg_c),
				  // .error_flag(error_flag),
				   .C(C));
endmodule
				
				  