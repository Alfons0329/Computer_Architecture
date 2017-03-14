`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    10:58:01 10/10/2011
// Design Name:
// Module Name:    alu_top
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout,       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output reg    result;
output reg    cout;

wire [3:0] ALU_control={A_invert,A_invert,operation};
reg tmpres_add,tmpres_sub,tmpzr,tmpcout,tmpoverflow;
full_add fa(src1,src2,cin,tmpres_add,tempcout);
full_add fa_comp_sub(src1,~src2,cin,tmpres_sub,tempcout);
/*always@(rst_n)
begin
    if(rst_n)
    begin
        tmpres<=0;
        tmpzr<=0;
        tmpcout<=0;
        tmpoverflow<=0;
    end
    else
    begin
        tmpres<=0;
        tmpzr<=0;
        tmpcout<=0;
        tmpoverflow<=0;
    end
end*/
always @ (ALU_control) // or maybe * instead?
begin
  case(ALU_control)
      4'b0000:
      begin
        result<=src1&src2;
      end
      4'b0001:
      begin
        result<=src1|src2;
      end
      4'b0010:
      begin
        result<=tmpres_add;
        cout<=tmpcout;
      end
      4'b0110:
      begin
		result<=tmpres_sub;
        cout<=tmpcout;
      end
      4'b1100:
      begin
        result<=~(src1|src2);
      end
      4'b1101:
      begin
        result<=src1^src2;
      end
      4'b0111:
      begin
		result<=tmpres_sub;
      end
  endcase
end

always@( * )
begin

end

endmodule
