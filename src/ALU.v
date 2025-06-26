module ALU(
    input [7:0] A, B,
    input [3:0] ALU_Sel,
    output reg [7:0] ALU_Out
);

always @(*) begin
    case(ALU_Sel)
        4'b0000: ALU_Out = A + B;              // ADD
        4'b0001: ALU_Out = A - B;              // SUB
        4'b0010: ALU_Out = A & B;              // AND
        4'b0011: ALU_Out = A | B;              // OR
        4'b0100: ALU_Out = ~(A & B);           // NAND
        4'b0101: ALU_Out = A ^ B;              // XOR
        4'b0110: ALU_Out = ~A;                 // NOT A
        4'b0111: ALU_Out = ~(A | B);           // NOR
        4'b1000: ALU_Out = ~(A ^ B);           // XNOR
        4'b1001: ALU_Out = A + 1;              // Increment A
        4'b1010: ALU_Out = B + A + 1;          // Increment A + B
        4'b1011: ALU_Out = A;                  // Pass A
        4'b1100: ALU_Out = B;                  // Pass B
        4'b1101: ALU_Out = 8'b00000000;        // Reset
        4'b1110: ALU_Out = 8'b11111111;        // Set All 1
        4'b1111: ALU_Out = {A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7]}; // Reverse A (bit order unchanged here)
        default: ALU_Out = 8'b00000000;
    endcase
end

endmodule