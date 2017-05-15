// adder 1 bit
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
// 1st block in a array multiplier
module square(so,co,sin,a,b,ci);

input a,b,ci,sin;
output co,so;

wire w1;

and an0(w1,a,b);
adder1 a0(so,co,w1,sin,ci);

endmodule

module rect(so,co,a,b,ci);
input a,b,ci;
output so,co;



adder1 a0(so,co,a,b,ci);
endmodule

module arraymultiplier(p,co,a,b,si,ci);

input [3:0] a,b;
input ci,si;
output [7:0] p;
output co;
wire [11:0] s_interm;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c118,c19;

//1st line
square sq1(p[0],c1,si,a[0],b[0],ci);
square sq2(s_interm[0],c2,si,a[1],b[0],ci);
square sq3(s_interm[1],c3,si,a[2],b[0],ci);
square sq4(s_interm[2],c4,si,a[3],b[0],ci);
//2nd line
square sq5(p[1],c5,s_interm[0],a[0],b[1],c1);
square sq6(s_interm[3],c6,s_interm[1],a[1],b[1],c2);
square sq7(s_interm[4],c7,s_interm[2],a[2],b[1],c3);
square sq8(s_interm[5],c8,si,a[3],b[1],c4);
//3rd line
square sq9(p[2],c9,s_interm[3],a[0],b[2],c5);
square sq10(s_interm[6],c10,s_interm[4],a[1],b[2],c6);
square sq11(s_interm[7],c11,s_interm[5],a[2],b[2],c7);
square sq12(s_interm[8],c12,si,a[3],b[2],c8);
//4th line
square sq13(p[3],c13,s_interm[6],a[0],b[3],c9);
square sq14(s_interm[9],c14,s_interm[7],a[1],b[3],c10);
square sq15(s_interm[10],c15,s_interm[8],a[2],b[3],c11);
square sq16(s_interm[11],c16,si,a[3],b[3],c12);
//5th line
rect rc1(p[4],c17,s_interm[9],c13,ci);
rect rc2(p[5],c18,s_interm[10],c14,c17);
rect rc3(p[6],c19,s_interm[11],c15,c18);
rect rc4(p[7],co,si,c16,c19);
endmodule