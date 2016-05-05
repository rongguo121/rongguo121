module add 
		( input [48:0] a,
		  input [48:0] b,
		  input [48:0] cin,
		  
		  output [48:0] cout,
		  output [48:0] sum
			);
	
	 assign cout = (a&b) | (a&cin) | (b&cin);
	 assign sum  = a^b^cin;

endmodule