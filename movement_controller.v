module movement_controller(           
    input  wire        clk, rst,
    input  wire [2:0]  target_floor,
    output reg  [2:0]  current_floor,
    output reg         floor_reached, moving_up, moving_down
);
    parameter MOVE_DELAY = 50; 
    parameter DOOR_DELAY = 80;

    localparam IDLE=0, UP=1, DOWN=2, ARRIVED=3;
    reg [1:0]  state;
    reg [28:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE; current_floor <= 3'd0; count <= 0;
            moving_up <= 0; moving_down <= 0; floor_reached <= 0;
        end else begin
            case (state)
                IDLE: begin
                    floor_reached <= 0; moving_up <= 0; moving_down <= 0; count <= 0;
                    if      (target_floor > current_floor) state <= UP;
                    else if (target_floor < current_floor) state <= DOWN;
                end
                UP: begin
                    moving_up <= 1;
                    if (count < MOVE_DELAY) count <= count + 1;
                    else begin
                        count <= 0;
                        current_floor <= current_floor + 1;
                        if (current_floor + 1 == target_floor) state <= ARRIVED;
                    end
                end
                DOWN: begin
                    moving_down <= 1;
                    if (count < MOVE_DELAY) count <= count + 1;
                    else begin
                        count <= 0;
                        current_floor <= current_floor - 1;
                        if (current_floor - 1 == target_floor) state <= ARRIVED;
                    end
                end
                ARRIVED: begin
                    moving_up <= 0; moving_down <= 0;
                    if (count < DOOR_DELAY) begin
                        floor_reached <= 1;
                        count <= count + 1;
                    end else begin
                        floor_reached <= 0;
                        count <= 0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule