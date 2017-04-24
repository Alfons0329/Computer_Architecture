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
	alu_ori=4'd8;
 
       
//Select exact operation
always@(posedge clk)
begin
	case(aluop_i)
	3'b000:ALUCtrl_o=alu_add;//however the addi version
	3'b001:ALUCtrl_o=alu_sub;//however the beq version
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
	3'b011:ALUCtrl_o=alu_sub;//however the beq version
	3'b100:ALUCtrl_o=alu_ori;
	3'b101:ALUCtrl_o=alu_lui;
	endcase
end

endmodule     