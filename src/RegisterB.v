module RegisterB(input [7:0] data_in, input load, output reg [7:0] data_out);
    always @(*) begin
        if (load)
            data_out = data_in;
    end
endmodule