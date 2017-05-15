`timescale 1ns/10ps

module stimulus;

reg ci;
reg si;
reg [3:0] a,b;

wire co;
wire [7:0] p;

arraymultiplier mul1(p,co,a,b,si,ci);
   

initial begin
	$shm_open("shm.db",1); // Opens a waveform database
	$shm_probe("AS");    // Saves all signals to database
	#1000 $finish;		
	$shm_close();   // Closes the waveform database
end

// Stimulate the Input Signals
initial begin
	a = 5;
	b = 10;
	ci =0;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 37;
	b = 48;
	ci = 0;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 125;
	b = 110;
	ci = 1;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 63;
	b = 211;
	ci = 0;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 122;
	b = 11;
	ci = 1;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 245;
	b = 2;
	ci = 0;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 3;
	b = 90;
	ci = 1;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 100;
	b = 200;
	ci = 0;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);

	a = 127;
	b = 127;
	ci = 1;
	si =0;
	#100 $display("At Time: %d  Product=%d Carry=%d",$time,p,co);
end

endmodule // stimulus
