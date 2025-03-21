\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   //              Pythagoras's Theorem
   // =================================================
   // Takes two inputs a & b and claculates the hypotenuse of the
   // right triangle formed with a & b as base and altitude. 
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   $a[31:0] = $rand1[3:0];
   $a[31:0] = $rand2[3:0];
   
   @1
      $aa[31:0] = $a * $a;
      $bb[31:0] = $b * $b;
   
   @2
      $hh[31:0] = $aa + $bb;
   
   @3
      $h[31:0] = sqrt($hh);
   
   *passed = *cyc_cnt > 60;
   *failed = 1'b0;
\SV
   endmodule
