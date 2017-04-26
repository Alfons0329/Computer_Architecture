//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		rst_i
		);
		
//I/O port
input         clk_i;
input         rst_i;

wire [31:0]instruction;
//Internal Signles
wire [31:0] pc_im;
/////////////////////////////
wire [31:0] add1_add2;
/////////////////////////////
//////////////////////////////
wire [4:0] mux1_wr1;
//////////////////////////////
wire [31:0]rd1_alu,rd2_mux2;
//////////////////////////////
wire [31:0] se_out;
//////////////////////////////
wire [31:0] mux2_alu;
//////////////////////////////
wire [3:0] aluctrl_alu;
//////////////////////////////
wire [31:0] sl2_add2;
//////////////////////////////

wire [31:0] add2_mux3;
//////////////////////////////
wire [31:0] mux3_pc;
//////////////////////////////
wire [31:0] alu_wd;
wire zero_and;
//////////////////////////////
wire and_mux3;
//////////////////////////////
/////////////////////////////DECODER/////////////////////////////////////////
wire [2:0] alu_op;
wire alu_src,branch,regwrite,regdst;

/////////////////////////////DECODER END///////////////////////////////////// 







//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(mux3_pc) ,   
	    .pc_out_o(pc_im) 
	    );
	
Adder Adder1(
        .src1_i(32'd4),     
	    .src2_i(pc_im),     
	    .sum_o(add1_add2)    
	    ); // This is PC adder
	
Instr_Memory IM(
        .pc_addr_i(pc_im),  
	    .instr_o(instruction)    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instruction[20:16]),
        .data1_i(instruction[15:11]),
        .select_i(regdst),
        .data_o(mux1_wr1)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(instruction[25:21]) ,  
        .RTaddr_i(instruction[20:16]) ,  
        .RDaddr_i(mux1_wr1) ,  
        .RDdata_i(alu_wd)  , 
        .RegWrite_i (regwrite),
        .RSdata_o(rd1_alu) ,  
        .RTdata_o(rd2_mux2)   
        );
	
Decoder Decoder(
        .instr_op_i(instruction[31:26]), 
	    .RegWrite_o(regwrite), 
	    .ALU_op_o(alu_op),   
	    .ALUSrc_o(alu_src),   
	    .RegDst_o(regdst),   
		.Branch_o(branch)   
	    );

ALU_Ctrl AC(
        .funct_i(instruction[5:0]),   
        .ALUOp_i(alu_op),   
        .ALUCtrl_o(aluctrl_alu) 
        );
	
Sign_Extend SE(
        .data_i(instruction[15:0]),
        .data_o(se_out)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(rd2_mux2),
        .data1_i(se_out),
        .select_i(alu_src),
        .data_o(mux2_alu)
        );	
		
ALU ALU(
        .src1_i(rd1_alu),
	    .src2_i(mux2_alu),
	    .ctrl_i(aluctrl_alu),
	    .result_o(alu_wd),
		 .zero_o(zero_and),
		 .shamt(instruction[10:6])
	    );
		
Adder Adder2(
        .src1_i(add1_add2),     
	    .src2_i(sl2_add2),     
	    .sum_o(add2_mux3)      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(se_out),
        .data_o(sl2_add2)
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(add1_add2),
        .data1_i(add2_mux3),
        .select_i(branch&zero_and),
        .data_o(mux3_pc)
        );	

endmodule
		  


