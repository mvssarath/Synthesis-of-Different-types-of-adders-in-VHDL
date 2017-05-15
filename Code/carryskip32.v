module carryskip32 (s,co,a,b,ci);
output [31:0] s;
output co;
input [31:0] a;
input [31:0] b;
input ci;
wire c8,c16,c24;

carryskip8 cs0(s[7:0],c8,a[7:0],b[7:0],ci);
carryskip8 cs1(s[15:8],c16,a[15:8],b[15:8],c8);
carryskip8 cs3(s[23:16],c24,a[23:16],b[23:16],c16);
carryskip8 cs4(s[31:24],co,a[31:24],b[31:24],c24);

endmodule
