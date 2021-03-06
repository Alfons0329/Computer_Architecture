//Subject:     CO project 2 - PC
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module ProgramCounter(
    clk_i,
	rst_i,
    pc_control,
	pc_in_i,
	pc_out_o
	);

//I/O ports
input           clk_i;
input	        rst_i;
input 			pc_control;
input  [32-1:0] pc_in_i;
output [32-1:0] pc_out_o;

//Internal Signals
reg    [32-1:0] pc_out_o;

//Parameter


//Main function
always @(posedge clk_i) begin
    if(~rst_i)
	    pc_out_o <= 0;
	else if(pc_control)
	    pc_out_o <= pc_in_i;
    else //if(!pc_control)
        pc_out_o <= pc_out_o; //pc_control from the Hazard_detection_unit, do nop when load use data hazard is detected
end

endmodule
