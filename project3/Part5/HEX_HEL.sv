// Assigned 7 segment for Letter HELLO and 3 spaces
module HEX_HEL(SW, HEX00, HEX11, HEX22, HEX33, HEX44, HEX55, HEX66, HEX77);
	input [2:0]SW;
	output [0:6] HEX00, HEX11, HEX22, HEX33, HEX44, HEX55, HEX66, HEX77;
	always @ (*) begin
		case(SW)
			3'b000    : begin
				HEX77 = 7'b1111111; //space
				HEX66 = 7'b1111111; //space
				HEX55 = 7'b1111111; //space
				HEX44 = 7'b0001001; //h
				HEX33 = 7'b0000110; //e
				HEX22 = 7'b1000111; //l
				HEX11 = 7'b1000111; //l
				HEX00 = 7'b1000000; //0
				end
			3'b001    : begin
				HEX77 = 7'b1111111; //space
				HEX66 = 7'b1111111; //space
				HEX55 = 7'b0001001; //h
				HEX44 = 7'b0000110; //e
				HEX33 = 7'b1000111; //l
				HEX22 = 7'b1000111; //l
				HEX11 = 7'b1000000; //o
				HEX00 = 7'b1111111; //space
				end
			3'b010    : begin
				HEX77 = 7'b1111111; //space
				HEX66 = 7'b0001001; //h
				HEX55 = 7'b0000110; //e
				HEX44 = 7'b1000111; //l
				HEX33 = 7'b1000111; //l
				HEX22 = 7'b1000000; //o
				HEX11 = 7'b1111111;//space 
				HEX00 = 7'b1111111; //space
				end
			3'b011    : begin
				HEX77 = 7'b0001001; //h 
				HEX66 = 7'b0000110; //e
				HEX55 = 7'b1000111; //l
				HEX44 = 7'b1000111; //l
				HEX33 = 7'b1000000; //o
				HEX22 = 7'b1111111;//space
				HEX11 = 7'b1111111; //space
				HEX00 = 7'b1111111; //space
				
				end
			3'b100    : begin
				HEX77 = 7'b0000110; //e  
				HEX66 = 7'b1000111; //l
				HEX55 = 7'b1000111; //l
				HEX44 = 7'b1000000; //o
				HEX33 = 7'b1111111; //space
				HEX22 = 7'b1111111; //space
				HEX11 = 7'b1111111; //space
				HEX00 = 7'b0001001; //h
				
				end
			3'b101    : begin
				HEX77 = 7'b1000111; //l
				HEX66 = 7'b1000111; //l
				HEX55 = 7'b1000000; //o
				HEX44 = 7'b1111111; //space
				HEX33 = 7'b1111111; //space
				HEX22 = 7'b1111111; //space
				HEX11 = 7'b0001001; //h
				HEX00 = 7'b0000110; //e 
				end
			3'b110    : begin
				HEX77 = 7'b1000111; //l
				HEX66 = 7'b1000000; //o
				HEX55 = 7'b1111111; //space
				HEX44 = 7'b1111111; //space
				HEX33 = 7'b1111111; //space
				HEX22 = 7'b0001001; //h
				HEX11 = 7'b0000110; //e  
				HEX00 = 7'b1000111; //l
				end
			3'b111    : begin
				HEX77 = 7'b1000000; //o
				HEX66 = 7'b1111111; //space
				HEX55 = 7'b1111111; //space
				HEX44 = 7'b1111111; //space
				HEX33 = 7'b0001001; //h
				HEX22 = 7'b0000110; //e  
				HEX11 = 7'b1000111; //l
				HEX00 = 7'b1000111; //l
				end
		endcase
	end
endmodule