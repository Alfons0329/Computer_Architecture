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
///////////////////////////////register end///////////////////////////////

//control signal


/**** EX stage ****/
wire []IDEX_WB_o;
wire []IDEX_M_o;
wire []IDEX_EX_o;

wire [31:0]pc_next_IDEX_o;
wire [31:0]reg_rs_IDEX_o;
wire [31:0]reg_rt_IDEX_o;
wire [31:0]se_IDEX_o;

//control signal


/**** MEM stage ****/

//control signal


/**** WB stage ****/
wire regwrite_MEMWB_o;
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

Hazard_detection_unit HAZ(

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
        .data_i(),
        .data_o()
        );
Adder Adder_IDEX_to_EXMEM(
        .src1_i(),
        .src2_i(),
        .sum_o()
        );
ALU_Ctrl ALU_Ctrl(

        );
ALU ALU(

		);

MUX_4to1 #(.size(32)) Mux_ALUSrc_up(

        );
MUX_4to1 #(.size(32)) Mux_ALUSrc_downleft(

        );
MUX_2to1 #(.size(32)) Mux_ALUSrc_downright(

        );

MUX_2to1 #(.size(5)) MUX_instruction_to_EXMEM(

        );
Forwarding_unit FWD(

    );
Pipe_Reg #(.size(N)) EX_MEM(

		);


//Instantiate the components in MEM stage
Data_Memory DM(

	    );

Pipe_Reg #(.size(N)) MEM_WB(

		);

//Instantiate the components in WB stage
MUX_2to1 #(.size(32)) MEMWB(

        );

/****************************************
signal assignment
****************************************/
endmodule
