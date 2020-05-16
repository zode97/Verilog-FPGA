module FSM ( Clk, reset, w, z, temp);
	input Clk;
	input reset, w;
	output logic z;
	logic [3:0] NextState;
	output logic [3:0] temp;
	localparam  A = 4'h0, // state names
		    B = 4'h1,
		    C = 4'h2,
          D = 4'h3,
		    E = 4'h4,
		    F = 4'h5,
		    G = 4'h6,
		    H = 4'h7,
		    I = 4'h8;
	logic [3:0] CurrentState = A;
	always_comb begin
		//z = 4'b0000;
		if (reset) NextState = A;
		else begin 
		case (CurrentState)
			A: begin 
				//z = 4'b0000;
				if (!w) NextState = B;
			 	else NextState = F;
			end
			B: begin 
				//z = 4'b0000; 
				if (!w) NextState = C;
				else NextState = F;
			end
			C: begin 
				//z = 4'b0000;
				if (!w) NextState = D;
				else NextState = F;
			end
			D: begin 
				//z = 4'b0000;
				if (!w) NextState = E;
				else NextState = F;
			end
			E: begin
				//z = 1;
				if (!w) NextState = E;
				else NextState = F;
			end
			F: begin 
				//z = 4'b0000; 
				if (!w) NextState = B;
				else NextState = G;
			end
			G: begin
				//z = 4'b0000;
				if (!w) NextState = B;
				else NextState = H;
			end
			H: begin 
				//z = 4'b0000; 
				if (!w) NextState = B;
				else NextState = I;
			end
			I: begin 
				//z = 1;
				if (!w) NextState = B;
				else NextState = I;
			end
			default: begin
				//z = 4'b0000;
				NextState = A;
			end
		endcase
		end
	end // state_table
	
	always_ff @( posedge Clk ) begin
			CurrentState <= NextState;   // go to the state we set
			temp  = CurrentState;
   	end  // always
	assign z = CurrentState;
endmodule

//********************************************//
//                 Testbench	                //
//********************************************//

module FSM_tb();
	logic Clk, reset, w;
	logic z;
	logic [3:0]temp;
	always begin  // 50 MHz Clock
	  Clk = 0; #25;
	  Clk = 1'b1;#25;
	end
  //reset if active high
  FSM DUT( Clk, reset, w, z, temp);
  initial begin
    // generate your input sequence
		reset =0; w = 0; #120; //edge case
			  w = 1; #50;			
		reset =1; w = 0; #200; //edge case
			  w = 1; #200;
			  w = 0; #100;
    $stop;
  end
  
endmodule

