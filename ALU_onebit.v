module alu_onebit(
  input rst_n,
  input src1,
  input src2,
  input cin,
  //input bin,
  input [3:0] ALU_control,
  output wire result,
  output wire zero,
  output wire cout,
 // output wire bout,
  output wire overflow,
  )

  reg tmpres,tmpzr,tmpcout,tmpbout,tmpoverflow;
  assign result=tmpres;
  assign zero=tmpzr;
  assign cout=tmpcout;
  //assign bout=tmpbout;
  assign overflow=tmpoverflow;
  always @ (ALU_control)
  begin
    case(ALU_control)
        4'b0000:
        begin
            and(result,src1,src2);
        end
        4'b0001:
        begin
            or(result,src1,src2);
        end
        4'b0010:
        begin
            full_add fa(src1,src2,cin,result,cout);
        end
        4'b0110:
        begin
            full_add fa(src1,src2,cin,result,cout);
        end
        4'b1100:
        begin


        end
        4'b1101:
        begin


        end
        4'b0111:
        begin


        end
    endcase
  end
endmodule //
