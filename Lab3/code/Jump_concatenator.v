module Jump_cat
(
    pc_in_i,
    jump_addr_i,
    pc_out_o
);
input [31:0] pc_in_i;
input [25:0]jump_addr_i;

output wire [31:0] pc_out_o;

assign pc_out_o = {pc_in_i[31:28],jump_addr_i,2'b00};

endmodule
