module MUX_4to1(
               data0_i,
               data1_i,
               data2_i,
               data3_i,
               select_i,
               data_o
               );

parameter size = 32;

//I/O ports
input   [size-1:0] data0_i;
input   [size-1:0] data1_i;
input   [size-1:0] data2_i;
input   [size-1:0] data3_i;
input   [1:0]      select_i;

output  [size-1:0] data_o;

//Internal Signals
reg     [size-1:0] data_o;

//Main function
always@(*) begin
	case(select_i)
		1'b0: data_o = data0_i;
		1'b1: data_o = data1_i;
        2: data_o = data2_i;
        3: data_o = data3_i;
	endcase
end

endmodule
