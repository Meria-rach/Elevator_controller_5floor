`timescale 1ns/1ps
module request_handler(   
    input  wire        clk, rst,
    input  wire        call_up_0, call_up_1, call_up_2, call_up_3,
    input  wire        call_down_1, call_down_2, call_down_3, call_down_4,
    input  wire        select_floor_0, select_floor_1, select_floor_2, select_floor_3, select_floor_4,
    input  wire [2:0]  current_floor,
    input  wire        floor_reached,
    input  wire        door_open,
    output reg  [4:0]  floor_requests,
    output reg  [2:0]  target_floor
);
    reg floor_reached_prev;
    wire served = floor_reached_prev && !floor_reached;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            floor_requests <= 5'b0;
            floor_reached_prev <= 0;
        end else begin
            floor_reached_prev <= floor_reached;

            // Latch Hall and Cabin calls
            if (call_up_0   || select_floor_0) floor_requests[0] <= 1;
            if (call_up_1   || call_down_1 || select_floor_1) floor_requests[1] <= 1;
            if (call_up_2   || call_down_2 || select_floor_2) floor_requests[2] <= 1;
            if (call_up_3   || call_down_3 || select_floor_3) floor_requests[3] <= 1;
            if (call_down_4 || select_floor_4)                floor_requests[4] <= 1;

            // Clear request once floor is served
            if (served) floor_requests[current_floor] <= 0;
        end
    end

    // Priority Logic: Stop at the nearest requested floor
    always @(*) begin
        target_floor = current_floor; 
        if (floor_requests != 5'b0) begin
            if (floor_requests[4])      target_floor = 3'd4;
            if (floor_requests[3])      target_floor = 3'd3;
            if (floor_requests[2])      target_floor = 3'd2;
            if (floor_requests[1])      target_floor = 3'd1;
            if (floor_requests[0])      target_floor = 3'd0;
        end
    end
endmodule