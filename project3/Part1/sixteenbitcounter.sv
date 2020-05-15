module sixteenbitcounter(Clk, ClrN, En, HEX00, HEX11, HEX22, HEX33);
	//calls T flip flop mofule 4 times, creating 4 bit counter
	//and calls HEX module Q as an input and HEX as an output
	input Clk, ClrN, En;
	output [6:0] HEX00, HEX11, HEX22, HEX33; 
	wire logic [15:0] Q;
	logic [15:0] QN;
	
	TFFx u0 (Clk, ClrN, En, Q[0], QN[0]); // leftmost bit (LSB)
	TFFx u1 (Clk, ClrN, En & Q[0], Q[1], QN[1]);
	TFFx u2 (Clk, ClrN, En & Q[0] & Q[1], Q[2], QN[2]);
	TFFx u3 (Clk, ClrN, En & Q[0] & Q[1] & Q[2], Q[3], QN[3]); // rightmost bit (MSB)
	HEX d0(Q[3:0], HEX00);
	TFFx u4 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3], Q[4], QN[4]);
	TFFx u5 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4], Q[5], QN[5]); 
	TFFx u6 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5], Q[6], QN[6]);
	TFFx u7 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6], Q[7], QN[7]);
	HEX d1(Q[7:4], HEX11);
	TFFx u8 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7], Q[8], QN[8]); 
	TFFx u9 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8], Q[9], QN[9]);
	TFFx u10 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9], Q[10], QN[10]); 
	TFFx u11 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9] & Q[10], Q[11], QN[11]); 
	HEX d2(Q[11:8], HEX22);
	TFFx u12 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9] & Q[10] & Q[11], Q[12], QN[12]); 
	TFFx u13 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9] & Q[10] & Q[11] & Q[12], Q[13], QN[13]); 
	TFFx u14 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9] & Q[10] & Q[11] & Q[12] & Q[13], Q[14], QN[14]); 
	TFFx u15 (Clk, ClrN, En & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9] & Q[10] & Q[11] & Q[12] & Q[13] & Q[14], Q[15], QN[15]); 
   HEX d3(Q[15:11], HEX33);
	//initial $monitor($time,,," ClrN = %b", ClrN,,,, " Enable = %b", En,,, " Q = %d", Q);
endmodule

module sixteenbitcounter_tb();

	logic Clk, ClrN, En;
	logic [6:0] HEX00, HEX11, HEX22, HEX33;
	
	sixteenbitcounter DUT(Clk, ClrN, En, HEX00, HEX11, HEX22, HEX33);
	
	//20 ns clock, 
	//(1/20ns) = 50MHz
	always begin  	
		Clk = 0;  	
		#10;  	
		Clk = 1;  	
		#10;  
	end 
	
	initial begin
		ClrN = 1; En = 1; #400;
		ClrN = 0; #200;
	   $stop;
	end
	
	initial $monitor($time,,," ClrN = %b", ClrN,,,, " Enable = %b", En,,, " HEX0 = %d", HEX00);

endmodule

