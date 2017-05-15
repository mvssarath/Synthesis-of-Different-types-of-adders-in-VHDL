//full adder 1bit
module adder1( s,co,a,b,ci);
output s,co;
input a,b,ci;
wire o0,o1,o2;
xor(s,a,b,ci);
or(o0,a,b);
or(o1,b,ci);
or(o2,ci,a);
and(co,o0,o1,o2);
endmodule //fulladder 1bit

//full adder 4bit 

// mux2 
module mux2(out,sel,a,b);
input a,b,sel;
output out;
tri out;
bufif1 (out,a,sel);
bufif0 (out,b,sel);
endmodule //mux2 end


// carryskip adder 4bit 
module carryskip4(s,co,a,b,ci);
wire [3:0] p;
output [3:0] s;
output co;
input [3:0] a;
input [3:0] b;
input ci;
wire p3_0,w1,w2,w3,w4;
xor (p[0],a[0],b[0]);
xor (p[1],a[1],b[1]);
xor (p[2],a[2],b[2]);
xor (p[3],a[3],b[3]);
and (p3_0,p);
adder1 a0(s[0],w1,a[0],b[0],ci);
adder1 a1(s[1],w2,a[1],b[1],w1);
adder1 a2(s[2],w3,a[2],b[2],w2);
adder1 a3(s[3],w4,a[3],b[3],w3);
mux2 m0(co,p3_0,ci,w4);

endmodule
//carryskip adder 4bit end

module carryskip8 (s,co,a,b,ci);
output [7:0] s;
output co;
input [7:0] a;
input [7:0] b;
input ci;
wire c4;

carryskip4 cs0(s[3:0],c4,a[3:0],b[3:0],ci);
carryskip4 cs1(s[7:4],co,a[7:4],b[7:4],c4);
endmodule


