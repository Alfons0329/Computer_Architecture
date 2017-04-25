//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,//rs
	src2_i,//rt
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
reg 	 [32-1:0]  src1_tmp,src2_tmp;
wire             zero_o;
assign zero_o = (result_o == 0) ? 1 : 0 ;
//Parameter
//Main function
always@(*) 
begin
	case(ctrl_i) //4'd0~
	4'd0:result_o = src1_i+src2_i;//add
	4'd1:result_o = src1_i-src2_i;//sub
	4'd2:result_o = src1_i&src2_i;//and	
	4'd3:result_o = src1_i|src2_i;//or
	4'd4:result_o = src1_i<src2_i?1:0;//slt
	4'd5://sltu
	begin
		if(src1_i<0)
			src1_tmp=-src1_i;
		else if(src2_i<0)
			src2_tmp=-src2_i;
		
		result_o = src1_tmp<src2_tmp?1:0;
	end
	4'd6:result_o = src1_i<<src2_i;//sll(sllv)
	4'd7:result_o = src2_i<<16;//lui
	4'd8:result_o = src1_i|src2_i;//ori
	default:result_o = 0;
	endcase
end

endmodule
