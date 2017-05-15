
module adder1(s, co, a, b, ci);

output s, co;
input  a, b, ci;
wire   o0, o1, o2;

xor(s, a, b, ci);
or(o0, a, b);
or(o1, b, ci);
or(o2, ci, a);
and(co, o0, o1, o2);
   
endmodule // adder


// multiplexer 2
module mux2(out,sel,a,b);
input a,b,sel;
output out;
tri out;
bufif1 (out,a,sel);
bufif0 (out,b,sel);
endmodule 
//mux2 end

module carryripple8(s,co,a,b,ci);
input [7:0] a,b;
input ci;
output [7:0] s;
output co;
wire c1,c2,c3,c4,c5,c6,c7;

adder1 a1(s[0],c1,a[0],b[0],ci);
adder1 a2(s[1],c2,a[1],b[1],c1);
adder1 a3(s[2],c3,a[2],b[2],c2);
adder1 a4(s[3],c4,a[3],b[3],c3);
adder1 a5(s[4],c5,a[4],b[4],c4);
adder1 a6(s[5],c6,a[5],b[5],c5);
adder1 a7(s[6],c7,a[6],b[6],c6);
adder1 a8(s[7],co,a[7],b[7],c7);

endmodule

module carryselect32(s,co,a,b,ci,c_0,c_1);

output [31:0] s;
output co;
input [31:0] a,b;
input ci,c_0,c_1;
wire [23:0] s_0,s_1;
wire c16_0,c16_1,c24_0,c24_1,c32_0,c32_1;
wire c8,c16,c24;
wire w16,w24,w32;
carryripple8 cr0(s[7:0],c8,a[7:0],b[7:0],ci);

carryripple8 cr1_0(s_0[7:0],c16_0,a[15:8],b[15:8],c_0);
carryripple8 cr1_1(s_1[7:0],c16_1,a[15:8],b[15:8],c_1);

mux2 m1_8(s[8],c8,s_1[0],s_0[0]);
mux2 m1_9(s[9],c8,s_1[1],s_0[1]);
mux2 m1_10(s[10],c8,s_1[2],s_0[2]);
mux2 m1_11(s[11],c8,s_1[3],s_0[3]);
mux2 m1_12(s[12],c8,s_1[4],s_0[4]);
mux2 m1_13(s[13],c8,s_1[5],s_0[5]);
mux2 m1_14(s[14],c8,s_1[6],s_0[6]);
mux2 m1_15(s[15],c8,s_1[7],s_0[7]);
and an1(w16,c16_1,c8);
or or1(c16,w16,c16_0);

carryripple8 cr2_0(s_0[15:8],c24_0,a[23:16],b[23:16],c_0);
carryripple8 cr2_1(s_1[15:8],c24_1,a[23:16],b[23:16],c_1);

mux2 m1_16(s[16],c16,s_1[8],s_0[8]);
mux2 m1_17(s[17],c16,s_1[9],s_0[9]);
mux2 m1_18(s[18],c16,s_1[10],s_0[10]);
mux2 m1_19(s[19],c16,s_1[11],s_0[11]);
mux2 m1_20(s[20],c16,s_1[12],s_0[12]);
mux2 m1_21(s[21],c16,s_1[13],s_0[13]);
mux2 m1_22(s[22],c16,s_1[14],s_0[14]);
mux2 m1_23(s[23],c16,s_1[15],s_0[15]);

and an2(w24,c24_1,c16);
or or2(c24,w24,c24_0);

carryripple8 cr3_0(s_0[23:16],c32_0,a[31:24],b[31:24],c_0);
carryripple8 cr3_1(s_1[23:16],c32_1,a[31:24],b[31:24],c_1);

mux2 m1_24(s[24],c24,s_1[16],s_0[16]);
mux2 m1_25(s[25],c24,s_1[17],s_0[17]);
mux2 m1_26(s[26],c24,s_1[18],s_0[18]);
mux2 m1_27(s[27],c24,s_1[19],s_0[19]);
mux2 m1_28(s[28],c24,s_1[20],s_0[20]);
mux2 m1_29(s[29],c24,s_1[21],s_0[21]);
mux2 m1_30(s[30],c24,s_1[22],s_0[22]);
mux2 m1_31(s[31],c24,s_1[23],s_0[23]);

and an3(w32,c32_1,c24);
or or3(co,w32,c32_0);
endmodule



