module detector110 (
  input wire  a, clk, reset,
  output wire w);

   reg [1:0] state;
   parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
   
   assign w = (state == S3) ? 1'b1 : 1'b0;
   
   always @(posedge clk) begin
      if (reset) begin
	 state = S0;
      end else begin
	 case (state)
	   S0: begin
	      if (a) state = S1;
	      else state = S0;
	   end
	   S1: begin
	      if (a) state = S2;
	      else state = S0;
	   end
	   S2: begin
	      if (a) state = S2;
	      else state = S3;
	   end
	   S3: begin
	      if (a) state = S1;
	      else state = S0;
	   end
	   default: begin
	      state = S0;
	   end
	 endcase
      end
   end
endmodule   

	 
