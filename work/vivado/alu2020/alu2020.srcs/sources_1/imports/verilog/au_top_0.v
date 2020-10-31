/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input usb_rx,
    output reg usb_tx,
    input rst_n,
    output reg [7:0] led,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input button
  );
  
  
  
  reg rst;
  
  wire [24-1:0] M_fsmLogicInstance_io_led;
  wire [8-1:0] M_fsmLogicInstance_io_seg;
  wire [4-1:0] M_fsmLogicInstance_io_sel;
  reg [5-1:0] M_fsmLogicInstance_io_button;
  reg [24-1:0] M_fsmLogicInstance_io_dip;
  fsmLogic_1 fsmLogicInstance (
    .clk(clk),
    .rst(rst),
    .io_button(M_fsmLogicInstance_io_button),
    .io_dip(M_fsmLogicInstance_io_dip),
    .io_led(M_fsmLogicInstance_io_led),
    .io_seg(M_fsmLogicInstance_io_seg),
    .io_sel(M_fsmLogicInstance_io_sel)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    io_seg = M_fsmLogicInstance_io_seg;
    io_sel = M_fsmLogicInstance_io_sel;
    usb_tx = usb_rx;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    io_led = M_fsmLogicInstance_io_led;
    M_fsmLogicInstance_io_dip = io_dip;
    M_fsmLogicInstance_io_button = io_button;
  end
endmodule
