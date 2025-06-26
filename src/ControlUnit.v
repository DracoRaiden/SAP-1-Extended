module ControlUnit(input clk, output reg [1:0] control_signal);
    always @(posedge clk) begin
        control_signal <= control_signal + 1;
    end
endmodule