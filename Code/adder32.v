
//adder 32

module adder32(s, co, a, b, ci);
   input [31:0] a;
   input [31:0] b;	
   output[31:0] s;
   output co;
   input ci;
   wire c1, c2, c3;
   
   adder8 a0(s[7:0], c1, a[7:0], b[7:0], ci);
   adder8 a1(s[15:8], c2, a[15:8], b[15:8], c1);
   adder8 a2(s[23:16], c3, a[23:16], b[23:16], c2);
   adder8 a3(s[31:24], co, a[31:24], b[31:24], c3);
endmodule // adder32 end
