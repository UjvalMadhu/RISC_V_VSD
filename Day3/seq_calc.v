\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   //            Sequential Calculator
   // =================================================
   // Thicalculator implementation has a feedback path whereby
   // the output from one calculation will act as the 2nd operand
   // for the next calculation.
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   
   $in1[31:0] = $rand1[3:0];
   $in2[31:0] = >>1$out[31:0];
   
   $reset = *reset;
   $continue = $rand2[0];
   
   $add[31:0] = $in1 + $in2;
   $sub[31:0] = $in1 - $in2;
   $mul[31:0] = $in1 * $in2;
   $div[31:0] = $in1 / $in2;
   
   $s[1:0] = $rand3[1:0];
   
   $out[31:0] = $reset ? 32'h0000_0000 : $continue ? ($s[0] ? ($s[1] ? $div : $sub) : ($s[1] ? $mul : $add)) : >>1$out[31:0];
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
