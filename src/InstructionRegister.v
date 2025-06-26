module InstructionRegister(input [7:0] instruction_in, input load, output reg [7:0] instruction_out);
    always @(*) begin
        if (load)
            instruction_out = instruction_in;
    end
endmodule