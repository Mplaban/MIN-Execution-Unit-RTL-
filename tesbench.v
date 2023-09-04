module testbench();

reg clk;
reg reset;
reg [15:0] pc_in,ire_in,mem1_in,mem2_in,mem3_in;

wire signed [15:0] pc;
wire signed [15:0] irf;
wire signed [15:0] ire;
wire signed [15:0] t1;
wire signed [15:0] t2;
wire signed [15:0] rx;
wire signed [15:0] ry;
wire signed [15:0] di;
wire signed [15:0] do;
wire signed [15:0] a;
wire signed [15:0] b;
wire signed [15:0] ao;
reg [15:0] r0;
reg [15:0] r1;
reg [15:0] r2;
wire [17:0] cntrl_wrd;
wire z;
wire v;
wire n;
wire c;
wire [3:0] cc;

assign cc = {z,v,n,c};



main m(clk,pc_in,ire_in,mem1_in,mem2_in,mem3_in,pc,ire,t1,t2,rx,ry,a,b,di,do,irf,reset,cntrl_wrd,ao,r0,r1,r2,z,v,n,c);


initial begin
clk=0;
r0=0;
r1=0;
r2=2;
pc_in=0;
ire_in=16'b0000010001100010;
mem1_in=4;
mem2_in=16'h3197;
mem3_in=16'h0055;
repeat(16) #10 clk=~clk;
end

initial begin
reset=0;
#10
reset=1;
#10
reset=0;
end

initial begin
$monitor("time=%t clock=%d pc=%h ire=%h irf=%h r1=%h r2=%h cc=%b",$time,clk,pc,ire,irf,r1,r2,cc);
end

always@(posedge clk)
begin
if(reset==0)
begin
r1 <= rx;
r2 <= ry;
end
end

endmodule
