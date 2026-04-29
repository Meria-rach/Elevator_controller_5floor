module elevator_controller_top(
    input  wire clk, rst,  
    input  wire call_up_0, call_up_1, call_up_2, call_up_3,
    input  wire call_down_1, call_down_2, call_down_3, call_down_4,
    input  wire select_floor_0, select_floor_1, select_floor_2, select_floor_3, select_floor_4,
    output wire [2:0] current_floor,
    output wire door_open, moving_up, moving_down,
    output wire [3:0] AN,
    output wire [6:0] seg
);
    wire [2:0] target_floor;
    wire [4:0] floor_requests;
    wire floor_reached;

    request_handler RH (
        .clk(clk), .rst(rst),
        .call_up_0(call_up_0), .call_up_1(call_up_1), .call_up_2(call_up_2), .call_up_3(call_up_3),
        .call_down_1(call_down_1), .call_down_2(call_down_2), .call_down_3(call_down_3), .call_down_4(call_down_4),
        .select_floor_0(select_floor_0), .select_floor_1(select_floor_1), .select_floor_2(select_floor_2), 
        .select_floor_3(select_floor_3), .select_floor_4(select_floor_4),
        .current_floor(current_floor), .floor_reached(floor_reached), .door_open(door_open),
        .floor_requests(floor_requests), .target_floor(target_floor)
    );

    movement_controller MC (
        .clk(clk), .rst(rst), .target_floor(target_floor), .current_floor(current_floor),
        .floor_reached(floor_reached), .moving_up(moving_up), .moving_down(moving_down)
    );

    assign door_open = floor_reached;
    assign AN = 4'b1110; 
    assign seg = (current_floor == 3'd0) ? 7'b1000000 : 
                 (current_floor == 3'd1) ? 7'b1111001 : 
                 (current_floor == 3'd2) ? 7'b0100100 : 
                 (current_floor == 3'd3) ? 7'b0110000 : 
                 (current_floor == 3'd4) ? 7'b0011001 : 7'b1111111;
endmodule