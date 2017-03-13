module ALU_32bit(
  input rst_n,
  input src1,
  input src2,
  input cin,
  input bin,
  input [3:0] ALU_control,
  output wire result,
  output wire zero,
  output wire cout,
  output wire bout,
  output wire overflow
  );
  
  alu_onebit bit0 (rst_n,src1[0 ],src2[0 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit1 (rst_n,src1[1 ],src2[1 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit2 (rst_n,src1[2 ],src2[2 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit3 (rst_n,src1[3 ],src2[3 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit4 (rst_n,src1[4 ],src2[4 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit5 (rst_n,src1[5 ],src2[5 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit6 (rst_n,src1[6 ],src2[6 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit7 (rst_n,src1[7 ],src2[7 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit8 (rst_n,src1[8 ],src2[8 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit9 (rst_n,src1[9 ],src2[9 ],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit10(rst_n,src1[10],src2[10],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit11(rst_n,src1[11],src2[11],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit12(rst_n,src1[12],src2[12],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit13(rst_n,src1[13],src2[13],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit14(rst_n,src1[14],src2[14],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit15(rst_n,src1[15],src2[15],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit16(rst_n,src1[16],src2[16],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit17(rst_n,src1[17],src2[17],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit18(rst_n,src1[18],src2[18],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit19(rst_n,src1[19],src2[19],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit20(rst_n,src1[20],src2[20],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit21(rst_n,src1[21],src2[21],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit22(rst_n,src1[22],src2[22],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit23(rst_n,src1[23],src2[23],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit24(rst_n,src1[24],src2[24],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit25(rst_n,src1[25],src2[25],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit26(rst_n,src1[26],src2[26],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit27(rst_n,src1[27],src2[27],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit28(rst_n,src1[28],src2[28],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit29(rst_n,src1[29],src2[29],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit30(rst_n,src1[30],src2[30],cin,bin,ALU_control,result,zero,cout,overflow);
  alu_onebit bit31(rst_n,src1[31],src2[31],cin,bin,ALU_control,result,zero,cout,overflow);
  
  always@(ALU_control)begin
    case (ALU_control)
	  4'b0000:
	    
	  4'b0001:
	  4'b0010:
	  4'b0110:
	  4'b1100:
	  4'b1101:
	  4'b0111:

   	endcase
      
  end