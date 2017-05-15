// carry select adder 8bit 

// adder 1bit
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

// adder 2 bit
module adder2(s,co,a,b,ci);

output[1:0] s;
output co;
input [1:0] a,b;
input ci;
wire w1;

adder1 a0(s[0],w1,a[0],b[0],ci);
adder1 a1(s[1],co,a[1],b[1],w1);

endmodule

//adder 2bit end

// multiplexer 2
module mux2(out,sel,a,b);
input a,b,sel;
output out;
tri out;
bufif1 (out,a,sel);
bufif0 (out,b,sel);
endmodule 
//mux2 end

// carry ripple adder 4bit
module carryselect4(s,co,a,b,ci,c_0,c_1);
//reg c_0=0;
//reg c_1=1;
output [3:0] s;
output co;
input [3:0] a,b;
input ci,c_0,c_1;
wire c2,w1,w2,w3;
wire [1:0] s_0,s_1;

adder2 a0(s[1:0],c2,a[1:0],b[1:0],ci);
adder2 a1_0(s_0,w1,a[3:2],b[3:2],c_0);
adder2 a1_1(s_1,w2,a[3:2],b[3:2],c_1);

mux2 m0(s[2],c2,s_1[0],s_0[0]);
mux2 m1(s[3],c2,s_1[1],s_0[1]);

and(w3,w2,c2);
or(co,w1,w3);
endmodule

module carryselect8(s,co,a,b,ci,c_0,c_1);
output [7:0] s;
output co;
input [7:0] a,b;
input ci,c_0,c_1;
wire  c4;
carryselect4 cs0(s[3:0],c4,a[3:0],b[3:0],ci,c_0,c_1);
carryselect4 cs1(s[7:4],co,a[7:4],b[7:4],c4,c_0,c_1);
endmodule
