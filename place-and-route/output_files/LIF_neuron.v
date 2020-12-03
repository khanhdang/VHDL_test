/*
###############################################################
#  Generated by:      Cadence Innovus 18.13-s088_1
#  OS:                Linux x86_64(Host ID zxp007.u-aizu.ac.jp)
#  Generated on:      Thu Dec  3 16:08:30 2020
#  Design:            detector110
#  Command:           saveNetlist ./output_files/LIF_neuron.v
###############################################################
*/
// Generated by Cadence Genus(TM) Synthesis Solution 18.13-s027_1
// Generated on: Dec  3 2020 15:54:30 JST (Dec  3 2020 06:54:30 UTC)
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
   wire CTS_1;
   wire [1:0] current;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_8;
   wire n_9;

   INV_X1 g263 (.A(clk),
	.ZN(CTS_1));
   DFF_X1 \current_reg[0]  (.D(n_9),
	.CK(CTS_1),
	.Q(n_0),
	.QN(current[0]));
   NOR2_X1 g256 (.A1(n_8),
	.A2(reset),
	.ZN(n_9));
   MUX2_X1 g258 (.A(n_5),
	.B(n_4),
	.S(a),
	.Z(n_8));
   DFF_X1 \current_reg[1]  (.D(n_6),
	.CK(CTS_1),
	.Q(n_2),
	.QN(current[1]));
   AOI21_X1 g259 (.A(reset),
	.B1(n_5),
	.B2(n_1),
	.ZN(n_6));
   HA_X1 g260 (.A(n_2),
	.B(n_0),
	.CO(w),
	.S(n_4));
   NAND2_X1 g262 (.A1(n_2),
	.A2(current[0]),
	.ZN(n_5));
   NAND3_X1 g261 (.A1(n_0),
	.A2(current[1]),
	.A3(a),
	.ZN(n_1));
endmodule

