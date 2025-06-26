module BinaryDisplay(input [7:0] data);
    // For simulation, display data
    initial begin
        $display("BinaryDisplay: %b", data);
    end
endmodule