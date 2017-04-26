//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter
localparam 
    alu_add=4'd0,
	alu_sub=4'd1,
    alu_and=4'd2,
    alu_or=4'd3,
    alu_slt=4'd4,
	alu_sltu=4'd5,
	alu_sll=4'd6,
	alu_lui=4'd7,
	alu_ori=4'd8,
	alu_beq=4'd9,
	alu_bne=4'd10;
 
       
//Select exact operation
always@(*)
begin
	case(ALUOp_i)
	3'b000:begin ALUCtrl_o=alu_add; end//however the addi version
	3'b001:begin ALUCtrl_o=alu_beq; end//however the beq version
	3'b010:
	begin
	    case(funct_i)
		6'h20:ALUCtrl_o=alu_add;
		6'h22:ALUCtrl_o=alu_sub;
		6'h24:ALUCtrl_o=alu_and;
		6'h25:ALUCtrl_o=alu_or;
		6'h2a:ALUCtrl_o=alu_slt;
		6'h2b:ALUCtrl_o=alu_sltu;
		endcase		
	end
	3'b011:begin ALUCtrl_o=alu_bne; end//however the beq version
	3'b100:begin ALUCtrl_o=alu_ori; end
	3'b101:begin ALUCtrl_o=alu_lui; end
	endcase
end

endmodule     