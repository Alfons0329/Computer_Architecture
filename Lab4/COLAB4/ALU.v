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
	zero_o,
	shamt,
	rst_n
	);

//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;
input  [5-1:0] shamt;
input rst_n;
output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
reg 	 [32-1:0]  src1_tmp,src2_tmp;
reg             zero_o;
always@(*)
begin
	if(rst_n)
	begin
		if(ctrl_i==4'd9)//beq condition
			zero_o = (result_o == 0) ? 1 : 0 ;
		else if(ctrl_i==4'd10)//bne
			zero_o = (result_o == 0) ? 0 : 1 ;
//2017/5/4
        else if(ctrl_i==15) //BLE
            zero_o = (src1_i<=src2_i) ? 1 : 0 ;
        else if(ctrl_i==16) //BLT
            zero_o = (src1_i<src2_i) ? 1 : 0 ;
        else if(ctrl_i==15) //BNEZ
            zero_o = (src1_i!=0) ? 1 : 0 ;
		else
			zero_o = 0;
	end
	else
		zero_o = 0;
end
//Parameter
//Main function
always@(*)
begin
	if(rst_n)
	begin
		case(ctrl_i) //4'd0~ SEE ALU CONTROLLER FOR INSTRUCTION ENCODING/DECODING INFO.
		4'd0:result_o = src1_i+src2_i;//add
		4'd1:result_o = src1_i-src2_i;//sub
		4'd2:result_o = src1_i&src2_i;//and
		4'd3:result_o = src1_i|src2_i;//or
		4'd4:result_o = src1_i<src2_i?1:0;//slt
		4'd5:result_o = src1_i<src2_i?1:0;//sltu
		4'd6:result_o = src2_i<<shamt;//sll
		4'd7:result_o = src2_i*(65536);//lui
		4'd8:result_o = src1_i|src2_i;//ori
		4'd9:result_o = src1_i-src2_i;//beq
		4'd10:result_o = src1_i-src2_i;//bne
		4'd11:result_o = src2_i<<src1_i;//sllv
//2017/5/4
        12:result_o = src1_i+src2_i; //lw
        13:result_o = src1_i+src2_i; //sw
        14:result_o = src1_i*src2_i; //mul
		default:result_o = 0;
		endcase
	end
	else
		result_o=0;

end

endmodule
