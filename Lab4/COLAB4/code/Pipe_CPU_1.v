//Subject:     CO project 4 - Pipe CPU 1
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------
module Pipe_CPU_1(
        clk_i,
		rst_i
		);
/***************************************
*TO DO LIST :
*ID control not understanding how to do
*
*
*
*
*
*
*
*	
*
*
*
*
*****************************************/
/****************************************
I/O ports
****************************************/
input clk_i;
input rst_i;

/****************************************
Internal signal
****************************************/
wire [31:0]Instruction_Mem_o;
/**** IF stage ****/
wire [31:0]pc_im;
wire [31:0]Add_pc_o;
////////////////////////////////Mux_PC_Source///////////////////////////
wire [31:0]Mux_PC_Source_o;
////////////////////////////////////////////////////////////////////////
/**** ID stage ****/
wire [31:0]Instruction_Mem_IFID_o;
wire [31:0]Add_pc_IFID_o;
////////////////////////////////decoder/////////////////////////////////
wire[11:0]control_o;
///////////////////////////////decoder end////////////////////////////////
///////////////////////////////Mux_Control////////////////////////////////
wire[11:0]Mux_Control_o;
///////////////////////////////register //////////////////////////////////
wire [31:0] Reg_RS_o;
wire [31:0] Reg_RT_o;
///////////////////////////////register end///////////////////////////////
///////////////////////////////Sign_Extend///////////////////////////////
wire [31:0] SE_o;
//////////////////////////////Sign_Extend end/////////////////////////////
//control signal
//////////////////////////////Hazard_detection_unit//////////////////////
wire Haz_pc_o,Haz_IFID_o,Haz_IF_Flush_o,Haz_EX_Flush_o,Haz_ID_Flush_o;
/////////////////////////////Hazard_detection_unit end///////////////////

/**** EX stage ****/
//////////////////////////////////////Up blue part//////////////////////
//from top to down
wire [1:0]IDEX_WB_o;//1 RegWrite_o 0 MemRead_o
wire [2:0]IDEX_M_o; //2Branch_o 1 MemRead_o 0 MemWrite_o
wire [4:0]IDEX_ALUOp_o;
wire IDEX_Reg_Dst_o;
wire IDEX_ALUSrc_o;
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////from IDEX//////////////////////////
wire [31:0]Add_pc_IDEX_o;
wire [31:0]Reg_RS_IDEX_o;
wire [31:0]Reg_RT_IDEX_o;
wire [31:0]SE_IDEX_o;
wire [4:0]RS_addr_IDEX_o;
wire [4:0]RT_addr_IDEX_o;
wire [4:0]RD_addr_IDEX_o;
///////////////////////////////////from IDEX end/////////////////////////
///////////////////////////////////ALU_Ctrl//////////////////////////////
wire [4:0]ALU_Ctrl_o;
//////////////////////////////////////////////////////////////////////////
///////////////////////////////////Mux_IDEX_to_EXMEM_WB//////////////////
wire [1:0]Mux_IDEX_to_EXMEM_WB_o;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////Mux_IDEX_to_EXMEM_M///////////////////
wire [2:0]Mux_IDEX_to_EXMEM_M_o;
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////Shift_Left_Two_32///////////////////
wire [31:0]Shift_Left_Two_32_o;
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////Adder_IDEX_to_EXMEM//////////////////
wire [31:0]Adder_IDEX_to_EXMEM_o;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////Mux_ALUSrc_up/////////////////////////
wire [31:0]Mux_ALUSrc_up_o;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////ALU///////////////////////////////////
wire [31:0]ALU_Result_o;
wire Zero_o;
/////////////////////////////////////////////////////////////////////////
//////////////////////////////////Mux_ALUSrc_downleft////////////////////
wire [31:0]Mux_ALUSrc_downleft_o;
/////////////////////////////////////////////////////////////////////////
//////////////////////////////////Mux_ALUSrc_downright////////////////////
wire [31:0]Mux_ALUSrc_downright_o;
/////////////////////////////////////////////////////////////////////////
//////////////////////////////////Mux_RegDst///////////////
wire [4:0]Mux_RegDst_o;
/////////////////////////////////////////////////////////////////////////
//control signal
/////////////////////////////////Forwarding_unit/////////////////////////
wire [1:0]Fwd_Mux_ALUSrc_up_o,Fwd_Mux_ALUSrc_downleft_o;
/////////////////////////////////////////////////////////////////////////

/**** MEM stage ****/
//////////////////////////////////////Up blue part//////////////////////
//from top to down
wire [1:0]EXMEM_WB_o; //1 RegWrite_o ,0 MemRead_o
wire [2:0]EXMEM_M_o; //2Branch_o ,1 MemRead_o ,0 MemWrite_o


/////////////////////////////////////////////////////////////////////////
////////////////////////////////////From EXMEM out///////////////////////
wire [31:0]ALU_Result_EXMEM_o;
wire [31:0]Mux_ALUSrc_downleft_EXMEM_o;
wire [31:0]Adder_IDEX_to_EXMEM_EXMEM_o;
wire [4:0]Mux_RegDst_EXMEM_o;
wire Zero_EXMEM_o;
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////From Data_Memory/////////////////////
wire [31:0]Data_Memory_o;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////////PC_Src////////////////////////////
wire Mux_PC_Source_Select;
assign Mux_PC_Source_Select = EXMEM_M_o[2] & Zero_EXMEM_o;
/////////////////////////////////////////////////////////////////////////

//control signal


/**** WB stage ****/
//////////////////////////////////////Up blue part//////////////////////
wire [1:0]MEMWB_WB_o; //1 RegWrite_o 0 MemRead_o
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////From MEMWB out///////////////////////

wire [31:0]Data_Memory_MEMWB_o;
wire [31:0]ALU_Result_MEMWB_o;
wire [4:0]Mux_RegDst_MEMWB_o;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////Mux_MEMWB/////////////////////////////
wire [31:0]Mux_MEMWB_o;
/////////////////////////////////////////////////////////////////////////

//control signal


/****************************************
Instnatiate modules
****************************************/
//Instantiate the components in IF stage
MUX_2to1 #(.size(32))Mux_PC_Source(
        .data0_i(Add_pc_o),
        .data1_i(Adder_IDEX_to_EXMEM_EXMEM_o),
        .select_i(Mux_PC_Source_Select),
        .data_o(Mux_PC_Source_o)
		);

ProgramCounter PC(
        .clk_i(clk_i),
        .rst_i (rst_i),
        .pc_control(Haz_pc_o),//for avoiding the unknown circumstance  2017/5/24
        .pc_in_i(Mux_PC_Source_o) ,
        .pc_out_o(pc_im)
        );

Instr_Memory IM(
        .addr_i(pc_im),
        .instr_o(Instruction_Mem_o)
	    );

Adder Add_pc(
        .src1_i(pc_im),
        .src2_i(32'd4),
        .sum_o(Add_pc_o)
		);


Pipe_Reg_IFID #(.size(64)) IF_ID(       //N is the total length of input/output
        .clk_i(clk_i),
        .rst_i(rst_i),
        .Haz_IFID_i(Haz_IFID_o),
        //.IFFlush_control(Haz_IF_Flush_o), //this one is only needed for branch hazard but we dont have such hazard in our COLAB4
        .data_i({Add_pc_o
            ,Instruction_Mem_o}),
        .data_o({Add_pc_IFID_o
            ,Instruction_Mem_IFID_o})
		);

//Instantiate the components in ID stage
//control_o={RegWrite_o,MemRead_o,Branch_o,MemRead_o,MemWrite_o,RegDst_o,ALU_op_o,ALUSrc_o};
Hazard_detection_unit Haz(
    .RS_addr_IFID_i(Instruction_Mem_IFID_o[25:21]),
    .RT_addr_IFID_i(Instruction_Mem_IFID_o[20:16]),
    .RT_addr_IDEX_i(RT_addr_IDEX_o),
    .MemRead_IDEX_i(IDEX_M_o[1]),

    .Haz_pc_o(Haz_pc_o),
    .Haz_IFID_o(Haz_IFID_o),
    .Haz_IF_Flush_o(Haz_IF_Flush_o),
    .Haz_EX_Flush_o(Haz_EX_Flush_o),
    .Haz_ID_Flush_o(Haz_ID_Flush_o)
    );
////
Decoder Control(
	.rst_i(rst_i),
    .instr_op_i(Instruction_Mem_IFID_o[31:26]),
    .control_o(control_o)
		);
MUX_2to1 #(.size(12)) Mux_Control(
        .data0_i(control_o),
        .data1_i(12'd0),
        .select_i(Haz_ID_Flush_o),
        .data_o(Mux_Control_o)
		);

Reg_File RF(
        .clk_i(clk_i),
        .rst_i(rst_i) ,
        .RSaddr_i(Instruction_Mem_IFID_o[25:21]) ,
        .RTaddr_i(Instruction_Mem_IFID_o[20:16]) ,
        .RDaddr_i(Mux_RegDst_MEMWB_o) ,
        .RDdata_i(Mux_MEMWB_o)  ,
        .RegWrite_i (MEMWB_WB_o[1]),

        .RSdata_o(Reg_RS_o) ,
        .RTdata_o(Reg_RT_o)
		);


Sign_Extend Sign_Extend(
        .data_i(Instruction_Mem_IFID_o[15:0]),
        .data_o(SE_o)
		);
//control_o={RegWrite_o,MemRead_o,Branch_o,MemRead_o,MemWrite_o,RegDst_o,ALU_op_o,ALUSrc_o};
wire EX_Flush_IDEX_o;
Pipe_Reg #(.size(156)) ID_EX(
	    .clk_i(clk_i),
        .rst_i(rst_i),


        .data_i({
			Haz_EX_Flush_o
			,Mux_Control_o[11:10]
            ,Mux_Control_o[9:7]
            ,Mux_Control_o[6:0]
            ,Add_pc_IFID_o
            ,Reg_RS_o
            ,Reg_RT_o
            ,SE_o
            ,Instruction_Mem_IFID_o[25:21]
            ,Instruction_Mem_IFID_o[20:16]
            ,Instruction_Mem_IFID_o[15:11]}),
        .data_o({
			EX_Flush_IDEX_o
			,IDEX_WB_o
            ,IDEX_M_o
            ,IDEX_Reg_Dst_o,IDEX_ALUOp_o,IDEX_ALUSrc_o
            ,Add_pc_IDEX_o
            ,Reg_RS_IDEX_o
            ,Reg_RT_IDEX_o
            ,SE_IDEX_o
            ,RS_addr_IDEX_o
            ,RT_addr_IDEX_o
            ,RD_addr_IDEX_o})
		);
//Instantiate the components in EX stage
MUX_2to1 #(.size(2)) Mux_IDEX_to_EXMEM_WB(
        .data0_i(IDEX_WB_o),
        .data1_i(2'd0),
        .select_i(EX_Flush_IDEX_o),
        .data_o(Mux_IDEX_to_EXMEM_WB_o)
        );
MUX_2to1 #(.size(3)) Mux_IDEX_to_EXMEM_M(
        .data0_i(IDEX_M_o),
        .data1_i(3'd0),
        .select_i(EX_Flush_IDEX_o),
        .data_o(Mux_IDEX_to_EXMEM_M_o)
        );
Shift_Left_Two_32 Shifter32(
        .data_i(SE_IDEX_o),
        .data_o(Shift_Left_Two_32_o)
        );
Adder Adder_IDEX_to_EXMEM(
        .src1_i(Add_pc_IDEX_o),
        .src2_i(Shift_Left_Two_32_o),
        .sum_o(Adder_IDEX_to_EXMEM_o)
        );
ALU_Ctrl ALU_Ctrl(
        .funct_i(SE_IDEX_o[5:0]),
        .ALUOp_i(IDEX_ALUOp_o),
        .ALU_Ctrl_o(ALU_Ctrl_o)
        );
ALU ALU(
        .src1_i(Mux_ALUSrc_up_o),
        .src2_i(Mux_ALUSrc_downright_o),
        .shamt(SE_IDEX_o[10:6]),
        .ctrl_i(ALU_Ctrl_o),
        .result_o(ALU_Result_o),
        .zero_o(Zero_o),
		.rst_n(rst_i)
		);

MUX_4to1 #(.size(32)) Mux_ALUSrc_up(
        .data0_i(Reg_RS_IDEX_o),
        .data1_i(ALU_Result_EXMEM_o),
        .data2_i(Mux_MEMWB_o),
        //.data3_i(32'd0),
        .select_i(Fwd_Mux_ALUSrc_up_o),
        .data_o(Mux_ALUSrc_up_o)

        );
MUX_4to1 #(.size(32)) Mux_ALUSrc_downleft(
        .data0_i(Reg_RT_IDEX_o),
        .data1_i(ALU_Result_EXMEM_o),
        .data2_i(Mux_MEMWB_o),
        .data3_i(32'd0),
        .select_i(Fwd_Mux_ALUSrc_downleft_o),
        .data_o(Mux_ALUSrc_downleft_o)
        );
MUX_2to1 #(.size(32)) Mux_ALUSrc_downright(
        .data0_i(Mux_ALUSrc_downleft_o),
        .data1_i(SE_IDEX_o),
        .select_i(IDEX_ALUSrc_o),
        .data_o(Mux_ALUSrc_downright_o)
        );

MUX_2to1 #(.size(5)) Mux_RegDst(
        .data0_i(RT_addr_IDEX_o),
        .data1_i(RD_addr_IDEX_o),
        .select_i(IDEX_Reg_Dst_o),
        .data_o(Mux_RegDst_o)
        );
Forwarding_unit Fwd(
        .RS_addr_IDEX_i(RS_addr_IDEX_o),
        .RT_addr_IDEX_i(RT_addr_IDEX_o),
        .Mux_RegDst_EXMEM_i(Mux_RegDst_EXMEM_o),
        .Mux_RegDst_MEMWB_i(Mux_RegDst_MEMWB_o),
        .EXMEM_WB1_i(EXMEM_WB_o[1]),
        .MEMWB_WB1_i(MEMWB_WB_o[1]),

        .Fwd_Mux_ALUSrc_up_o(Fwd_Mux_ALUSrc_up_o),
        .Fwd_Mux_ALUSrc_downleft_o(Fwd_Mux_ALUSrc_downleft_o)
    );
Pipe_Reg #(.size(107)) EX_MEM(
        .clk_i(clk_i),
        .rst_i(rst_i),
		
		
        .data_i({Mux_IDEX_to_EXMEM_WB_o
            ,Mux_IDEX_to_EXMEM_M_o
            ,Adder_IDEX_to_EXMEM_o
            ,Zero_o
            ,ALU_Result_o
            ,Mux_ALUSrc_downleft_o
            ,Mux_RegDst_o}),
        .data_o({EXMEM_WB_o
            ,EXMEM_M_o
            ,Adder_IDEX_to_EXMEM_EXMEM_o
            ,Zero_EXMEM_o
            ,ALU_Result_EXMEM_o
            ,Mux_ALUSrc_downleft_EXMEM_o
            ,Mux_RegDst_EXMEM_o})
		);

//Instantiate the components in MEM stage
Data_Memory DM(
        .clk_i(clk_i),
        .addr_i(ALU_Result_EXMEM_o),
        .data_i(Mux_ALUSrc_downleft_EXMEM_o),
        .MemRead_i(EXMEM_M_o[1]),
        .MemWrite_i(EXMEM_M_o[0]),
        .data_o(Data_Memory_o)
	    );

Pipe_Reg #(.size(71)) MEM_WB(

		.clk_i(clk_i),
        .rst_i(rst_i),
        
		.data_i({EXMEM_WB_o
            ,Data_Memory_o
            ,ALU_Result_EXMEM_o
            ,Mux_RegDst_EXMEM_o}),
        .data_o({MEMWB_WB_o
            ,Data_Memory_MEMWB_o
            ,ALU_Result_MEMWB_o
            ,Mux_RegDst_MEMWB_o})
		);

//Instantiate the components in WB stage
MUX_2to1 #(.size(32)) Mux_MEMWB(
	
        .data0_i(Data_Memory_MEMWB_o),
        .data1_i(ALU_Result_MEMWB_o),
        .select_i(~MEMWB_WB_o[0]), //Inverse selection since the diagram is up0 down 1
        .data_o(Mux_MEMWB_o)
        );

/****************************************
signal assignment
****************************************/
endmodule
