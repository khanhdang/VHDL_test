	module detector110  (
  input a,
  input clk,
  input reset,
  output w
);


parameter S0=2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
parameter S3=2'b11;
reg [1:0] current;


always @ (posedge clk) begin
  if (reset == 1'b1) begin
    current <= S0;
  end else begin
      case (current)
        S0:
          if (a == 1'b1)
            current <= S1;
          else
            current <= S0;
        S1:
          if (a == 1'b1)
            current <= S2;
          else
            current <= S0;
        S2:
          if (a == 1'b1)
            current <= S2;
          else
            current <=S3;
        S3:
          if (a == 1'b1)	
            current <= S1;
          else
            current <= S0;
        default: current <= S0;
      endcase
    end
end

assign w = (current==S3)? 1'b1: 1'b0;

endmodule
