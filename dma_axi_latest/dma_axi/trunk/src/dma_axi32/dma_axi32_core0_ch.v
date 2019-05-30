/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Author: Eyal Hochberg                                      ////
////          eyal@provartec.com                                 ////
////                                                             ////
////  Downloaded from: http://www.opencores.org                  ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2010 Provartec LTD                            ////
//// www.provartec.com                                           ////
//// info@provartec.com                                          ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
//// This source file is free software; you can redistribute it  ////
//// and/or modify it under the terms of the GNU Lesser General  ////
//// Public License as published by the Free Software Foundation.////
////                                                             ////
//// This source is distributed in the hope that it will be      ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied  ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR     ////
//// PURPOSE.  See the GNU Lesser General Public License for more////
//// details. http://www.gnu.org/licenses/lgpl.html              ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:34:52 2011
//--
//-- Source file: dma_ch.v
//---------------------------------------------------------


    

module dma_axi32_core0_ch (clk,reset,scan_en,pclk,clken,pclken,psel,penable,paddr,pwrite,pwdata,prdata,pslverr,periph_tx_req,periph_tx_clr,periph_rx_req,periph_rx_clr,rd_cmd_split,rd_cmd_line,rd_clr_line,rd_clr,rd_clr_load,rd_slverr,rd_decerr,wr_cmd_split,wr_cmd_pending,wr_clr_line,wr_clr,wr_clr_last,wr_slverr,wr_decerr,load_wr,load_wr_cycle,load_wdata,load_req_in_prog,int_all_proc,ch_start,idle,ch_active,ch_rd_active,ch_wr_active,wr_last_cmd,rd_line_cmd,wr_line_cmd,rd_go_next_line,wr_go_next_line,rd_ready,rd_burst_start,rd_burst_addr,rd_burst_size,rd_tokens,rd_port_num,rd_periph_delay,rd_clr_valid,rd_transfer,rd_transfer_size,rd_clr_stall,wr_ready,wr_burst_start,wr_burst_addr,wr_burst_size,wr_tokens,wr_port_num,wr_periph_delay,wr_clr_valid,wr_transfer,wr_transfer_size,wr_next_size,wr_clr_stall,wr_incr,timeout_aw,timeout_w,timeout_ar,wdt_timeout,fifo_wr,fifo_wdata,fifo_wsize,fifo_rd,fifo_rsize,fifo_rd_valid,fifo_rdata,fifo_wr_ready,joint_mode,joint_remote,rd_page_cross,wr_page_cross,joint_in_prog,joint_not_in_prog,joint_mux_in_prog,joint_req);

   input             clk;
   input             reset;
   input             scan_en;
   
   input             pclk;
   input             clken;
   input             pclken;
   input             psel;
   input             penable;
   input [7:0]             paddr;
   input             pwrite;
   input [31:0]         pwdata;
   output [31:0]         prdata;
   output             pslverr;
   
   input [31:1]         periph_tx_req;
   output [31:1]         periph_tx_clr;
   input [31:1]         periph_rx_req;
   output [31:1]         periph_rx_clr;

   input             rd_cmd_split;
   input             rd_cmd_line;
   input             rd_clr_line;
   input             rd_clr;
   input             rd_clr_load;
   input             rd_slverr;
   input             rd_decerr;

   input             wr_cmd_split;
   input             wr_cmd_pending;
   input             wr_clr_line;
   input             wr_clr;
   input             wr_clr_last;
   input             wr_slverr;
   input             wr_decerr;
   
   input             load_wr;
   input [1:0]             load_wr_cycle;
   input [32-1:0]    load_wdata;
   output             load_req_in_prog;
   
   output [1-1:0]    int_all_proc;
   input              ch_start;
   output             idle;
   output             ch_active;
   output             ch_rd_active;
   output             ch_wr_active;
   output             wr_last_cmd;
   output             rd_line_cmd;
   output             wr_line_cmd;
   output             rd_go_next_line;
   output             wr_go_next_line;
   
   output             rd_ready;
   input             rd_burst_start;
   output [32-1:0]   rd_burst_addr;
   output [7-1:0]  rd_burst_size;
   output [`TOKEN_BITS-1:0] rd_tokens;
   output             rd_port_num;
   output [`DELAY_BITS-1:0] rd_periph_delay;
   output             rd_clr_valid;
   input             rd_transfer;
   input [3-1:0]    rd_transfer_size;
   output             rd_clr_stall;
   
   output             wr_ready;
   input             wr_burst_start;
   output [32-1:0]   wr_burst_addr;
   output [7-1:0]  wr_burst_size;
   output [`TOKEN_BITS-1:0] wr_tokens;
   output             wr_port_num;
   output [`DELAY_BITS-1:0] wr_periph_delay; 
   output             wr_clr_valid;
   input             wr_transfer;
   input [3-1:0]    wr_transfer_size;
   input [3-1:0]    wr_next_size;
   output             wr_clr_stall;
   output             wr_incr;
   
   input              timeout_aw;
   input              timeout_w;
   input              timeout_ar;
   input             wdt_timeout;

   input             fifo_wr;
   input [32-1:0]    fifo_wdata;
   input [3-1:0]    fifo_wsize;
   
   input             fifo_rd;
   input [3-1:0]    fifo_rsize;
   
   output             fifo_rd_valid;
   output [32-1:0]   fifo_rdata;
   output             fifo_wr_ready;
   
   input             joint_mode;
   input             joint_remote;
   input             rd_page_cross;
   input             wr_page_cross;
   output             joint_in_prog;
   output             joint_not_in_prog;
   output             joint_mux_in_prog;
   output             joint_req;

   

   
   //outputs of reg
   wire [32-1:0]     load_addr;
   wire             load_in_prog;
   wire             load_req_in_prog;
   wire             ch_update;
   wire [32-1:0]     rd_start_addr;
   wire [32-1:0]     wr_start_addr;
   wire [10-1:0]     x_size;
   wire [10-`X_BITS-1:0]         y_size;
   wire             block;
   wire             joint;
   wire [`FRAME_BITS-1:0]   frame_width;
   wire [2-1:0]     width_align;
   wire [`DELAY_BITS-1:0]   rd_periph_delay; 
   wire [`DELAY_BITS-1:0]   wr_periph_delay;
   wire             rd_periph_block;
   wire             wr_periph_block;
   wire [`TOKEN_BITS-1:0]   rd_tokens;
   wire [`TOKEN_BITS-1:0]   wr_tokens;
   wire             rd_port_num;
   wire             wr_port_num;
   wire [`OUT_BITS-1:0]     rd_outs_max;
   wire [`OUT_BITS-1:0]     wr_outs_max;    
   wire [`WAIT_BITS-1:0]    rd_wait_limit;
   wire [`WAIT_BITS-1:0]    wr_wait_limit;
   wire             rd_incr;
   wire             wr_incr;
   wire [7-1:0]    rd_burst_max_size;
   wire [7-1:0]    wr_burst_max_size;
   wire [4:0]             rd_periph_num;
   wire [4:0]             wr_periph_num;
   wire             wr_outstanding;
   wire             rd_outstanding;
   wire             ch_retry_wait;
   wire             ch_rd_active;
   wire             ch_wr_active;
   wire             ch_in_prog;
   wire [1:0]             end_swap;
   
   //outputs of rd offsets
   wire [10-1:0]     rd_x_offset;
   wire [10-`X_BITS-1:0]    rd_y_offset;        
   wire [10-1:0]     rd_x_remain;
   wire [10-`X_BITS-1:0]    rd_clr_remain;
   wire             rd_ch_end;
   wire             rd_go_next_line;
   wire             rd_line_empty;
   wire             rd_empty;
   wire [2-1:0]     rd_align;
   
   //outputs of wr offsets
   wire [10-1:0]     wr_x_offset;
   wire [10-`X_BITS-1:0]    wr_y_offset;        
   wire [10-1:0]     wr_x_remain;
   wire [10-`X_BITS-1:0]    wr_clr_remain;
   wire             wr_ch_end;
   wire             wr_go_next_line;
   wire             wr_line_empty;
   wire             wr_empty;
   wire [2-1:0]     wr_align;
   wire             wr_ch_end_pre;
   reg                 wr_ch_end_reg;

   //outputs of remain
   wire [5:0]         rd_gap;
   wire [5:0]         wr_fullness; 

   //outputs of outs rd
   wire             rd_cmd_outs;
   wire             rd_clr_outs;
   wire [`OUT_BITS-1:0]     rd_outs;
   wire             rd_outs_empty;
   wire             outs_empty;
   wire             rd_stall;
   wire             timeout_rresp;
   
   //outputs of outs wr
   wire             wr_cmd_outs;
   wire             wr_clr_outs;
   wire [`OUT_BITS-1:0]     wr_outs;
   wire             wr_outs_empty;
   wire             wr_stall;
   wire             wr_stall_pre;
   wire             timeout_wresp;
   
   //outputs of calc rd
   wire             rd_burst_last;
   wire [32-1:0]     rd_burst_addr;
   wire [7-1:0]    rd_burst_size;
   wire             rd_burst_ready;
   wire             rd_joint_ready;
   wire             rd_joint_flush;
   wire             joint_burst_req;
   
   //outputs of calc wr
   wire             wr_burst_last;             
   wire [32-1:0]     wr_burst_addr;
   wire [7-1:0]    wr_burst_size;
   wire             wr_burst_ready;
   wire             wr_single; 
   wire             wr_joint_ready;
   wire             wr_joint_flush;
   wire             joint_line_req;
   
   //outputs of rd periph mux
   wire [31:1]             periph_rx_clr;
   wire             rd_periph_ready;
   
   //outputs of wr periph mux
   wire [31:1]             periph_tx_clr;
   wire             wr_periph_ready;

   //outputs of rd wait
   wire             rd_wait_ready;

   //outputs of wr wait
   wire             wr_wait_ready;
   
   //outputs of fifo_ctrl
   wire             fifo_wr_ready;
   wire             fifo_overflow;
   wire             fifo_underflow;
      
   wire             rd_clr_block_pre;
   wire             rd_clr_block;
   wire             rd_clr_valid;
   wire             wr_clr_block_pre;
   wire             wr_clr_block;
   wire             wr_clr_valid;
   wire             wr_clr_mux;
   
   wire             rd_cmd_line_d;
   wire             rd_clr_stall;
   wire             wr_clr_stall;
   wire             allow_line_cmd;
      
   wire             load_cmd;

   wire [4:0]             timeout_bus;            

   wire             joint_flush;
   wire             page_cross;
   reg                 joint_cross_reg;
   wire             joint_cross;
   reg                 rd_joint_not_in_prog;
   reg                 wr_joint_not_in_prog;
   wire             joint_not_in_prog;
   reg                 rd_joint_in_prog;
   reg                 wr_joint_in_prog;
   wire             joint_in_prog;
   wire             rd_clr_outs_d_pre;
   wire             rd_clr_outs_d;
   wire             wr_clr_outs_d_pre;
   wire             wr_clr_outs_d;
   wire             rd_clr_d;
   wire             wr_clr_d;
   wire             access_port0_mux;
   wire             access_port1_mux;

   wire             idle_pre;
   wire             clk_en;
   wire             gclk;
   
   
   assign             ch_active         = ch_in_prog | load_in_prog;

   assign             outs_empty        = rd_outs_empty & wr_outs_empty;
   
   

   assign             rd_clr_outs_d_pre = rd_clr_outs & (~rd_burst_start);
   assign             wr_clr_outs_d_pre = wr_clr_outs & (~wr_burst_start);

   prgen_delay #(1) delay_rd_clr_outs (.clk(clk), .reset(reset), .din(rd_clr_outs_d_pre), .dout(rd_clr_outs_d));
   prgen_delay #(1) delay_wr_clr_outs (.clk(clk), .reset(reset), .din(wr_clr_outs_d_pre), .dout(wr_clr_outs_d));
   
   prgen_delay #(1) delay_rd_clr (.clk(clk), .reset(reset), .din(rd_clr), .dout(rd_clr_d));
   prgen_delay #(1) delay_wr_clr (.clk(clk), .reset(reset), .din(wr_clr), .dout(wr_clr_d));
   
   always @(posedge clk or posedge reset)
     if (reset)
       rd_joint_not_in_prog <= #1 1'b0;
     else if (ch_update)
       rd_joint_not_in_prog <= #1 1'b0;
     else if (rd_burst_start)
       rd_joint_not_in_prog <= #1 (~joint_req);
     else if (rd_outs_empty & rd_clr_outs_d)
       rd_joint_not_in_prog <= #1 1'b0;
   
   always @(posedge clk or posedge reset)
     if (reset)
       wr_joint_not_in_prog <= #1 1'b0;
     else if (ch_update)
       wr_joint_not_in_prog <= #1 1'b0;
     else if (wr_burst_start)
       wr_joint_not_in_prog <= #1 (~joint_req);
     else if (wr_outs_empty & wr_clr_outs_d)
       wr_joint_not_in_prog <= #1 1'b0;
   
   always @(posedge clk or posedge reset)
     if (reset)
       rd_joint_in_prog <= #1 1'b0;
     else if (ch_update)
       rd_joint_in_prog <= #1 1'b0;
     else if (rd_burst_start)
       rd_joint_in_prog <= #1 joint_req;
     else if (rd_outs_empty & rd_clr_outs_d)
       rd_joint_in_prog <= #1 1'b0;
   
   always @(posedge clk or posedge reset)
     if (reset)
       wr_joint_in_prog <= #1 1'b0;
     else if (ch_update)
       wr_joint_in_prog <= #1 1'b0;
     else if (wr_burst_start)
       wr_joint_in_prog <= #1 joint_req;
     else if (wr_outs_empty & wr_clr_outs_d)
       wr_joint_in_prog <= #1 1'b0;
   
   always @(posedge clk or posedge reset)
     if (reset)
       joint_cross_reg <= #1 1'b0;
     else if (ch_update)
       joint_cross_reg <= #1 1'b0;
     else if (page_cross & joint)
       joint_cross_reg <= #1 1'b1;
     else if (joint_not_in_prog & outs_empty)
       joint_cross_reg <= #1 1'b0;

   assign             joint_cross       = joint_cross_reg;
   assign             page_cross        = rd_page_cross | wr_page_cross;
   assign             joint_in_prog     = rd_joint_in_prog | wr_joint_in_prog;
   assign             joint_not_in_prog = rd_joint_not_in_prog | wr_joint_not_in_prog;

   assign             access_port0_mux  = ((rd_port_num == 1'b0) | ((wr_port_num == 1'b0))) & 0;
   assign             access_port1_mux  = ((rd_port_num == 1'b1) | ((wr_port_num == 1'b1))) & 0;
   assign             joint_mux_in_prog = joint_in_prog & (access_port0_mux | access_port1_mux);
   
   assign             joint_req         = joint & rd_joint_ready & wr_joint_ready & (~joint_cross) & (~load_req_in_prog);
   assign             joint_flush       = rd_joint_flush | wr_joint_flush;

   
   assign             rd_clr_block      = 1'b1;
   assign             wr_clr_block      = 1'b1;
   assign             wr_clr_mux        = wr_clr;
   assign             rd_clr_stall      = 1'b0;
   assign             wr_clr_stall      = 1'b0;
   assign             allow_line_cmd    = 1'b0;
   assign             rd_line_cmd       = 1'b0;
   assign             wr_line_cmd       = 1'b0;

   assign             rd_clr_valid   = rd_clr_block & (~ch_retry_wait);
   assign             wr_clr_valid   = wr_clr_block & (~ch_retry_wait);
      
   assign             rd_ready       = (~rd_stall) & (~rd_clr_stall) &
                                 ch_rd_active & (rd_periph_ready | load_req_in_prog) &
                rd_wait_ready & rd_burst_ready;

  
   assign             wr_ready       = (~wr_stall) & (~wr_clr_stall) &
                                 ch_wr_active & wr_periph_ready &
                wr_wait_ready & wr_burst_ready;
   
   assign             wr_last_cmd    = wr_empty;
   
   assign             load_cmd       = load_req_in_prog & rd_burst_start;

   assign             rd_cmd_outs    = rd_burst_start | rd_cmd_split;
   assign             wr_cmd_outs    = wr_burst_start | wr_cmd_split;

   assign             rd_clr_outs    = rd_clr | rd_clr_load;
   assign             wr_clr_outs    = wr_clr;
  

   assign             timeout_bus    = {
                          timeout_aw,
                          timeout_w,
                          {timeout_wresp & (~timeout_aw)},
                          timeout_ar,
                          {timeout_rresp & (~timeout_ar)}
                          };
   

   assign             clk_en         = ch_active | ch_update | (~outs_empty) | (~rd_wait_ready) | (~wr_wait_ready);
   
   assign             idle_pre       = !clk_en;
   prgen_delay #(1) delay_idle (.clk(clk), .reset(reset), .din(idle_pre), .dout(idle));

   assign             gclk = clk;
   
   
   dma_axi32_core0_ch_reg
   dma_axi32_ch_reg (
          .clk(pclk),
          .clken(clken),
          .pclken(pclken),
          .reset(reset),
          .psel(psel),
          .penable(penable),
          .paddr(paddr),
          .pwrite(pwrite),
          .pwdata(pwdata),
          .prdata(prdata),
          .pslverr(pslverr),
      
          .timeout_bus(timeout_bus),
          .wdt_timeout(wdt_timeout),

          .ch_start(ch_start),
          .load_wr(load_wr),
          .load_wr_cycle(load_wr_cycle),
          .load_wdata(load_wdata),
          .load_in_prog(load_in_prog),
          .load_req_in_prog(load_req_in_prog),
          .rd_ch_end(rd_ch_end),
          .wr_ch_end(wr_ch_end),
          .wr_clr_last(wr_clr_last),
          .rd_slverr(rd_slverr),
          .rd_decerr(rd_decerr),
          .wr_slverr(wr_slverr),
          .wr_decerr(wr_decerr),
          .int_all_proc(int_all_proc),
          .ch_rd_active(ch_rd_active),
          .ch_wr_active(ch_wr_active),
          .ch_in_prog(ch_in_prog),
          .wr_outstanding(wr_outstanding),
          .rd_outstanding(rd_outstanding),
          .ch_retry_wait(ch_retry_wait),
          
          .joint_mode(joint_mode),
          .joint_remote(joint_remote),
          .joint(joint),
          .joint_cross(joint_cross),
          .page_cross(page_cross),
          .joint_flush(joint_flush),
      
          .rd_x_offset(rd_x_offset),
          .rd_y_offset(rd_y_offset),
          .wr_x_offset(wr_x_offset),
          .wr_y_offset(wr_y_offset),
          .rd_gap(rd_gap),
          .wr_fullness(wr_fullness),
          .fifo_overflow(fifo_overflow),
          .fifo_underflow(fifo_underflow),
      
          .load_cmd(load_cmd),
          .load_addr(load_addr),
      
          .ch_update(ch_update),
          .rd_start_addr(rd_start_addr),
          .wr_start_addr(wr_start_addr),
          .x_size(x_size),
          .y_size(y_size),
      
          .rd_burst_max_size(rd_burst_max_size),
          .wr_burst_max_size(wr_burst_max_size),
          .rd_periph_delay(rd_periph_delay),
          .wr_periph_delay(wr_periph_delay),
          .rd_periph_block(rd_periph_block),
          .wr_periph_block(wr_periph_block),
          .rd_tokens(rd_tokens),
          .wr_tokens(wr_tokens),
          .end_swap(end_swap),
          .rd_port_num(rd_port_num),
          .wr_port_num(wr_port_num),
          .rd_outs_max(rd_outs_max),
          .wr_outs_max(wr_outs_max),
          .rd_outs(rd_outs),
          .wr_outs(wr_outs),
          .outs_empty(outs_empty),
          .rd_wait_limit(rd_wait_limit),
          .wr_wait_limit(wr_wait_limit),
          .rd_periph_num(rd_periph_num),
          .wr_periph_num(wr_periph_num),
          .rd_incr(rd_incr),
          .wr_incr(wr_incr),
          .block(block),
          .allow_line_cmd(allow_line_cmd),
          .frame_width(frame_width),
          .width_align(width_align)
          );

   
   dma_axi32_core0_ch_offsets
   dma_axi32_ch_offsets_rd (
             .clk(gclk),
             .reset(reset),
             .ch_update(ch_update),
             .burst_start(rd_burst_start),
             .burst_last(rd_burst_last),
             .burst_size(rd_burst_size),
             .load_req_in_prog(load_req_in_prog),
             .x_size(x_size),
             .y_size(y_size),
             .x_offset(rd_x_offset),
             .y_offset(rd_y_offset),
             .x_remain(rd_x_remain),
             .clr_remain(rd_clr_remain),
             .ch_end(rd_ch_end),
             .go_next_line(rd_go_next_line),
             .incr(rd_incr),
             .clr_line(rd_clr_line),
             .line_empty(rd_line_empty),
             .empty(rd_empty),
             .start_align(rd_start_addr[2-1:0]),
             .width_align(width_align),
             .align(wr_align) //rd address writes to fifo
             );

   dma_axi32_core0_ch_offsets
   dma_axi32_ch_offsets_wr (
             .clk(gclk),
             .reset(reset),
             .ch_update(ch_update),
             .burst_start(wr_burst_start),
             .burst_last(wr_burst_last),
             .burst_size(wr_burst_size),
             .load_req_in_prog(1'b0),
             .x_size(x_size),
             .y_size(y_size),
             .x_offset(wr_x_offset),
             .y_offset(wr_y_offset),
             .x_remain(wr_x_remain),
             .clr_remain(wr_clr_remain),
             .ch_end(wr_ch_end),
             .go_next_line(wr_go_next_line),
             .incr(wr_incr),
             .clr_line(wr_clr_line),
             .line_empty(wr_line_empty),
             .empty(wr_empty),
             .start_align(wr_start_addr[2-1:0]),
             .width_align(width_align),
             .align(rd_align) //wr address reads from fifo
             );
   
   
   dma_axi32_core0_ch_remain
   dma_axi32_ch_remain (
               .clk(gclk),
               .reset(reset),
               .ch_update(ch_update),
               .wr_outstanding(wr_outstanding),
               .rd_outstanding(rd_outstanding),
               .load_req_in_prog(load_req_in_prog),
               .rd_line_cmd(rd_line_cmd),
               .rd_burst_start(rd_burst_start),
               .rd_burst_size(rd_burst_size),
               .rd_transfer(rd_transfer),
               .rd_transfer_size(rd_transfer_size),
               .wr_clr_line(wr_clr_line),
               .wr_burst_start(wr_burst_start),
               .wr_burst_size(wr_burst_size),
               .wr_transfer(wr_transfer),
               .wr_transfer_size(wr_transfer_size),
               .rd_gap(rd_gap),
               .wr_fullness(wr_fullness)
               );

   
   dma_axi32_core0_ch_outs dma_axi32_ch_outs_rd(
                      .clk(gclk),
                      .reset(reset),
                      .cmd(rd_cmd_outs),
                      .clr(rd_clr_outs),
                      .outs_max(rd_outs_max),
                      .outs(rd_outs),
                      .outs_empty(rd_outs_empty),
                      .stall(rd_stall),
                      .timeout(timeout_rresp)
                      );
   
   dma_axi32_core0_ch_outs dma_axi32_ch_outs_wr(
                      .clk(gclk),
                      .reset(reset),
                      .cmd(wr_cmd_outs),
                      .clr(wr_clr_outs),
                      .outs_max(wr_outs_max),
                      .outs(wr_outs),
                      .outs_empty(wr_outs_empty),
                      .stall(wr_stall_pre),
                      .timeout(timeout_wresp)
                      );

   assign             wr_stall = wr_stall_pre & (~joint_req);
   
   
   
   dma_axi32_core0_ch_calc #(.READ(1))
   dma_axi32_ch_calc_rd (
              .clk(gclk),
              .reset(reset),
              .wr_cmd_pending(1'b0),
              .outs_empty(outs_empty),
              .load_in_prog(load_in_prog),
              .load_req_in_prog(load_req_in_prog),
              .load_addr(load_addr),
              .ch_update(ch_update),
              .ch_end(rd_ch_end),
              .ch_end_flush(1'b0),
              .go_next_line(rd_go_next_line),
              .burst_start(rd_burst_start),
              .burst_last(rd_burst_last),
              .burst_max_size(rd_burst_max_size),
              .start_addr(rd_start_addr),
              .incr(rd_incr),
              .frame_width(frame_width),
              .x_size(x_size[`X_BITS-1:0]),
              .x_remain(rd_x_remain),
              .fifo_remain(rd_gap),
              .fifo_wr_ready(fifo_wr_ready),
              .burst_addr(rd_burst_addr),
              .burst_size(rd_burst_size),
              .burst_ready(rd_burst_ready),
              .single(),
              .joint_ready_out(rd_joint_ready),
              .joint_ready_in(wr_joint_ready),
              .joint_line_req_in(joint_line_req),
              .joint_line_req_out(),
              .joint_burst_req_in(1'b0),
              .joint_burst_req_out(joint_burst_req),
              .joint_line_req_clr(wr_clr_d),
              .joint(joint),
              .page_cross(rd_page_cross),
              .joint_cross(joint_cross),
              .joint_flush(rd_joint_flush),
              .joint_flush_in(joint_flush)
              );

   
   dma_axi32_core0_ch_calc #(.READ(0))
   dma_axi32_ch_calc_wr (
              .clk(gclk),
              .reset(reset),
              .wr_cmd_pending(wr_cmd_pending),
              .outs_empty(outs_empty),
              .load_in_prog(load_in_prog),
              .load_req_in_prog(1'b0),
              .load_addr({32{1'b0}}),
              .ch_update(ch_update),
              .ch_end(wr_ch_end),
              .ch_end_flush(rd_ch_end),
              .go_next_line(wr_go_next_line),
              .burst_start(wr_burst_start),
              .burst_last(wr_burst_last),
              .burst_max_size(wr_burst_max_size),
              .start_addr(wr_start_addr),
              .incr(wr_incr),
              .frame_width(frame_width),
              .x_size(x_size[`X_BITS-1:0]),
              .x_remain(wr_x_remain),
              .fifo_wr_ready(1'b0),
              .fifo_remain(wr_fullness),
              .burst_addr(wr_burst_addr),
              .burst_size(wr_burst_size),
              .burst_ready(wr_burst_ready),
              .single(wr_single),
              .joint_ready_out(wr_joint_ready),
              .joint_ready_in(rd_joint_ready),
              .joint_line_req_in(1'b0),
              .joint_line_req_out(joint_line_req),
              .joint_burst_req_in(joint_burst_req),
              .joint_burst_req_out(),
              .joint_line_req_clr(rd_clr_d),
              .joint(joint),
              .page_cross(wr_page_cross),
              .joint_cross(joint_cross),
              .joint_flush(wr_joint_flush),
              .joint_flush_in(joint_flush)
              );


   assign             rd_wait_ready = 1'b1;
   assign             wr_wait_ready = 1'b1;
   

   
   dma_axi32_core0_ch_periph_mux dma_axi32_ch_periph_mux_rd(
                              .clk(gclk),
                              .reset(reset),
                              .clken(clken),
                              .periph_req(periph_rx_req),
                              .periph_clr(periph_rx_clr),
                              .periph_ready(rd_periph_ready),
                              .periph_num(rd_periph_num),
                              .clr_valid(rd_clr_valid),
                              .clr(rd_clr)
                              );

   
   dma_axi32_core0_ch_periph_mux dma_axi32_ch_periph_mux_wr(
                              .clk(gclk),
                              .reset(reset),
                              .clken(clken),
                              .periph_req(periph_tx_req),
                              .periph_clr(periph_tx_clr),
                              .periph_ready(wr_periph_ready),
                              .periph_num(wr_periph_num),
                              .clr_valid(wr_clr_valid),
                              .clr(wr_clr_mux)
                              );
   


   dma_axi32_core0_ch_fifo_ctrl
   dma_axi32_ch_fifo_ctrl (
            .clk(clk),
            .reset(reset),
            .end_swap(end_swap),
            .joint_in_prog(joint_in_prog),
            .wr_outstanding(wr_outstanding),
            .ch_update(ch_update),
            .fifo_wr(fifo_wr),
            .fifo_wdata(fifo_wdata),
            .fifo_wsize(fifo_wsize),
            .wr_align(wr_align),
            .wr_single(wr_single),
            .rd_incr(rd_incr),
            .fifo_rd(fifo_rd),
            .fifo_rsize(fifo_rsize),
            .rd_align(rd_align),
            .wr_incr(wr_incr),
            .wr_burst_size(wr_burst_size),
            .rd_clr_line(rd_clr_line),
            .wr_clr_line(wr_clr_line),
            .wr_next_size(wr_next_size),
      
            .fifo_rd_valid(fifo_rd_valid),
            .fifo_rdata(fifo_rdata),
            .fifo_wr_ready(fifo_wr_ready),
            .fifo_overflow(fifo_overflow),
            .fifo_underflow(fifo_underflow)
            );




   
endmodule


