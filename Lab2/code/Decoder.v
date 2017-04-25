//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg				savePC_o;
//Parameter


//Main function
always@(*) begin
	case(instr_op_i)
		6'h0: 
		begin //ADD,SUB,MUL,JR,SLLV,SLL,The R type instrucitons
			ALU_op_o = 3'b010;
			ALUSrc_o = 0;
			RegWrite_o = 1;
			savePC_o = 0;
			RegDst_o = 1;
			Branch_o = 0;
		end
		6'h8: 
		begin //ADDI
			ALU_op_o = 3'b000;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			savePC_o = 0;
			RegDst_o = 0;
			Branch_o = 0;
		end
		6'h4: 
		begin //BEQ
			ALU_op_o = 3'b001;
			ALUSrc_o = 0;
			RegWrite_o = 0;
			savePC_o=0;
			RegDst_o = 0;
			Branch_o = 1;
		end
		6'h5: 
		begin //BNE;
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			RegWrite_o = 0;
			savePC_o=0;
			RegDst_o = 0;
			Branch_o = 1;
		end
		6'hd: 
		begin //ORI
			ALU_op_o = 3'b100;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			savePC_o=0;
			RegDst_o = 0;
			Branch_o = 0;
		end
			6'hf: 
			begin //LUI
			ALU_op_o = 3'b101;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			savePC_o = 0;
			RegDst_o = 0;
			Branch_o = 0;		
		end	
	endcase
end

endmodule





                    
                    