`timescale 1ns/1ns
module boothmult_tb;

	wire [47:0]c;
	reg [23:0]a;
	reg [23:0]b;

	booth u1 (.a(a),
			.b(b),
			.c(c));
			
	initial begin
		a = 15;
		b = 20;
		#100;
		a = 23;
		b = 47;
		#100;
		a = 127;
		b = 268;
		#100;
		a = 16777215;
		b = 16777215;
		#100;
		$stop;
	end
endmodule
	