module mac_single_cycle (
    input wire clk,
    input wire rst_n,
    input wire valid_in,
    input wire [15:0] A,
    input wire [15:0] B,
    input wire clear_acc,
    output reg [31:0] acc_out,
    output reg valid_out
);

wire signed [31:0] product;

assign product = $signed(A) * $signed(B);

always @(posedge clk) begin
    if(!rst_n) begin
        acc_out <= 0;
        valid_out <= 0;
    end
    else if(clear_acc) begin
        acc_out <= 0;
        valid_out <= 0;
    end
    else if(valid_in) begin
        acc_out <= acc_out + product;
        valid_out <= 1'b1;
    end
    else begin
        valid_out <= 1'b0;
    end
end

endmodule


