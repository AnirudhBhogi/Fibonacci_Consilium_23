`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 07:06:14
// Design Name: 
// Module Name: consilium_ps1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module comparator(output out,input [4:0]b,a);
assign out=a>b;

endmodule

module adder(output [16:0]out,input [16:0]s,c);
assign out=s+c;
endmodule

module shift_register1(output reg [16:0]out, input [16:0]d,input s0,s1,clock,reset);
always @(posedge clock)
begin
if(reset==1'b0)
out<=4'b0101;
else
begin
if(s0==1'b1 && s1==1'b1)
out<=d;
else if(s0==1'b0 && s1==1'b0)
out<=out;
end
end
endmodule

module shift_register2(output reg [16:0]out, input [16:0]d,input s0,s1,clock,reset);
always @(posedge clock)
begin
if(reset==1'b0)
out<=4'b0111;
else
begin
if(s0==1'b1 && s1==1'b1)
out<=d;
else if(s0==1'b0 && s1==1'b0)
out<=out;
end
end
endmodule

module syn_counter(output reg[4:0]out,input ent,clock);
initial out=5'b00000;
always @(posedge clock)
begin
if(ent)
out<=out+1'b1;
end
endmodule


module Team_SSS(output [16:0]sr1_out,input [4:0]a,input clock,reset);
wire c1_out;
wire [4:0]sc1_out;
wire [16:0]sr2_out;
wire [16:0]a1_out;
shift_register2 sr2(sr2_out,a1_out,c1_out,c1_out,clock,reset);
shift_register1 sr1(sr1_out,sr2_out,c1_out,c1_out,clock,reset);
adder a1(a1_out,sr1_out,sr2_out);
comparator c1(c1_out,sc1_out,a);
syn_counter sc1(sc1_out,c1_out,clock);
endmodule
