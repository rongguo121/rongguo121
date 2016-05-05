module fmul_norm 
	(input sign,
	 input [47:0] reg_c,
	 input [8:0]expc2,
	 
	 output [31:0] C,
	 output error_flag);
	 
	wire flag_M;
	assign flag_M = reg_c[47];
	
	//尾数舍入
	wire [2:0]GRS;
	wire [1:0]GR;
	wire S;
	reg GRS_flag;
	
	assign GR = (flag_M == 1) ? reg_c[23:22] :reg_c[22:21];
	assign S  = (flag_M == 1) ? ((reg_c[21:0] == 22'b0) ? 0:1) : ((reg_c[20:0] == 21'b0) ? 0:1);
	assign GRS = {GR,S};
	
	always @ (*)
		if(GRS > 3'b100)
			GRS_flag <= 1;
		else if(GRS < 3'b100 )
			GRS_flag <= 0;
		else 
			GRS_flag = (flag_M == 1) ? reg_c[24] : reg_c[23];
	
	//阶码运算
	wire [8:0]expoent;
	wire [7:0]expoent_C;
	assign expoent =  expc2 + flag_M;
	assign expoent_C = expoent[7:0] ;
	
	assign error_flag = expoent[8];
	
	wire result1 = sign;
	wire [22:0]result2 = (flag_M == 1) ? reg_c[46:24] : reg_c[45:23];
	wire [7:0]result3 = expoent_C;
	wire [22:0]result4 = result2 + GRS_flag;
				
			
	
	assign C =  {result1 , result3 , result4};
	
endmodule