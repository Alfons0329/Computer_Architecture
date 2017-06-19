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
module CPU(
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
wire [31:0] add1_o;
/////////////////////////////
/////////Mux_Write_Reg_Select/////////
wire [4:0] Mux_Write_Reg_Select_o;
/////////Mux_Write_Reg_Select END////
wire [31:0]rd1_alu,rd2_mux2;
//////////////////////////////
wire [31:0] se_o;
//////////////////////////////
wire [31:0] mux2_alu;
////////////ALUCtrl//////////////////
wire [4:0] aluctrl_alu;
wire jr;
/////////////ALUCtrl END///////////
wire [31:0] sl2_add2;
//////////////////////////////

wire [31:0] add2_mux3;
//////////////////////////////
//////////////////////////////
wire [31:0] alu_result_o;
wire zero_and;
//////////////////////////////
wire and_mux3;
//////////////////////////////
/////////////////////////////DECODER/////////////////////////////////////////
wire [4:0] alu_op;
wire [2:0] branchtype;
wire [1:0] regdst,memtoreg;
wire alu_src,branch,regwrite,jump,memread,memwrite,jal;
/////////////////////////////DECODER END/////////////////////////////////////
/////////////////////////////CONCATENATOR////////////////////////////////////
wire [31:0] concat_o;
/////////////////////////////CONCATENATOR END////////////////////////////////
/////////////////////////////MUX PC_Source///////////////////////////////////
wire [31:0] Mux_PC_Source_o;
/////////////////////////////MUX PC_Source END///////////////////////////////////
/////////////////////////////MUX Jump////////////////////////////////////////
wire [31:0] Mux_Jump_o;
/////////////////////////////Mux_Jump END////////////////////////////////////

/////////////////////////////Mux_Branch//////////////////////////////////////
wire [31:0] Mux_Branch_o;
/////////////////////////////Mux_Branch END//////////////////////////////////
/////////////////////////////Shift_Left_Two_26///////////////////////////////
wire [27:0] Shift_Left_Two_26_o;
/////////////////////////////Shift_Left_Two_26 END///////////////////////////

/////////////////////////////Mux_Write_Data_Select///////////////////////////
wire [31:0] Mux_Write_Data_Select_o;
/////////////////////////////Mux_Write_Data_Select END///////////////////////
/////////////////////////////Data_Memory/////////////////////////////////////
wire [31:0] Data_Memory_o;
/////////////////////////////Data_Memory END/////////////////////////////////

/////////////////////////////Mux_Wtire_Back_Select///////////////////////////
wire [31:0] Mux_Write_Back_Select_o;
/////////////////////////////Mux_Wtire_Back_Select END///////////////////////
//Greate componentes
MUX_2to1 #(.size(32))PC_Source(
    .data0_i(Mux_Jump_o),
    .data1_i(rd1_alu),
    .select_i(jr),
    .data_o(Mux_PC_Source_o)
    );
ProgramCounter PC(
        .clk_i(clk_i),
	    .rst_i (rst_i),
	    .pc_in_i(Mux_PC_Source_o) ,
	    .pc_out_o(pc_im)
	    );

Adder Adder1(
        .src1_i(32'd4),
	    .src2_i(pc_im),
	    .sum_o(add1_o)
	    ); // This is PC adder

Instruction_Memory IM(
        .addr_i(pc_im),
	    .instr_o(instruction)
	    );
Shift_Left_Two_26 Shifter26(
    .data_i(instruction[25:0]),
    .data_o(Shift_Left_Two_26_o)
    );
Jump_cat Concatenator(
    .pc_in_i(add1_o),
    .jump_addr_i(Shift_Left_Two_26_o),
    .pc_out_o(concat_o)
    );
MUX_4to1 #(.size(5)) Mux_Write_Reg_Select(
        .data0_i(instruction[20:16]),
        .data1_i(instruction[15:11]),
        .data2_i(5'd31),
        .data3_i(5'd0),//For future use
        .select_i(regdst),
        .data_o(Mux_Write_Reg_Select_o)
        	);
MUX_2to1 Mux_Write_Data_Select(
    .data0_i(Mux_Write_Back_Select_o),
    .data1_i(add1_o),
    .select_i(jal),
    .data_o(Mux_Write_Data_Select_o)
    );
Reg_File RF(
        .clk_i(clk_i),
	    .rst_i(rst_i) ,
        .RSaddr_i(instruction[25:21]) ,
        .RTaddr_i(instruction[20:16]) ,
        .RDaddr_i(Mux_Write_Reg_Select_o) ,
        .RDdata_i(Mux_Write_Data_Select_o)  ,
        .RegWrite_i (regwrite),
		  .jr_i(jr),
        .RSdata_o(rd1_alu) ,
        .RTdata_o(rd2_mux2)
        );

Decoder Decoder(
        .instr_op_i(instruction[31:26]),
	    .RegWrite_o(regwrite),
	    .ALU_op_o(alu_op),
	    .ALUSrc_o(alu_src),
	    .RegDst_o(regdst),
		.Branch_o(branch),
        .BranchType_o(branchtype),
        .Jump_o(jump),
        .MemRead_o(memread),
        .MemWrite_o(memwrite),
        .MemtoReg_o(memtoreg),
        .jal(jal)
	    );

ALU_Ctrl AC(
        .funct_i(instruction[5:0]),
        .ALUOp_i(alu_op),
        .ALUCtrl_o(aluctrl_alu),
        .jr(jr)
        );

Sign_Extend SE(
        .data_i(instruction[15:0]),
        .data_o(se_o)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(rd2_mux2),
        .data1_i(se_o),
        .select_i(alu_src),
        .data_o(mux2_alu)
        );

ALU ALU(
        .src1_i(rd1_alu),
	    .src2_i(mux2_alu),
	    .ctrl_i(aluctrl_alu),
	    .result_o(alu_result_o),
		.zero_o(zero_and),
		.shamt(instruction[10:6]),
		.rst_n(rst_i)
	    );
Data_Memory Data_Memory(
    .clk_i(clk_i),
    .addr_i(alu_result_o),
    .data_i(rd2_mux2),
    .MemRead_i(memread),
    .MemWrite_i(memwrite),
    .data_o(Data_Memory_o)
    );
Adder Adder2(
        .src1_i(add1_o),
	    .src2_i(sl2_add2),
	    .sum_o(add2_mux3)
	    ); //adder for branch

Shift_Left_Two_32 Shifter32(
        .data_i(se_o),
        .data_o(sl2_add2)
        );

MUX_2to1 #(.size(32)) Mux_Branch(
        .data0_i(add1_o),
        .data1_i(add2_mux3),
        .select_i(branch&zero_and),
        .data_o(Mux_Branch_o)
        );
MUX_2to1 #(.size(32)) Mux_Jump(
        .data0_i(concat_o),
        .data1_i(Mux_Branch_o),
        .select_i(~jump),//fix wrong bit
        .data_o(Mux_Jump_o)
        );
MUX_4to1 Mux_Write_Back_Select(
        .data0_i(alu_result_o),
        .data1_i(Data_Memory_o),
        .data2_i(se_o),
		.data3_i(32'd0),
        .select_i(memtoreg),
        .data_o(Mux_Write_Back_Select_o)
    );
endmodule
