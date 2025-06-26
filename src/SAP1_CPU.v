module SAP1_CPU (
    input clk,
    input reset
);

    // Wires for interconnection
    wire [3:0] opcode;
    wire [7:0] instruction, data_bus, alu_result;
    wire [3:0] address;
    wire [7:0] acc_out, regb_out;
    wire pc_enable, pc_reset;
    wire mar_load;
    wire ir_load;
    wire acc_load, regb_load;
    wire [3:0] alu_control;
    wire ram_write_enable;

    // Clock and control signals
    wire clk_out;
    ClockGenerator clock_gen(.clk_in(clk), .clk_out(clk_out));

    // Program Counter
    ProgramCounter pc (
        .clk(clk_out),
        .reset(reset),
        .enable(pc_enable),
        .address(address)
    );

    // MAR
    MemoryAddressRegister mar (
        .clk(clk_out),
        .load(mar_load),
        .in_address(address),
        .out_address(address)
    );

    // RAM
    wire [7:0] ram_data_out;
    RAM ram (
        .clk(clk_out),
        .address(address),
        .data_in(data_bus),
        .data_out(ram_data_out),
        .write_enable(ram_write_enable)
    );

    // Instruction Register
    InstructionRegister ir (
        .clk(clk_out),
        .load(ir_load),
        .instruction_in(ram_data_out),
        .opcode(opcode),
        .operand(address)
    );

    // Control Unit
    ControlUnit cu (
        .clk(clk_out),
        .reset(reset),
        .opcode(opcode),
        .pc_enable(pc_enable),
        .mar_load(mar_load),
        .ir_load(ir_load),
        .acc_load(acc_load),
        .regb_load(regb_load),
        .ram_write_enable(ram_write_enable),
        .alu_control(alu_control)
    );

    // Accumulator
    Accumulator acc (
        .clk(clk_out),
        .load(acc_load),
        .data_in(alu_result),
        .data_out(acc_out)
    );

    // Register B
    RegisterB regb (
        .clk(clk_out),
        .load(regb_load),
        .data_in(ram_data_out),
        .data_out(regb_out)
    );

    // ALU with 16 operations
    ALU alu (
        .a(acc_out),
        .b(regb_out),
        .alu_control(alu_control),
        .result(alu_result)
    );

    // Output Display
    BinaryDisplay display (
        .data(alu_result)
    );

endmodule