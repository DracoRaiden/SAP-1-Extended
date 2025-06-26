module MemoryAddressRegister(input [3:0] address_in, input load, output reg [3:0] address_out);
    always @(*) begin
        if (load)
            address_out = address_in;
    end
endmodule