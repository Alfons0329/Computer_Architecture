module Hazard_detection_unit  //deal with load use data hazard since such type cant be solved by data forwarding
(
    RS_addr_IFID_i,
    RT_addr_IFID_i,
    RT_addr_IDEX_i,
    MemRead_IDEX_i,

    Haz_pc_o,
    Haz_IFID_o,
    Haz_IF_Flush_o,
    Haz_EX_Flush_o,
    Haz_ID_Flush_o
);
input [4:0] RS_addr_IFID_i;
input [4:0] RT_addr_IFID_i;
input [4:0] RT_addr_IDEX_i;
input MemRead_IDEX_i;

output reg Haz_pc_o;
output reg Haz_IFID_o;
output reg Haz_IF_Flush_o; //for control hazard
output reg Haz_EX_Flush_o;
output reg Haz_ID_Flush_o; //if Haz_ID_Flush_o is 1 then the  Mux_Control will get signal 1 to assign the value 0 making the
//IDEX register to be 0 and thus flush the instructions before
//for all 1 means hazard happens , watch out the other submodule's relationship
//assign Haz_pc_o=(MemRead_IDEX_i&&((RT_addr_IDEX_i==RS_addr_IFID_i)||(RT_addr_IDEX_i==RT_addr_IFID_i)))?1 /*hazard happens*/:0/*hazard doesn't happen*/;
//assign Haz_IFID_o=(MemRead_IDEX_i&&((RT_addr_IDEX_i==RS_addr_IFID_i)||(RT_addr_IDEX_i==RT_addr_IFID_i)))?1 /*hazard happens*/:0/*hazard doesn't happen*/;
//assign Haz_IF_Flush_=(MemRead_IDEX_i&&((RT_addr_IDEX_i==RS_addr_IFID_i)||(RT_addr_IDEX_i==RT_addr_IFID_i)))?1 /*hazard happens*/:0/*hazard doesn't happen*/;
//assign Haz_EX_Flush_o=(MemRead_IDEX_i&&((RT_addr_IDEX_i==RS_addr_IFID_i)||(RT_addr_IDEX_i==RT_addr_IFID_i)))?1 /*hazard happens*/:0/*hazard doesn't happen*/;
//assign Haz_ID_Flush_o=(MemRead_IDEX_i&&((RT_addr_IDEX_i==RS_addr_IFID_i)||(RT_addr_IDEX_i==RT_addr_IFID_i)))?1 /*hazard happens*/:0/*hazard doesn't happen*/;
always@(*)
begin
	if((MemRead_IDEX_i&&((RT_addr_IDEX_i==RS_addr_IFID_i)||(RT_addr_IDEX_i==RT_addr_IFID_i))))
	begin
		Haz_pc_o=0;
		Haz_IFID_o=1;
		Haz_ID_Flush_o=1;
		Haz_EX_Flush_o=1;
	end
	else
	begin
		Haz_pc_o=1;
		Haz_IFID_o=0;
		Haz_ID_Flush_o=0;
		Haz_EX_Flush_o=0;	
	end
end
endmodule
