//generate and propagete block
module gandp(g,p,a,b);
input a,b;
output g,p;
xor(p,a,b);
and(g,a,b);
endmodule
// end of generate and propagate

//declaring a universal grey cell
module greycell(g,g_kj,p_ik,g_ik);
input g_kj,p_ik,g_ik;
output g;
wire w1;

and(w1,g_kj,p_ik);
or(g,w1,g_ik);
endmodule
//end of universal grey cell


// declaring a universal black cell 
module blackcell(g,p,p_kj,g_kj,p_ik,g_ik);
input p_kj,g_kj,p_ik,g_ik;
output g,p;
wire w1;

and(w1,g_kj,p_ik);
or(g,w1,g_ik);
and(p,p_ik,p_kj);
endmodule
//end of universal black cell

module koggstone8(s,co,a,b,ci);
input [7:0] a,b;
input ci;
output co;
output [7:0] s;

wire [7:0] g,p;
wire gc_s1_g;
wire [1:0] gc_s2_g;
wire [3:0] gc_s3_g;
wire [6:0] bc_s1_g,bc_s1_p;
wire [4:0] bc_s2_g,bc_s2_p;
wire bc_s3_g,bc_s3_p;


// generating g and p for input bits
gandp gp0(g[0],p[0],a[0],b[0]);
gandp gp1(g[1],p[1],a[1],b[1]);
gandp gp2(g[2],p[2],a[2],b[2]);
gandp gp3(g[3],p[3],a[3],b[3]);
gandp gp4(g[4],p[4],a[4],b[4]);
gandp gp5(g[5],p[5],a[5],b[5]);
gandp gp6(g[6],p[6],a[6],b[6]);
gandp gp7(g[7],p[7],a[7],b[7]);


// using grey and black cells and grey cells to generate co

//stage 1
greycell gc0(gc_s1_g,ci,p[0],g[0]);
blackcell bc0(bc_s1_g[0],bc_s1_p[0],p[0],g[0],p[1],g[1]);
blackcell bc1(bc_s1_g[1],bc_s1_p[1],p[1],g[1],p[2],g[2]);
blackcell bc2(bc_s1_g[2],bc_s1_p[2],p[2],g[2],p[3],g[3]);
blackcell bc3(bc_s1_g[3],bc_s1_p[3],p[3],g[3],p[4],g[4]);
blackcell bc4(bc_s1_g[4],bc_s1_p[4],p[4],g[4],p[5],g[5]);
blackcell bc5(bc_s1_g[5],bc_s1_p[5],p[5],g[5],p[6],g[6]);
blackcell bc6(bc_s1_g[6],bc_s1_p[6],p[6],g[6],p[7],g[7]);

// stage 2

greycell gc1(gc_s2_g[0],ci,bc_s1_p[0],bc_s1_g[0]);
greycell gc2(gc_s2_g[1],gc_s1_g,bc_s1_p[1],bc_s1_g[1]);
blackcell bc7(bc_s2_g[0],bc_s2_p[0],bc_s1_p[0],bc_s1_g[0],bc_s1_p[2],bc_s1_g[2]);
blackcell bc8(bc_s2_g[1],bc_s2_p[1],bc_s1_p[1],bc_s1_g[1],bc_s1_p[3],bc_s1_g[3]);
blackcell bc9(bc_s2_g[2],bc_s2_p[2],bc_s1_p[2],bc_s1_g[2],bc_s1_p[4],bc_s1_g[4]);
blackcell bc10(bc_s2_g[3],bc_s2_p[3],bc_s1_p[3],bc_s1_g[3],bc_s1_p[5],bc_s1_g[5]);
blackcell bc11(bc_s2_g[4],bc_s2_p[4],bc_s1_p[4],bc_s1_g[4],bc_s1_p[6],bc_s1_g[6]);

//stage 3
greycell gc3(gc_s3_g[0],ci,bc_s2_p[0],bc_s2_g[0]);
greycell gc4(gc_s3_g[1],gc_s1_g,bc_s2_p[1],bc_s2_g[1]);
greycell gc5(gc_s3_g[2],gc_s2_g[0],bc_s2_p[2],bc_s2_g[2]);
greycell gc6(gc_s3_g[3],gc_s2_g[1],bc_s2_p[3],bc_s2_g[3]);
blackcell bc12(bc_s3_g,bc_s3_p,bc_s2_p[0],bc_s2_g[0],bc_s2_p[4],bc_s2_g[4]);


// carry out
greycell gc7(co,ci,bc_s3_p,bc_s3_g);

// sum
xor x0(s[0],ci,p[0]);
xor x1(s[1],gc_s1_g,p[1]);
xor x2(s[2],gc_s2_g[0],p[2]);
xor x3(s[3],gc_s2_g[1],p[3]);
xor x4(s[4],gc_s3_g[0],p[4]);
xor x5(s[5],gc_s3_g[1],p[5]);
xor x6(s[6],gc_s3_g[2],p[6]);
xor x7(s[7],gc_s3_g[3],p[7]);

endmodule

//koggstone adder 32bit adder with 4 8bit koggstone adder modules
module koggstone32(s,co,a,b,ci);
input [31:0] a,b;
input ci;
output co;
output [31:0] s;

koggstone8 ks0(s[7:0],c8,a[7:0],b[7:0],ci);
koggstone8 ks1(s[15:8],c16,a[15:8],b[15:8],c8);
koggstone8 ks2(s[23:16],c24,a[23:16],b[23:16],c16);
koggstone8 ks3(s[31:24],co,a[31:24],b[31:24],c24);
endmodule

