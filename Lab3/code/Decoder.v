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
	Branch_o,
    BranchType_o,
    Jump_o,
    MemRead_o,
    MemWrite_o,
    MemtoReg_o
	);

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [5-1:0] ALU_op_o;
output         ALUSrc_o;
output [2-1:0] RegDst_o;
//0 i type 1 r type 2 save PC+8
output         Branch_o;
output [3-1:0] BranchType_o;
//BEQ 1 BNE 2 BLE 3 BLE 4 BNEZ 5
output         Jump_o;
output         MemRead_o;
output         MemWrite_o;
output [2-1:0] MemtoReg_o;
//from ALUresult 0, from memory 1 from immidiate value 2
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
		begin //ADD,SUB,MUL,JR,SLLV,SLL,MUL The R type instrucitons
			ALU_op_o = 5'b00010;
			ALUSrc_o = 0;
			RegWrite_o = 1;
			savePC_o = 0;
			RegDst_o = 1;
			Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            MemtoReg_o = 0;
		end
		6'h8:
		begin //ADDI
			ALU_op_o = 5'b00000;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			savePC_o = 0;
			RegDst_o = 0;
			Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            MemtoReg_o = 0;
		end
		6'h4:
		begin //BEQ
			ALU_op_o = 5'b00001;
			ALUSrc_o = 0;
			RegWrite_o = 0;
			savePC_o=0;
			RegDst_o = 0;
			Branch_o = 1;
            BranchType_o = 1;
            Jump_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            MemtoReg_o = 0;
		end
		6'h5:
		begin //BNE;
			ALU_op_o = 5'b00011;
			ALUSrc_o = 0;
			RegWrite_o = 0;
			savePC_o=0;
			RegDst_o = 0;
			Branch_o = 1;
            BranchType_o = 2;
            Jump_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            MemtoReg_o = 0;
		end
		6'hd:
		begin //ORI
			ALU_op_o = 5'b00100;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			savePC_o=0;
			RegDst_o = 0;
			Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            MemtoReg_o = 0;
		end
		6'hf:
		begin //LUI
			ALU_op_o = 5'b00101;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			savePC_o = 0;
			RegDst_o = 0;
			Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            MemtoReg_o = 0;
		end
        6'h23://lw
        begin
            ALU_op_o = 6;
            ALUSrc_o = 1; //signextimm value
            RegWrite_o = 1;
            savePC_o = 0;
            RegDst_o = 0;
            Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 0;
            MemRead_o = 1; //read data from memory
            MemWrite_o = 0;
            MemtoReg_o = 1;//data from mem to reg
        end
        6'h2b://sw
        begin
            ALU_op_o = 7;
            ALUSrc_o = 1; //signextimm value
            RegWrite_o = 0;
            savePC_o = 0;
            RegDst_o = 0;
            Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 0;
            MemRead_o = 0; //read data from memory
            MemWrite_o = 1;
            MemtoReg_o = 0;//data from mem to reg
        end
        6'h2://jump
        begin
            ALU_op_o = 8;
            ALUSrc_o = 0; //signextimm value
            RegWrite_o = 0;
            savePC_o = 0;
            RegDst_o = 0;
            Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 1; //YES We jump
            MemRead_o = 0; //read data from memory
            MemWrite_o = 0;
            MemtoReg_o = 0;//data from mem to reg
        end
        6'h3://jump and link
        begin
            ALU_op_o = 9;
            ALUSrc_o = 0; //signextimm value
            RegWrite_o = 1;
            savePC_o = 0;
            RegDst_o = 2; //shoud fix this to save PC+8;
            //we use 2 to salect PC+8 and save it
            Branch_o = 0;
            BranchType_o = 0;
            Jump_o = 1; //YES We jump
            MemRead_o = 0; //read data from memory
            MemWrite_o = 0;
            MemtoReg_o = 0;//data from mem to reg
        end
        6'h7://BLE Branch less equal
        begin
            ALU_op_o = 10;
            ALUSrc_o = 0; //signextimm value
            RegWrite_o = 0;
            savePC_o = 0;
            RegDst_o = 0; //shoud fix this to save PC+8;
            //we use 2 to salect PC+8 and save it
            Branch_o = 1;
            BranchType_o = 3;
            Jump_o = 0; //YES We jump
            MemRead_o = 0; //read data from memory
            MemWrite_o = 0;
            MemtoReg_o = 0;//data from mem to reg
        end



	endcase
end

endmodule
