5-floor elevator controller using Verilog HDL. The system is designed using a Finite State Machine (FSM) to control elevator movement, floor request handling, door operations, and floor display. The design was simulated in Xilinx Vivado and is suitable for FPGA implementation.

Features
Supports 5 floors (0 to 4)
Hall call buttons for Up / Down requests
Cabin floor selection buttons
Automatic elevator movement
Direction indicators:
Moving Up
Moving Down
Automatic door open / close at destination floor
Current floor shown on 7-segment display
Reset returns elevator to floor 0
Modules
1. elevator_controller_top.v

Top-level module that connects all submodules.

2. request_handler.v

Receives floor requests from hall buttons and cabin buttons, then selects target floor.

3. movement_controller.v

Controls elevator movement between floors using FSM states:

IDLE
MOVE UP
MOVE DOWN
DOOR OPEN
4. door_controller.v

Handles door open and close timing.

5. tb_elevator_controller_top.v

Testbench used for simulation and verification.
