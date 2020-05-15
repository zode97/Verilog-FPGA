module shift_HELLO( Clr, Clock, Q);
	input Clr, Clock; // 50 MHz System Clock
	output logic [2:0]Q;
	parameter MaxCount = 8;
	always @( posedge Clock) begin
		if ( Q == MaxCount ) begin // resets to initial condition when it gates to 8
			Q <= 0;
		end
		else if (Clr  == 1) begin // resets to initial condition when reset button is pressed
			Q <= 0;
		end
		else Q <= Q + 1'b1;
	end
endmodule

module shift_tb();
	logic Clr, Clock;
	logic [2:0] Q;
	
	shift_HELLO DUT(Clr, Clock, Q);
	
	always begin  	
		Clock = 0;  	
		#10;  	
		Clock = 1;  	
		#10;  
	end 
	
	initial begin
		Clr = 1; #400;
		Clr = 0; #200;
	   $stop;
	end
endmodule