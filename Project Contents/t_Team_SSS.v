`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 19:49:35
// Design Name: 
// Module Name: t_consilium_ps1
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


module t_Team_SSS;
wire[16:0] t_out;
reg t_clock,t_reset;
reg [4:0]t_a;
Team_SSS team_sss(t_out,t_a,t_clock,t_reset);
initial
begin
#400 $finish;
end
initial
begin
t_a=5'b01111;
t_clock=1'b0;
t_reset=1'b0;
#10
t_clock=~t_clock;
#10
t_reset=~t_reset;
t_clock=~t_clock;
forever
#10 t_clock=~t_clock;
end
initial
begin
#390
$display("The salary of the %dth level is %d",t_a,t_out);
end
endmodule
