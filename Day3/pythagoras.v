\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   //               Pythagoras's Theorem
   // =================================================
   // Takes two inputs a and b and calculates the hypotenuse of a 
   // right triangle formed with a & b as altitude and base.  
   
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
	`include "sqrt32.v" 
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   
   |calc
      @1
         $a[7:0] = $rand1[3:0];
         $b[7:0] = $rand2[3:0];
         $aa[15:0] = $a[7:0] ** 2;
         $bb[15:0] = $b[7:0] ** 2;
      @2
         $hh[15:0] = $aa + $bb;
      @3
         $h[7:0]   = sqrt($hh);
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
