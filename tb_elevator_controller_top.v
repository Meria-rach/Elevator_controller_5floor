
module tb_elevator_controller_top();
    reg clk, rst;
    reg call_up_0, call_up_1, call_up_2, call_up_3, call_down_1, call_down_2, call_down_3, call_down_4;
    reg select_floor_0, select_floor_1, select_floor_2, select_floor_3, select_floor_4;
    wire [2:0] current_floor;
    wire door_open, moving_up, moving_down;
    wire [3:0] AN; wire [6:0] seg;

    elevator_controller_top uut (
        .clk(clk), .rst(rst), .call_up_0(call_up_0), .call_up_1(call_up_1), .call_up_2(call_up_2), .call_up_3(call_up_3),
        .call_down_1(call_down_1), .call_down_2(call_down_2), .call_down_3(call_down_3), .call_down_4(call_down_4),
        .select_floor_0(select_floor_0), .select_floor_1(select_floor_1), .select_floor_2(select_floor_2), .select_floor_3(select_floor_3), .select_floor_4(select_floor_4),
        .current_floor(current_floor), .door_open(door_open), .moving_up(moving_up), .moving_down(moving_down), .AN(AN), .seg(seg)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1;
        {call_up_0, call_up_1, call_up_2, call_up_3, call_down_1, call_down_2, call_down_3, call_down_4} = 0;
        {select_floor_0, select_floor_1, select_floor_2, select_floor_3, select_floor_4} = 0;
        #100 rst = 0;
        
        // TRIP: 0 -> 2 -> 4 -> 0
        #50 call_up_2 = 1; #20 call_up_2 = 0;
        wait(current_floor == 2 && door_open); #500;
        select_floor_4 = 1; #20 select_floor_4 = 0;
        wait(current_floor == 4 && door_open); #500;
        select_floor_0 = 1; #20 select_floor_0 = 0;
        wait(current_floor == 0 && door_open);
        #1000 $finish;
    end
endmodule