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
//-- Invoked Fri Mar 25 23:33:00 2011
//--
//-- Source file: dma_core_ahbm_rd.v
//---------------------------------------------------------



module dma_ahb64_core0_ahbm_rd(clk,reset,load_wr,load_wr_cycle,joint_stall,load_req_in_prog,rd_ch_num,rd_port_num,rd_cmd_port,rd_burst_start,rd_burst_addr,rd_burst_size,rd_cmd_pending,rd_line_cmd,rd_cmd_line,rd_cmd_num,ch_fifo_wr,ch_fifo_wdata,ch_fifo_wsize,ch_fifo_wr_num,rd_transfer,rd_transfer_size,rd_transfer_num,rd_slverr,rd_clr,rd_clr_last,rd_clr_load,rd_clr_line,rd_clr_line_num,rd_hold,ahb_rd_timeout,ahb_rd_timeout_num,HADDR,HBURST,HSIZE,HTRANS,HLAST,HRDATA,HREADY,HRESP,HOLD,SYNC);

   input               clk;
   input               reset;

   output               load_wr;
   output [1:0]           load_wr_cycle;
   input               joint_stall;
   
   //command
   input               load_req_in_prog;
   input [2:0]               rd_ch_num;
   output               rd_port_num;
   input               rd_cmd_port;
   input               rd_burst_start;
   input [32-1:0]      rd_burst_addr;
   input [8-1:0]     rd_burst_size;
   output               rd_cmd_pending;
   input               rd_line_cmd;
   output               rd_cmd_line;
   output [2:0]           rd_cmd_num;
   
   //data
   output               ch_fifo_wr;
   output [64-1:0]     ch_fifo_wdata;
   output [4-1:0]     ch_fifo_wsize;
   output [2:0]           ch_fifo_wr_num;
   output               rd_transfer;
   output [4-1:0]     rd_transfer_size;
   output [2:0]           rd_transfer_num;

   //resp
   output               rd_slverr;
   output               rd_clr;
   output               rd_clr_last;
   output               rd_clr_load;
   output               rd_clr_line;
   output [2:0]           rd_clr_line_num;
   output               rd_hold;
   output               ahb_rd_timeout;
   output [2:0]           ahb_rd_timeout_num;
   
   output [32-1:0]     HADDR;
   output [2:0]           HBURST;
   output [1:0]           HSIZE;
   output [1:0]           HTRANS;
   output               HLAST;
   input [64-1:0]      HRDATA;
   input               HREADY;
   input               HRESP;
   input               HOLD;
   input               SYNC;
   
   
   wire [32-1:0]       HADDR_base;
   wire [2:0]               HBURST_pre;
   wire [1:0]               HSIZE_pre;
   wire [1:0]               HSIZE_data;
   wire [32-1:0]       HADDR;
   wire [2:0]               HBURST;
   wire [1:0]               HSIZE;
   reg [1:0]               HTRANS;

   
   wire               ch_fifo_wr_pre;
   wire               ch_fifo_wr_pre_d;
   wire               ch_fifo_wr;
   wire               ch_fifo_wr_stall;
   wire               ch_fifo_wr_last;
   reg [64-1:0]           ch_fifo_wdata;
   wire [4-1:0]       ch_fifo_wsize_pre;
   reg [4-1:0]           ch_fifo_wsize;
   reg [2:0]               ch_fifo_wr_num;

   wire               rd_slverr_pre;
   wire               rd_slverr;
   wire               wr_data;
   wire               load_wr_pre;
   reg [1:0]               load_wr_cycle;
   wire               load_wr_last;
   reg                   data_phase;
   wire [8-1:3] strb_num;
   reg [4:0]               cmd_counter;
   wire [4:0]               cmd_num;
   wire               cmd_last;
   wire [4-1:0]       data_width;
   wire               ahb_cmd;
   wire               ahb_cmd_first;
   wire               ahb_cmd_last;
   reg                   ahb_cmd_last_d;
   wire               ahb_data_last;
   wire               ahb_idle;
   wire               ahb_busy;
   wire               cmd_pop_stall;
   wire               cmd_pop;
   wire               cmd_empty;
   wire               cmd_full;
   wire               cmd_next;
   wire               cmd_data_empty;
   wire               cmd_data_full;
   wire               cmd_pending_pre;
   wire               load_data_in_prog;
   wire               rd_port_num;
   wire [2:0]               rd_ch_num_out_cmd;
   wire [2:0]               rd_ch_num_out_data;
   wire               rd_line_out;
   wire               port_change;
   wire               port_change_end;
   wire               port_change_stall;
   wire               rd_clr_pre;
   wire               rd_clr;
   wire               rd_clr_last_pre;
   wire               rd_clr_last;
   wire               rd_clr_line_pre;
   wire               rd_clr_line;
   reg                   rd_clr_line_wait_reg;
   wire               rd_clr_line_wait;
   wire               rd_clr_line_idle;
   reg [2:0]               rd_clr_line_num_reg;
   wire               rd_cmd_line_pre;
   wire               rd_cmd_line;
   reg [2:0]               rd_cmd_num_reg;
   wire               ahb_cmd_line;
   wire               joint_stall_change_pre;
   wire               joint_stall_change;
   wire               joint_stall_last_pre;
   reg                   joint_stall_last;
   wire               rd_burst_stall;
   wire               rd_burst_start_d;
   

   
   
   parameter                  TRANS_IDLE   = 2'b00;
   parameter                  TRANS_BUSY   = 2'b01;
   parameter               TRANS_NONSEQ = 2'b10;
   parameter                  TRANS_SEQ    = 2'b11;
   
   parameter                  BURST_SINGLE = 3'b000;
   parameter               BURST_INCR4  = 3'b011;
   parameter               BURST_INCR8  = 3'b101;
   parameter               BURST_INCR16 = 3'b111;


   
   
   assign               rd_hold          = cmd_data_full | load_data_in_prog;

   assign               wr_data          = data_phase & HREADY;
   assign               load_wr_pre      = load_data_in_prog & wr_data;
   
   assign               ch_fifo_wr_pre   = (~load_data_in_prog) & wr_data;
   assign               ch_fifo_wr_last  = ch_fifo_wr_pre & ahb_cmd_last_d;
   assign               cmd_pending_pre  = HTRANS[1] & (~HREADY);
   
   assign               ahb_cmd          = HTRANS[1] & HREADY & (~HOLD);
   assign               ahb_cmd_first    = ahb_cmd & (HTRANS[1:0] == TRANS_NONSEQ);
   assign               ahb_cmd_last     = ahb_cmd & cmd_last;
   assign               ahb_idle         = HTRANS[1:0] == TRANS_IDLE;
   assign               ahb_busy         = HTRANS[1:0] == TRANS_BUSY;
   
   assign               rd_transfer      = ch_fifo_wr;
   assign               rd_transfer_size = ch_fifo_wsize;
   assign               rd_transfer_num  = ch_fifo_wr_num;
   
   assign               rd_slverr_pre    = data_phase & HREADY & HRESP;
   assign               rd_clr_pre       = ahb_data_last & (~load_data_in_prog);
   assign               rd_clr_last_pre  = ahb_data_last & load_data_in_prog;
   assign               rd_clr_load      = rd_clr_last;
               
   
   prgen_delay #(1) delay_rd_slverr (.clk(clk), .reset(reset), .din(rd_slverr_pre), .dout(rd_slverr));
         
   prgen_delay #(1) delay_load_wr (.clk(clk), .reset(reset), .din(load_wr_pre), .dout(load_wr));
   
   prgen_delay #(1) delay_rd_clr (.clk(clk), .reset(reset), .din(rd_clr_pre), .dout(rd_clr));
   prgen_delay #(1) delay_rd_clr_last (.clk(clk), .reset(reset), .din(rd_clr_last_pre), .dout(rd_clr_last));
   
   prgen_delay #(1) delay_cmd_pending (.clk(clk), .reset(reset), .din(cmd_pending_pre), .dout(rd_cmd_pending));
   

   assign               rd_clr_line_wait = 1'b0;
   assign               rd_clr_line_idle = 1'b0;
   assign               rd_cmd_line_pre  = 1'b0;
   assign               rd_clr_line_pre  = 1'b0;
   assign               rd_cmd_line      = 1'b0;
   assign               rd_cmd_num       = 3'd0;
   assign               rd_clr_line      = 1'b0;
   assign               rd_clr_line_num  = 3'd0;
      

   prgen_delay #(1) delay_fifo_wr (.clk(clk), .reset(reset), .din(ch_fifo_wr_pre), .dout(ch_fifo_wr_pre_d));
   
   
   assign               joint_stall_change_pre = joint_stall & ((rd_transfer_num != rd_ch_num_out_data) | (HOLD & HREADY));
   
   assign               joint_stall_last_pre = joint_stall & ahb_data_last & ahb_idle;
   
   prgen_delay #(1) delay_joint_stall_change (.clk(clk), .reset(reset), .din(joint_stall_change_pre), .dout(joint_stall_change));
   
   always @(posedge clk or posedge reset)
     if (reset)
       joint_stall_last <= #1 1'b0;
     else if (joint_stall_last_pre)
       joint_stall_last <= #1 1'b1;
     else if (!joint_stall)
       joint_stall_last <= #1 1'b0;
   
   assign               ch_fifo_wr_stall = (joint_stall_change & (~ahb_idle)) | joint_stall_last | ahb_busy;

   prgen_stall stall_fifo_wr (.clk(clk), .reset(reset), .din(ch_fifo_wr_pre_d), .stall(ch_fifo_wr_stall), .dout(ch_fifo_wr));
   

   assign               cmd_pop_stall = joint_stall | port_change;

   prgen_stall stall_cmd_pop (.clk(clk), .reset(reset), .din(ahb_cmd_last), .stall(cmd_pop_stall), .dout(cmd_pop));
   
   assign               cmd_num = 
                  HBURST == BURST_INCR16 ? 5'd16 :
                  HBURST == BURST_INCR8  ? 5'd8 :
                  HBURST == BURST_INCR4  ? 5'd4 : 5'd1;
   
   
   assign               load_wr_last = load_wr_pre & ahb_cmd_last_d;
   
   always @(posedge clk or posedge reset)
     if (reset)
       load_wr_cycle <= #1 2'b00;
     else if (load_wr)
       load_wr_cycle <= #1 load_wr_cycle + 1'b1;

   assign               ahb_data_last = ch_fifo_wr_last | load_wr_last;
   
   always @(posedge clk or posedge reset)
     if (reset)
       ahb_cmd_last_d <= #1 1'b0;
     else if (ahb_cmd_last)
       ahb_cmd_last_d <= #1 1'b1;
     else if (ahb_data_last)
       ahb_cmd_last_d <= #1 1'b0;
   
   assign               cmd_last         = cmd_counter == (cmd_num - 1'b1);

   always @(posedge clk or posedge reset)
     if (reset)
       cmd_counter <= #1 5'd0;
     else if (ahb_cmd_last)
       cmd_counter <= #1 5'd0;
     else if (ahb_cmd)
       cmd_counter <= #1 cmd_counter + 1'b1;
   
   always @(posedge clk or posedge reset)
     if (reset)
       data_phase <= #1 1'b0;
     else if (ahb_cmd)
       data_phase <= #1 1'b1;
     else if (ahb_data_last)
       data_phase <= #1 1'b0;


   assign               data_width = 
                  HSIZE == 2'b00 ? 'd1 :
                  HSIZE == 2'b01 ? 'd2 : 
                  HSIZE == 2'b10 ? 'd4 : 'd8;

   assign               ch_fifo_wsize_pre = 
                  HSIZE_data == 2'b00 ? 'd1 :
                  HSIZE_data == 2'b01 ? 'd2 : 
                  HSIZE_data == 2'b10 ? 'd4 : 'd8;

    
   
   always @(posedge clk or posedge reset)
     if (reset)
       begin
      ch_fifo_wsize  <= #1 2'b00;
      ch_fifo_wdata  <= #1 {64{1'b0}};
      ch_fifo_wr_num <= #1 3'b000;
       end
     else if (wr_data)
       begin
      ch_fifo_wsize  <= #1 ch_fifo_wsize_pre;
      ch_fifo_wdata  <= #1 HRDATA;
      ch_fifo_wr_num <= #1 rd_ch_num_out_data;
       end
   
   
   assign               cmd_next = 2 > 1 ? cmd_full : 1'b0;

   assign               HLAST = cmd_last & (~cmd_empty);

   
   assign               rd_burst_stall = (ahb_idle & cmd_empty & ahb_cmd_last_d & (~ahb_data_last)) | joint_stall;
   
   prgen_stall stall_burst_start (.clk(clk), .reset(reset), .din(rd_burst_start), .stall(rd_burst_stall), .dout(rd_burst_start_d));

   always @(posedge clk or posedge reset)
     if (reset)
       HTRANS <= #1 TRANS_IDLE;
     else if (port_change)
       HTRANS <= #1 TRANS_IDLE;
     else if (ahb_idle & port_change_end & (~cmd_data_empty))
       HTRANS <= #1 TRANS_NONSEQ;
     else if (rd_clr_line & ahb_idle & ((~cmd_empty) | rd_burst_start))
       HTRANS <= #1 TRANS_NONSEQ;
     else if (((rd_line_out | rd_cmd_line_pre | joint_stall) & ahb_cmd_last) | rd_clr_line_idle)
       HTRANS <= #1 TRANS_IDLE;
     else if ((rd_burst_start_d & (ahb_idle | ahb_cmd_last)) | (cmd_next & cmd_pop))
       HTRANS <= #1 TRANS_NONSEQ;
     else if (ahb_cmd_last)
       HTRANS <= #1 TRANS_IDLE;
     else if (ahb_cmd & joint_stall)
       HTRANS <= #1 TRANS_BUSY;
     else if (ahb_cmd | (ahb_busy & (~joint_stall)))
       HTRANS <= #1 TRANS_SEQ;

   
   assign               HADDR = HADDR_base | {cmd_counter, {3{1'b0}}};
   
   assign               strb_num = rd_burst_size[8-1:3];
   
   assign               HBURST_pre =
                  strb_num == 'd16 ? BURST_INCR16 :
                  strb_num == 'd8  ? BURST_INCR8  :
                  strb_num == 'd4  ? BURST_INCR4  : BURST_SINGLE;

   assign               HSIZE_pre =
                  rd_burst_size == 'd1 ? 2'b00 :
                  rd_burst_size == 'd2 ? 2'b01 : 
                  rd_burst_size == 'd4 ? 2'b10 : 3;
  
   
   
   prgen_fifo #(32+3+2+1+3+1, 2)
   cmd_fifo(
        .clk(clk),
        .reset(reset),
        .push(rd_burst_start),
        .pop(cmd_pop),
        .din({rd_burst_addr,
          HBURST_pre,
          HSIZE_pre,
          rd_cmd_port,
          rd_ch_num,
          rd_line_cmd
          }),
        .dout({HADDR_base,
           HBURST,
           HSIZE,
           rd_port_num,
           rd_ch_num_out_cmd,
           ahb_cmd_line
           }),
        .empty(cmd_empty),
        .full(cmd_full)
        );

   
   
   prgen_fifo #(3+2+1+1, 2)
   cmd_data_fifo(
         .clk(clk),
         .reset(reset),
         .push(rd_burst_start),
         .pop(ahb_data_last),
         .din({rd_ch_num,
               HSIZE_pre,
               load_req_in_prog,
               rd_line_cmd
               }),
         .dout({rd_ch_num_out_data,
            HSIZE_data,
            load_data_in_prog,
            rd_line_out
            }),
         .empty(cmd_data_empty),
         .full(cmd_data_full)
         );
   

   
   assign               port_change     = 1'b0;
   assign               port_change_end = 1'b0;
   
      
   dma_ahb64_core0_ahbm_timeout  dma_ahb64_core0_ahbm_timeout (
                             .clk(clk),
                             .reset(reset),
                             .HTRANS(HTRANS),
                             .HREADY(HREADY),
                             .ahb_timeout(ahb_rd_timeout)
                             );
   
   assign                     ahb_rd_timeout_num = rd_ch_num_out_cmd;


   
endmodule

   



