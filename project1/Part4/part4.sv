// Your Comments Go Here
module part4( HEX0, SW, LEDR);
	input [2:0] SW;
	output [2:0] LEDR;	
	output reg [6:0] HEX0;
	reg [6:0] a;
	assign LEDR = SW;
	always @ (SW) begin
		case(SW)
			3'b000    : HEX0 = 7'b0001001; 
			3'b001    : HEX0 = 7'b0000110;
			3'b010    : HEX0 = 7'b1000111;
			3'b011    : HEX0 = 7'b1000000;
		endcase
	end	
endmodule 