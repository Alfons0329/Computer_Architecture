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
wire [31:0] pc_add1,pc_im;
/////////////////////////////
wire [31:0] add1_add2,add1_mux3;
/////////////////////////////
wire [15:0] im_se;
wire [5:0] im_dc,im_aluctrl;
wire [4:0] rs_rr1,rt_rr2,rt_mux1,rd_mux1;
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
wire alu_src,branch,regwrite,regdst

/////////////////////////////DECODER END///////////////////////////////////// 







//Greate componentes
ProgramCounter PC(
        .clk_i(),      
	    .rst_i (),     
	    .pc_in_i() ,   
	    .pc_out_o() 
	    );
	
Adder Adder1(
        .src1_i(32d'd4),     
	    .src2_i(),     
	    .sum_o()    
	    ); // This is PC adder
	
Instr_Memory IM(
        .pc_addr_i(),  
	    .instr_o()    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	
		
Reg_File RF(
        .clk_i(),      
	    .rst_i() ,     
        .RSaddr_i() ,  
        .RTaddr_i() ,  
        .RDaddr_i() ,  
        .RDdata_i()  , 
        .RegWrite_i (),
        .RSdata_o() ,  
        .RTdata_o()   
        );
	
Decoder Decoder(
        .instr_op_i(), 
	    .RegWrite_o(), 
	    .ALU_op_o(),   
	    .ALUSrc_o(),   
	    .RegDst_o(),   
		.Branch_o()   
	    );

ALU_Ctrl AC(
        .funct_i(),   
        .ALUOp_i(),   
        .ALUCtrl_o() 
        );
	
Sign_Extend SE(
        .data_i(),
        .data_o()
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	
		
ALU ALU(
        .src1_i(),
	    .src2_i(),
	    .ctrl_i(),
	    .result_o(),
		.zero_o()
	    );
		
Adder Adder2(
        .src1_i(),     
	    .src2_i(),     
	    .sum_o()      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(),
        .data_o()
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	

endmodule
		  


