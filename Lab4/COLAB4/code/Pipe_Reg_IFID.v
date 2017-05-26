//Subject:     CO project 4 - Pipe Register
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------
module Pipe_Reg_IFID(
    clk_i,
	rst_i,
	data_i,
    Haz_IFID_i,
	data_o
	);

parameter size = 0;

input					clk_i;
input					rst_i;
input                   Haz_IFID_i;
input		[size-1: 0]	data_i;
output reg	[size-1: 0]	data_o;

always @(posedge clk_i) begin
    if(~rst_i)
        data_o <= 0;
    else if(Haz_IFID_i)
        data_o <= data_o; //keeping the same data and stall if load use hazard happens (detected from the hazard detection unit)
    else
        data_o <= data_i;
end

endmodule
