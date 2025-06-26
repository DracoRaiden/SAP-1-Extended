module RAM(input [3:0] address, input [7:0] data_in, input write_enable, output [7:0] data_out);
    reg [7:0] memory [0:15];
    assign data_out = memory[address];
    always @(*) begin
        if (write_enable)
            memory[address] = data_in;
    end
endmodule