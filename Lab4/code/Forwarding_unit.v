//Reference to CO ppt ch4-78
module Forwarding_unit
(
    RS_addr_IDEX_i,
    RT_addr_IDEX_i,
    Mux_RegDst_EXMEM_i,
    Mux_RegDst_MEMWB_i,
    EXMEM_WB1_i,//EXMEM RegWrite
    MEMWB_WB1_i,//MEMWB RegWrite

    Fwd_Mux_ALUSrc_up_o,
    Fwd_Mux_ALUSrc_downleft_o,
);
//EX hazard first then MEM hazard
input [4:0] RS_addr_IDEX_i;
input [4:0] RT_addr_IDEX_i;
input [4:0] Mux_RegDst_EXMEM_i;
input [4:0] Mux_RegDst_MEMWB_i;
input EXMEM_WB1_i;
input MEMWB_WB1_i;

//for aliasing to match with CO ppt ch4-78

wire [4:0] IDEX_Reg_RS_fwd;
wire [4:0] IDEX_Reg_RT_fwd;
wire [4:0] EXMEM_Reg_RD_fwd;
wire [4:0] MEMWB_Reg_RD_fwd;
wire EXMEM_RegWrite_fwd;
wire MEMWB_RegWrite_fwd;

assign IDEX_Reg_RS_fwd  =  RS_addr_IDEX_i;
assign IDEX_Reg_RT_fwd  =  RT_addr_IDEX_i;
assign EXMEM_Reg_RD_fwd =  Mux_RegDst_EXMEM_i;
assign MEMWB_Reg_RD_fwd =  Mux_RegDst_MEMWB_i;
assign EXMEM_RegWrite_fwd=EXMEM_WB1_i;
assign MEMWB_RegWrite_fwd=MEMWB_WB1_i;
//alias end
output wire [1:0] Fwd_Mux_ALUSrc_up_o;
output wire [1:0] Fwd_Mux_ALUSrc_downleft_o;
 /*assign x = (val==0) ?   a :
           (val==1) ?   b :
                      'bx ;
is the multiple condition*/
//detect the EX hazard first then the MEM hazard.
//Up RS forwarding
assign Fwd_Mux_ALUSrc_up_o=(EXMEM_RegWrite_fwd&&EXMEM_Reg_RD_fwd&&(EXMEM_Reg_RD_fwd==IDEX_Reg_RS_fwd)?2'b10://EX hazard
(MEMWB_RegWrite_fwd&&MEMWB_Reg_RD_fwd&&(MEMWB_Reg_RD_fwd==IDEX_Reg_RS_fwd)?2'b01:2'b00;//MEM hazard
//Down RT forwarding
assign Fwd_Mux_ALUSrc_downleft_o=(EXMEM_RegWrite_fwd&&EXMEM_Reg_RD_fwd&&(EXMEM_Reg_RD_fwd==IDEX_Reg_RT_fwd)?2'b10://EX hazard
(MEMWB_RegWrite_fwd&&MEMWB_Reg_RD_fwd&&(MEMWB_Reg_RD_fwd==IDEX_Reg_RT_fwd)?2'b01:2'b00;

/*------------------------------------DOUBLE DATA HAZARD BELOW---------------------------------*/
//MEM HAZARD (Only fwd if EX hazard isn't true (see CO ppt ch4-79 80))
//Up RS forwarding
assign Fwd_Mux_ALUSrc_up_o=((MEMWB_RegWrite_fwd&&MEMWB_Reg_RD_fwd&&(MEMWB_Reg_RD_fwd==IDEX_Reg_RS_fwd))
&&(!(EXMEM_RegWrite_fwd&&EXMEM_Reg_RD_fwd&&(EXMEM_Reg_RD_fwd==IDEX_Reg_RS_fwd))))?2'b01:2'b00;
//Down RT forwarding
assign Fwd_Mux_ALUSrc_up_o=((MEMWB_RegWrite_fwd&&MEMWB_Reg_RD_fwd&&(MEMWB_Reg_RD_fwd==IDEX_Reg_RT_fwd))
&&(!(EXMEM_RegWrite_fwd&&EXMEM_Reg_RD_fwd&&(EXMEM_Reg_RD_fwd==IDEX_Reg_RT_fwd))))?2'b01:2'b00;


endmodule
