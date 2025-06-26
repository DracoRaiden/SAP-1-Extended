module testbench;
    reg [7:0] A, B;
    reg [3:0] ALU_Sel;
    wire [7:0] ALU_Out;

    ALU uut (.A(A), .B(B), .ALU_Sel(ALU_Sel), .ALU_Out(ALU_Out));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        A = 8'b00001111; B = 8'b00000001;

        // Test all ALU operations
        ALU_Sel = 4'b0000; #10; // ADD
        ALU_Sel = 4'b0001; #10; // SUB
        ALU_Sel = 4'b0010; #10; // AND
        ALU_Sel = 4'b0011; #10; // OR
        ALU_Sel = 4'b0100; #10; // NAND
        ALU_Sel = 4'b0101; #10; // XOR
        ALU_Sel = 4'b0110; #10; // NOT A
        ALU_Sel = 4'b0111; #10; // NOR
        ALU_Sel = 4'b1000; #10; // XNOR
        ALU_Sel = 4'b1001; #10; // Increment A
        ALU_Sel = 4'b1010; #10; // Increment A+B
        ALU_Sel = 4'b1011; #10; // Pass A
        ALU_Sel = 4'b1100; #10; // Pass B
        ALU_Sel = 4'b1101; #10; // Reset
        ALU_Sel = 4'b1110; #10; // Set all 1
        ALU_Sel = 4'b1111; #10; // Reverse A

        $finish;
    end
endmodule