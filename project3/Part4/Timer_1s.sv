module Timer_1s( Clr, Clock, Q);
	input Clr, Clock; // 50 MHz System Clock
	output reg [3:0]Q; // Count
	parameter MaxCount = 10;
	always @( posedge Clock) begin
		if ( Q == MaxCount) begin // resets to initial condition when it gates to 10
			Q <= 0;
		end
		else if (Clr  == 1) begin // resets to initial condition when reset button is pressed
			Q <= 0;
		end
		else Q <= Q + 1'b1;
	end
endmodule

// testbench
//`timescale 1ns/1ns
module timer_tb();
	logic Clr, Clock;
	logic [3:0] Q;
	
	Timer_1s DUT(Clr, Clock, Q);
	
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
