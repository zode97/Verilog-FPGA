// Shahzoda Staroverov
// Moves HELLO letters to the right
module part5( HEX0,HEX1, HEX2, HEX3, HEX4, SW, LEDR);
	input [2:0] SW;
	output [2:0] LEDR;	
	output reg [6:0] HEX0;
	output reg [6:0] HEX1;
	output reg [6:0] HEX2;
	output reg [6:0] HEX3;
	output reg [6:0] HEX4;
	assign LEDR = SW;
	always @ (SW) begin
		case(SW)
			3'b000    : begin 
				HEX4 = 7'b0001001; //h
				HEX3 = 7'b0000110; //es
				HEX2 = 7'b1000111; //l
				HEX1 = 7'b1000111; //l
				HEX0 = 7'b1000000; //0
				end
			3'b001    : begin
				HEX4 = 7'b0000110; //e
				HEX3 = 7'b1000111; //l
				HEX2 = 7'b1000111; //l
				HEX1 = 7'b1000000; //o
				HEX0 = 7'b0001001; //h
				end
			3'b010    : begin
				HEX4 = 7'b1000111; //l
				HEX3 = 7'b1000111; //l
				HEX2 = 7'b1000000; //o
				HEX1 = 7'b0001001; //h
				HEX0 = 7'b0000110; //e
				end
			3'b011    : begin
				HEX4 = 7'b1000111; //l
				HEX3 = 7'b1000000; //o
				HEX2 = 7'b0001001; //h
				HEX1 = 7'b0000110; //e
				HEX0 = 7'b1000111; //l
				end
			3'b100    : begin
				HEX4 = 7'b1000000; //o
				HEX3 = 7'b0001001; //h
				HEX2 = 7'b0000110; //e
				HEX1 = 7'b1000111; //l
				HEX0 = 7'b1000111; //l
				end
		endcase
	end	
endmodule 