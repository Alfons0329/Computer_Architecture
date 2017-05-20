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
*TO DO LIST :  change add1_o to pc_next_IFID_i
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
wire [31:0]instruction_IFID_i;
/**** IF stage ****/
wire [31:0]pc_im;
wire [31:0]pc_next_IFID_i;
/**** ID stage ****/
wire [31:0]pc_next_IFID_o;
////////////////////////////////decoder/////////////////////////////////
wire [31:0] instruction_IFID_o;
wire [4:0] alu_op;
wire [2:0] branchtype;
wire [1:0] regdst,memtoreg;
wire alu_src,branch,regwrite,jump,memread,memwrite,jal;
wire []decoder_to_MUX_o;
assign decoder_to_MUX_o={alu_op,branchtype,,,,};
///////////////////////////////decoder end////////////////////////////////
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
wire []IDEX_WB_o;
wire []IDEX_M_o;
wire []IDEX_EX_o;
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////from IDEX//////////////////////////
wire [31:0]pc_next_IDEX_o;
wire [31:0]Reg_RS_IDEX_o;
wire [31:0]Reg_RT_IDEX_o;
wire [31:0]SE_IDEX_o;
wire [4:0]RT_addr_o_IDEX;
wire [4:0]RD_addr_o_IDEX;
///////////////////////////////////from IDEX end/////////////////////////
///////////////////////////////////Mux_IDEX_to_EXMEM_WB//////////////////
wire []Mux_IDEX_to_EXMEM_WB_o;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////Mux_IDEX_to_EXMEM_M///////////////////
wire []Mux_IDEX_to_EXMEM_M_o;
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
//////////////////////////////////Mux_RegWriteDestSelectionRSRT///////////////
wire [31:0]Mux_RegWriteDestSelectionRSRT_o;
/////////////////////////////////////////////////////////////////////////
//control signal
/////////////////////////////////Forwarding_unit/////////////////////////
wire Fwd_Mux_ALUSrc_up,Fwd_Mux_ALUSrc_downleft,Fwd_Mux_ALUSrc_downright
/////////////////////////////////////////////////////////////////////////

/**** MEM stage ****/
//////////////////////////////////////Up blue part//////////////////////
wire []EXMEM_WB_o;
wire []EXMEM_M_o;
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////From EXMEM out///////////////////////
wire [31:0]ALU_Result_EXMEM_o;
wire [31:0]Mux_ALUSrc_downleft_EXMEM_o;
wire [31:0]Adder_IDEX_to_EXMEM_EXMEM_o;
wire [4:0]Mux_RegWriteDestSelectionRSRT_EXMEM_o;
wire Zero_EXMEM_o;
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////From Data_Memory/////////////////////
wire [31:0]Data_Memory_o;
/////////////////////////////////////////////////////////////////////////
//control signal


/**** WB stage ****/
//////////////////////////////////////Up blue part//////////////////////
wire RegWrite_MEMWB_o;
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////From MEMWB out///////////////////////
wire []MEMWB_WB_o;
wire [31:0]Data_Memory_MEMWB_o;
wire [31:0]ALU_Result_MEMWB_o;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////Mux_MEMWB/////////////////////////////
wire [31:0]Mux_MEMWB_o;
/////////////////////////////////////////////////////////////////////////
//control signal


/****************************************
Instnatiate modules
****************************************/
//Instantiate the components in IF stage
MUX_2to1 #(.size(32))PC_Source(

		);

ProgramCounter PC(

        );

Instr_Memory IM(

	    );

Adder Add_pc(

		);


Pipe_Reg #(.size(N)) IF_ID(       //N is the total length of input/output

		);

//Instantiate the components in ID stage
MUX_4to1 #(.size(xxxxxxxxxxxxxxx))Control_to_IDEX(

		);

Reg_File RF(

		);

Decoder Control(

		);

Hazard_detection_unit Haz(

    );

Sign_Extend Sign_Extend(

		);

Pipe_Reg #(.size(N)) ID_EX(

		);

//Instantiate the components in EX stage
MUX_2to1 #(.size(1)) Mux_IDEX_to_EXMEM_WB(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );
MUX_2to1 #(.size(1)) Mux_IDEX_to_EXMEM_M(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );
Shift_Left_Two_32 Shifter32(
        .data_i(se_IDEX_o),
        .data_o(Shift_Left_Two_32_o)
        );
Adder Adder_IDEX_to_EXMEM(
        .src1_i(),
        .src2_i(),
        .sum_o(Adder_IDEX_to_EXMEM_o)
        );
ALU_Ctrl ALU_Ctrl(

        );
ALU ALU(

		);

MUX_4to1 #(.size(32)) Mux_ALUSrc_up(
        .data0_i(),
        .data1_i(),
        .data2_i(),
        .data3_i(),
        .select_i(),
        .data_o()

        );
MUX_4to1 #(.size(32)) Mux_ALUSrc_downleft(
        .data0_i(),
        .data1_i(),
        .data2_i(),
        .data3_i(),
        .select_i(),
        .data_o()
        );
MUX_2to1 #(.size(32)) Mux_ALUSrc_downright(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );

MUX_2to1 #(.size(5)) Mux_RegWriteDestSelectionRSRT(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );
Forwarding_unit Fwd(

    );
Pipe_Reg #(.size(N)) EX_MEM(
        .

		);


//Instantiate the components in MEM stage
Data_Memory DM(

	    );

Pipe_Reg #(.size(N)) MEM_WB(

		);

//Instantiate the components in WB stage
MUX_2to1 #(.size(32)) Mux_MEMWB(

        );

/****************************************
signal assignment
****************************************/
endmodule
