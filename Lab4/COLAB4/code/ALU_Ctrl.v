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
          ALU_Ctrl_o,
          jr
          );

//I/O ports
input      [6-1:0] funct_i;
input      [5-1:0] ALUOp_i;

output     [5-1:0] ALU_Ctrl_o;
output reg  jr;
//Internal Signals
reg        [5-1:0] ALU_Ctrl_o;

//Parameter
localparam
    alu_add=5'd0,
	alu_sub=5'd1,
    alu_and=5'd2,
    alu_or=5'd3,
    alu_slt=5'd4,
	alu_sltu=5'd5,
	alu_sll=5'd6,
	alu_lui=5'd7,
	alu_ori=5'd8,
	alu_beq=5'd9,
	alu_bne=5'd10,
	alu_sllv=5'd11,
//2017/5/4 update here
    alu_lw=12,
    alu_sw=13,
    alu_mul=14,
    alu_ble=15,
    alu_blt=16,
    alu_bnez=17
    ;

always@(*)
begin
	case(ALUOp_i)
	5'b000:begin ALU_Ctrl_o=alu_add; end//however the addi version
	5'b001:begin ALU_Ctrl_o=alu_beq; end//however the beq version
	5'b010:
	begin
	    case(funct_i)
		6'h0:ALU_Ctrl_o=alu_sll;
		6'h4:ALU_Ctrl_o=alu_sllv;
		6'h20:ALU_Ctrl_o=alu_add;
		6'h22:ALU_Ctrl_o=alu_sub;
		6'h24:ALU_Ctrl_o=alu_and;
		6'h25:ALU_Ctrl_o=alu_or;
		6'h2a:ALU_Ctrl_o=alu_slt;
		6'h2b:ALU_Ctrl_o=alu_sltu;
        6'h18:ALU_Ctrl_o=alu_mul;
		endcase
	end
	5'b011:begin ALU_Ctrl_o=alu_bne; end//however the beq version
	5'b100:begin ALU_Ctrl_o=alu_ori; end
	5'b101:begin ALU_Ctrl_o=alu_lui; end
         6:begin ALU_Ctrl_o=alu_lw; end
         7:begin ALU_Ctrl_o=alu_sw; end
         //8:begin ALU_Ctrl_o=alu_j end
         //9:begin ALU_Ctrl_o=alu end
        10:begin ALU_Ctrl_o=alu_ble; end
        11:begin ALU_Ctrl_o=alu_blt; end
        12:begin ALU_Ctrl_o=alu_bnez;end
    default:begin ALU_Ctrl_o=0; end
	endcase
end

endmodule
