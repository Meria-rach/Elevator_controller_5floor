## Clock signal
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Reset (Center Button)
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports rst]

## Hall Calls (Switches SW0 to SW7)
set_property -dict { PACKAGE_PIN V17  IOSTANDARD LVCMOS33 } [get_ports call_up_0]
set_property -dict { PACKAGE_PIN V16  IOSTANDARD LVCMOS33 } [get_ports call_up_1]
set_property -dict { PACKAGE_PIN W16  IOSTANDARD LVCMOS33 } [get_ports call_down_1]
set_property -dict { PACKAGE_PIN W17  IOSTANDARD LVCMOS33 } [get_ports call_up_2]
set_property -dict { PACKAGE_PIN W15  IOSTANDARD LVCMOS33 } [get_ports call_down_2]
set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS33 } [get_ports call_up_3]
set_property -dict { PACKAGE_PIN W14  IOSTANDARD LVCMOS33 } [get_ports call_down_3]
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports call_down_4]

## Cabin Calls (Switches SW8 to SW12)
set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS33 } [get_ports select_floor_0]
set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS33 } [get_ports select_floor_1]
set_property -dict { PACKAGE_PIN T2   IOSTANDARD LVCMOS33 } [get_ports select_floor_2]
set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS33 } [get_ports select_floor_3]
set_property -dict { PACKAGE_PIN W2   IOSTANDARD LVCMOS33 } [get_ports select_floor_4]

## LEDs (LD0 to LD2)
set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports moving_up]
set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVCMOS33 } [get_ports moving_down]
set_property -dict { PACKAGE_PIN U19  IOSTANDARD LVCMOS33 } [get_ports door_open]

## 7-Segment Digit Select (AN)
set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {AN[0]}]
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports {AN[1]}]
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports {AN[2]}]
set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports {AN[3]}]

## Segments (CA to CG)
set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports {seg[6]}]
set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports {seg[5]}]
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports {seg[4]}]
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports {seg[3]}]
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports {seg[2]}]
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports {seg[1]}]
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports {seg[0]}]