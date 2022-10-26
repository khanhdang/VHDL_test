/*
###############################################################
#  Generated by:      Cadence Innovus 18.13-s088_1
#  OS:                Linux x86_64(Host ID zxp007.u-aizu.ac.jp)
#  Generated on:      Wed Oct 26 13:48:56 2022
#  Design:            detector110
#  Command:           saveNetlist ./output_files/detector110.v
###############################################################
*/
// Generated by Cadence Genus(TM) Synthesis Solution 18.13-s027_1
// Generated on: Oct 26 2022 12:44:51 JST (Oct 26 2022 03:44:51 UTC)
// Verification Directory fv/detector110 
module detector110 (
	a, 
	clk, 
	reset, 
	w);
   input a;
   input clk;
   input reset;
   output w;

   // Internal wires
   wire [1:0] current;
   wire UNCONNECTED;
   wire n_0;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;

   DFF_X1 \current_reg[0]  (.D(n_7),
	.CK(clk),
	.Q(current[0]),
	.QN(n_3));
   DFF_X1 \current_reg[1]  (.D(n_8),
	.CK(clk),
	.Q(current[1]),
	.QN(UNCONNECTED));
   OAI21_X1 g218 (.A(n_6),
	.B1(n_5),
	.B2(n_3),
	.ZN(n_8));
   OAI222_X1 g217 (.A1(n_6),
	.A2(a),
	.B1(n_5),
	.B2(current[0]),
	.C1(n_0),
	.C2(n_4),
	.ZN(n_7));
   OR2_X1 g219 (.A1(current[1]),
	.A2(n_4),
	.ZN(n_5));
   NAND3_X1 g220 (.A1(current[1]),
	.A2(n_3),
	.A3(n_2),
	.ZN(n_6));
   NAND2_X1 g221 (.A1(n_2),
	.A2(a),
	.ZN(n_4));
   INV_X1 g222 (.A(n_0),
	.ZN(w));
   NAND2_X1 g223 (.A1(current[1]),
	.A2(current[0]),
	.ZN(n_0));
   INV_X1 g224 (.A(reset),
	.ZN(n_2));
endmodule

