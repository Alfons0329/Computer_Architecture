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

//Internal Signles
wire [31:0] pc_add1,pc_im,im_out;
/////////////////////////////
wire [31:0] add1_add2,add1_mux3;
/////////////////////////////
wire [15:0] im_se;
wire [5:0] im_dc,im_aluctrl;
wire [4:0] rs_rr1,rt_rr2,rt_mux1,rd_mux1;
//////////////////////////////
wire [4:0] mux1_wr1;
//////////////////////////////
wire [4:0]rd1_alu,rd2_mux2;
//////////////////////////////
wire [15:0] se_mux2,se_sl2;
//////////////////////////////
wire [31:0] mux2_alu;
//////////////////////////////
wire [3:0] aluctrl_alu;
//////////////////////////////
wire [15:0] sl2_add2;
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
	    .instr_o(im_out)    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(rt_mux1),
        .data1_i(rd_mux1),
        .select_i(regdst),
        .data_o(mux1_wr1)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(rs_rr1) ,  
        .RTaddr_i(rt_rr2) ,  
        .RDaddr_i(mux1_wr1) ,  
        .RDdata_i(alu_wd)  , 
        .RegWrite_i (regwrite),
        .RSdata_o(rd1_alu) ,  
        .RTdata_o(rd2_mux2)   
        );
	
Decoder Decoder(
        .instr_op_i(im_dc), 
	    .RegWrite_o(regwrite), 
	    .ALU_op_o(alu_op),   
	    .ALUSrc_o(alu_src),   
	    .RegDst_o(regdst),   
		.Branch_o(branch)   
	    );

ALU_Ctrl AC(
        .funct_i(im_aluctrl),   
        .ALUOp_i(alu_op),   
        .ALUCtrl_o(aluctrl_alu) 
        );
	
Sign_Extend SE(
        .data_i(im_se),
        .data_o(se_sl2)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(rd2_mux2),
        .data1_i(se_mux2),
        .select_i(alu_src),
        .data_o(mux2_alu)
        );	
		
ALU ALU(
        .src1_i(rd1_alu),
	    .src2_i(mux2_alu),
	    .ctrl_i(aluctrl_alu),
	    .result_o(alu_wd),
		.zero_o(zero_and)
	    );
		
Adder Adder2(
        .src1_i(add1_add2),     
	    .src2_i(sl2_add2),     
	    .sum_o(add2_mux3)      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(se_sl2),
        .data_o(sl2_add2)
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(add1_add2),
        .data1_i(add2_mux3),
        .select_i(and_mux3),
        .data_o(mux3_pc)
        );	

endmodule
		  


