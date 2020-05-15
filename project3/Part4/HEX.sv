module HEX(Q, HEX00);
	//4bit value to BCD
	input [3:0]Q;
	output logic[6:0]HEX00;
	always @(*) begin
		case (Q)
		  4'b0000 : HEX00 = 7'b1000000;// 0 
		  4'b0001 : HEX00 = 7'b1111001;// 1
		  4'b0010 : HEX00 = 7'b0100100;// 2
		  4'b0011 : HEX00 = 7'b0110000;// 3 
		  4'b0100 : HEX00 = 7'b0011001;// 4
		  4'b0101 : HEX00 = 7'b0010010;// 5
		  4'b0110 : HEX00 = 7'b0000010;// 6
		  4'b0111 : HEX00 = 7'b1111000;// 7
		  4'b1000 : HEX00 = 7'b0000000;// 8
		  4'b1001 : HEX00 = 7'b0010000;// 9
		  default : HEX00 = 7'b1000000;// 0
		endcase
	end
endmodule