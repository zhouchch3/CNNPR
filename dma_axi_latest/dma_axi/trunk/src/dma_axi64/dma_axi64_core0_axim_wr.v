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
//-- Invoked Fri Mar 25 23:36:54 2011
//--
//-- Source file: dma_core_axim_wr.v
//---------------------------------------------------------



module dma_axi64_core0_axim_wr(clk,reset,wr_cmd_port,wr_last_cmd,wr_line_cmd,wr_ch_num,wr_burst_start,wr_burst_addr,wr_burst_size,wr_cmd_pending,wr_cmd_split,wr_cmd_num,rd_transfer,rd_transfer_size,ch_fifo_rd,ch_fifo_rdata,ch_fifo_rd_valid,ch_fifo_rsize,ch_fifo_wr_ready,ch_fifo_rd_num,wr_transfer_num,wr_transfer,wr_transfer_size,wr_next_size,wr_cmd_full,wr_clr_line,wr_clr_line_num,wr_slverr,wr_decerr,wr_clr,wr_clr_last,wr_ch_num_resp,page_cross,AWADDR,AWPORT,AWLEN,AWSIZE,AWVALID,AWREADY,WDATA,WSTRB,WLAST,WVALID,WREADY,BRESP,BVALID,BREADY,joint_req,joint_stall,axim_timeout_aw,axim_timeout_w,axim_timeout_num_aw,axim_timeout_num_w);

   input               clk;
   input               reset;
   
   //command
   input               wr_cmd_port;
   input               wr_last_cmd;
   input               wr_line_cmd;
   input [2:0]               wr_ch_num;
   input               wr_burst_start;
   input [32-1:0]      wr_burst_addr;
   input [8-1:0]     wr_burst_size;
   output               wr_cmd_pending;
   output               wr_cmd_split;
   output [2:0]           wr_cmd_num;

   //data
   input               rd_transfer;
   input [4-1:0]      rd_transfer_size;              
   output               ch_fifo_rd;
   input [64-1:0]      ch_fifo_rdata;
   input               ch_fifo_rd_valid;
   output [4-1:0]     ch_fifo_rsize;
   input               ch_fifo_wr_ready;
   output [2:0]           ch_fifo_rd_num;
   output [2:0]           wr_transfer_num;
   output               wr_transfer;
   output [4-1:0]     wr_transfer_size;
   output [4-1:0]     wr_next_size;
   output               wr_cmd_full;
   output               wr_clr_line;
   output [2:0]           wr_clr_line_num;
   
   //resp
   output               wr_slverr;
   output               wr_decerr;
   output               wr_clr;
   output               wr_clr_last;
   output [2:0]           wr_ch_num_resp;

   output               page_cross;
   
   output [32-1:0]     AWADDR;
   output               AWPORT;
   output [`LEN_BITS-1:0]     AWLEN;
   output [1:0]           AWSIZE;
   output               AWVALID;
   input               AWREADY;
   output [64-1:0]     WDATA;
   output [8-1:0]     WSTRB;
   output               WLAST;
   output               WVALID;
   input               WREADY;
   input [1:0]               BRESP;
   input               BVALID;
   output               BREADY;
   
   input               joint_req;
   output               joint_stall;
   
   output               axim_timeout_aw;
   output               axim_timeout_w;
   output [2:0]           axim_timeout_num_aw;
   output [2:0]           axim_timeout_num_w;


   
   wire [`CMD_BITS-1:0]       AWID;
   wire               AJOINT;
   wire               BVALID_d;
   wire [`CMD_BITS-1:0]       BID;
   reg [1:0]               BRESP_d;
   wire               wr_resp_full;
   

   assign               BREADY   = 1'b1;
   
   
   prgen_delay #(1) delay_bvalid(.clk(clk), .reset(reset), .din(BVALID), .dout(BVALID_d));

   always @(posedge clk or posedge reset)
     if (reset)
       begin
      BRESP_d <= #1 2'b00;
       end
     else if (BVALID)
       begin
      BRESP_d <= #1 BRESP;
       end

   
   dma_axi64_core0_axim_cmd
   dma_axi64_axim_wcmd (
             .clk(clk),
             .reset(reset),
             .end_line_cmd(wr_line_cmd),
             .extra_bit(wr_last_cmd),
             .cmd_port(wr_cmd_port),
             .joint_req(joint_req),
             .ch_num(wr_ch_num),
             .burst_start(wr_burst_start),
             .burst_addr(wr_burst_addr),
             .burst_size(wr_burst_size),
             .cmd_pending(wr_cmd_pending),
             .cmd_full(wr_cmd_full),
             .cmd_split(wr_cmd_split),
             .cmd_num(wr_cmd_num),
             .cmd_line(),
             .page_cross(page_cross),
             .AID(AWID),
             .AADDR(AWADDR),
             .APORT(AWPORT),
             .ALEN(AWLEN),
             .ASIZE(AWSIZE),
             .AVALID(AWVALID),
             .AREADY(AWREADY),
             .AWVALID(1'b0),
             .AJOINT(AJOINT),
             .axim_timeout_num(axim_timeout_num_aw),
             .axim_timeout(axim_timeout_aw)
             );

   
   dma_axi64_core0_axim_wdata
   dma_axi64_axim_wdata (
              .clk(clk),
              .reset(reset),
              .joint_stall(joint_stall),
              .rd_transfer(rd_transfer),
              .rd_transfer_size(rd_transfer_size),
              .ch_fifo_rd(ch_fifo_rd),
              .ch_fifo_rdata(ch_fifo_rdata),
              .ch_fifo_rd_valid(ch_fifo_rd_valid),
              .ch_fifo_rsize(ch_fifo_rsize),
              .ch_fifo_rd_num(ch_fifo_rd_num),
              .ch_fifo_wr_ready(ch_fifo_wr_ready),
              .wr_transfer_num(wr_transfer_num),
              .wr_transfer(wr_transfer),
              .wr_transfer_size(wr_transfer_size),
              .wr_next_size(wr_next_size),
              .wr_resp_full(wr_resp_full),
              .wr_cmd_full(wr_cmd_full),
              .wr_clr_line(wr_clr_line),
              .wr_clr_line_num(wr_clr_line_num),
              .AWID(AWID),
              .AWADDR(AWADDR),
              .AWLEN(AWLEN),
              .AWSIZE(AWSIZE),
              .AWVALID(AWVALID),
              .AWREADY(AWREADY),
              .AJOINT(AJOINT),
              .WDATA(WDATA),
              .WSTRB(WSTRB),
              .WLAST(WLAST),
              .WVALID(WVALID),
              .WREADY(WREADY),
              .axim_timeout_num(axim_timeout_num_w),
              .axim_timeout(axim_timeout_w)
              );

   
   dma_axi64_core0_axim_resp #(.CMD_DEPTH(4))
   dma_axi64_axim_wresp (
              .clk(clk),
              .reset(reset),
              .slverr(wr_slverr),
              .decerr(wr_decerr),
              .clr(wr_clr),
              .clr_last(wr_clr_last),
              .ch_num_resp(wr_ch_num_resp),
              .resp_full(wr_resp_full),
              .AID(AWID),
              .AVALID(AWVALID),
              .AREADY(AWREADY),
              .ID(BID),
              .RESP(BRESP_d),
              .VALID(BVALID_d),
              .READY(BREADY),
              .LAST(1'b1)
              );

   
endmodule

   


