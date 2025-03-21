\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   //              Sequential Calculator
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   $continue = 1'b1;
   $in1[31:0] = $rand2[3:0];
   $s[3:0]   = $rand3[3:0];
   // S = 00 => ADD
   // S = 01 => SUB
   // S = 10 => MUL
   // S = 11 => DIV
   
   $in2[31:0] = >>1$out[31:0]; 
   
   $add[31:0] = $in1 + $in2;
   $sub[31:0] = $in1 - $in2;
   $mul[31:0] = $in1 * $in2;
   $div[31:0] = $in1 / $in2; 
   
   $out[31:0] = $reset ? 32'h0000_0000 : 
                $continue ? ($s[0] ? ($s[1] ? $div : $sub ) : ($s[1] ? $mul : $add) ) : $in2[31:0]; 
   
   
   
   *passed = *cyc_cnt > 60;
   *failed = 1'b0;
\SV
   endmodule
