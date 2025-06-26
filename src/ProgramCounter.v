module ProgramCounter(input clk, input reset, input enable, output reg [3:0] pc);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 0;
        else if (enable)
            pc <= pc + 1;
    end
endmodule