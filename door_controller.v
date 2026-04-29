`timescale 1ns/1ps
module door_controller(
    input  wire clk, rst, floor_reached,
    output reg  door_open
);
    always @(posedge clk or posedge rst) begin
        if (rst) door_open <= 0;
        else     door_open <= floor_reached;
    end
endmodule