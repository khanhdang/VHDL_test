`define CLK_PERIOD 2000

module TB_detector110;
   parameter _QUIT = 1;
   reg clk;
   reg rst_n;
   reg aa;
   wire ww;

   detector110 UUT
     (
      .a     (aa),
      .clk   (clk),
      .reset (rst_n),
      .w     (ww)
      );

   initial begin
      $dumpfile("detector110.vcd");
      $dumpvars(0, TB_detector110);

      rst_n = 1'b1;
      clk = 1'b0;
      #(2*`CLK_PERIOD-1);
      rst_n = 1'b0;
      #(1*`CLK_PERIOD-1);
      aa = 1'b1;
      #21;
      aa = 1'b0;
      #19;
      aa = 1'b1;
      #31;
      aa = 1'b0;
      
      if (_QUIT == 1)
	$finish;
      else 
	$stop;
   end

   always #(`CLK_PERIOD/2) clk = ~clk;
   // always #(`CLK_PERIOD/2) clk = 0;
   
		    
endmodule // TB_detector110
