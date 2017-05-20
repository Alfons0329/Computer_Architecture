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
wire[9:0]decoder_o;
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
wire [31:0]Add_pc_IDEX_o;
wire [31:0]Reg_RS_IDEX_o;
wire [31:0]Reg_RT_IDEX_o;
wire [31:0]SE_IDEX_o;
wire [4:0]RT_addr_IDEX_o;
wire [4:0]RD_addr_IDEX_o;
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
///////////////////////////////////////PC_Src////////////////////////////
wire Mux_PC_Source_Select;
assign Mux_PC_Source_Select = EXMEM_M_o & Zero_EXMEM_o;
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
MUX_2to1 #(.size(32))Mux_PC_Source(
        .data0_i(Add_pc_o),
        .data1_i(Adder_IDEX_to_EXMEM_EXMEM_o),
        .select_i(Mux_PC_Source_Select),
        .data_o(Mux_PC_Source_o)
		);

ProgramCounter PC(
        .clk_i(clk_i),
        .rst_i (rst_i),
        .pc_control(Haz_pc_o),
        .pc_in_i(Mux_PC_Source_o) ,
        .pc_out_o(pc_im)
        );

Instr_Memory IM(
        .addr_i(pc_im)
        .instr_o(Instruction_Mem_o)
	    );

Adder Add_pc(
        .src1_i(pc_im),
        .src2_i(32'd4),
        .sum_o(Add_pc_o)
		);


Pipe_Reg #(.size(64)) IF_ID(       //N is the total length of input/output
        .clk_i(clk_i),
        .rst_i(rst_i),
        .IFID_control(Haz_IFID_o),
        .IFFlush_control(Haz_IF_Flush_o),
        .data_i({Add_pc_o,Instruction_Mem_o}),
        .data_o({Add_pc_IFID_o,Instruction_Mem_IFID_o})
		);

//Instantiate the components in ID stage
Decoder Control(
    .instr_op_i(Instruction_Mem_IFID_o[31:26]),
    .control_o(control_o)
		);





MUX_4to1 #(.size(xxxxxxxxxxxxxxx))Control_to_IDEX(

		);

Reg_File RF(

		);


Hazard_detection_unit Haz(
    .IDEX_M_i(IDEX_M_o);
    .Reg_RS_IFID_i(Instruction_Mem_IFID_o[25:21]),
    .Reg_RT_IFID_i(Instruction_Mem_IFID_o[20:16]),
    .Reg_RT_IDEX_i(Reg_RT_IDEX_o),

    .Haz_pc_o(Haz_pc_o),
    .Haz_IFID_o(Haz_IFID_o),
    .Haz_IF_Flush_o(Haz_IF_Flush_o),
    .Haz_EX_Flush_o(Haz_EX_Flush_o),
    .Haz_ID_Flush_o(Haz_ID_Flush_o)
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
