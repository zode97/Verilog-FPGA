module Count16P( Clock, Enable, Clear, HEX00, HEX11, HEX22, HEX33);
	input Clock; // 50 MHz System Clock
	input Enable; // Output of 1 sec timer
	input Clear;
	output logic [6:0] HEX00, HEX11, HEX22, HEX33;
	logic [15:0]Q; // the count
	always @ ( posedge Clock ) begin
		if ( ~Clear ) begin
				Q <= 0;
		end
		else if ( Enable ) begin
			if ( Q == 16'h270F )
				Q <= 0;
			else
				Q <= Q + 16'b1;
		end // end enable
	end // always
	HEX u1(Q[3:0], HEX00);
	HEX u2(Q[7:4], HEX11);
	HEX u3(Q[11:8], HEX22);
	HEX u4(Q[15:12], HEX33);
endmodule


module Count16P_tb();

	logic Clk, ClrN, En;
	logic [6:0] HEX00, HEX11, HEX22, HEX33;
	
	Count16P DUT(Clk, En, ClrN, HEX00, HEX11, HEX22, HEX33);
	
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

