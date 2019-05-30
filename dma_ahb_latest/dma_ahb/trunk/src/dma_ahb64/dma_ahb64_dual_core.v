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
//-- Invoked Fri Mar 25 23:32:58 2011
//--
//-- Source file: dma_dual_core.v
//---------------------------------------------------------



module dma_ahb64_dual_core(clk,reset,scan_en,idle,INT,periph_tx_req,periph_tx_clr,periph_rx_req,periph_rx_clr,pclken,psel,penable,paddr,pwrite,pwdata,prdata,pslverr,pready,rd_port_num0,wr_port_num0,rd_port_num1,wr_port_num1,M0_WHADDR,M0_WHBURST,M0_WHSIZE,M0_WHTRANS,M0_WHWDATA,M0_WHREADY,M0_WHRESP,M0_RHADDR,M0_RHBURST,M0_RHSIZE,M0_RHTRANS,M0_RHRDATA,M0_RHREADY,M0_RHRESP,M0_WHLAST,M0_WHOLD,M0_RHLAST,M0_RHOLD);
      
   input                   clk;
   input                   reset;
   input                   scan_en;

   output                   idle;
   output [1-1:0]                  INT;
   
   input [31:1]               periph_tx_req;
   output [31:1]               periph_tx_clr;
   input [31:1]               periph_rx_req;
   output [31:1]               periph_rx_clr;
   
   input                                  pclken;
   input                                  psel;
   input                                  penable;
   input [12:0]                           paddr;
   input                                  pwrite;
   input [31:0]                           pwdata;
   output [31:0]                          prdata;
   output                                 pslverr;
   output                                 pready;

   output                   rd_port_num0;
   output                   wr_port_num0;
   output                   rd_port_num1;
   output                   wr_port_num1;
   
   output [32-1:0]           M0_WHADDR;
   output [2:0]                           M0_WHBURST;
   output [1:0]                           M0_WHSIZE;
   output [1:0]                           M0_WHTRANS;
   output [64-1:0]           M0_WHWDATA;
   input                                  M0_WHREADY;
   input                                  M0_WHRESP;
   output [32-1:0]           M0_RHADDR;
   output [2:0]                           M0_RHBURST;
   output [1:0]                           M0_RHSIZE;
   output [1:0]                           M0_RHTRANS;
   input [64-1:0]            M0_RHRDATA;
   input                                  M0_RHREADY;
   input                                  M0_RHRESP;
   output                                 M0_WHLAST;
   input                                  M0_WHOLD;
   output                                 M0_RHLAST;
   input                                  M0_RHOLD;
   
   

   wire                   psel0;
   wire [31:0]                   prdata0;
   wire                   pslverr0;
   
   wire                   psel1;
   wire [31:0]                   prdata1;
   wire                   pslverr1;

   wire                   psel_reg;
   wire [31:0]                   prdata_reg;
   wire                   pslverr_reg;

   wire [8*1-1:0]                  ch_int_all_proc0;
   
   //outputs of dma_ahb64 reg
   wire [1-1:0]                    int_all_proc;
   wire [3:0]                   core0_clkdiv;
   wire [7:0]                   core0_ch_start;
   wire                   joint_mode0;
   wire                   joint_remote0;
   wire                    rd_prio_top0;
   wire                    rd_prio_high0;
   wire [2:0]                   rd_prio_top_num0;
   wire [2:0]                   rd_prio_high_num0;
   wire                    wr_prio_top0;
   wire                    wr_prio_high0;
   wire [2:0]                   wr_prio_top_num0;
   wire [2:0]                   wr_prio_high_num0;
   wire [31:1]                   periph_rx_req_reg;
   wire [31:1]                   periph_tx_req_reg;
   
   wire [31:1]                   periph_rx_req0;
   wire [31:1]                   periph_tx_req0;
   wire [31:1]                   periph_rx_req1;
   wire [31:1]                   periph_tx_req1;
   wire [31:1]                   periph_rx_clr0;
   wire [31:1]                   periph_tx_clr0;
   wire [31:1]                   periph_rx_clr1;
   wire [31:1]                   periph_tx_clr1;

   wire                   core0_idle;



   assign                   idle = core0_idle;
   
   assign                   INT = int_all_proc;
   

   assign                   periph_rx_req0     = periph_rx_req | periph_rx_req_reg;
   assign                   periph_tx_req0     = periph_tx_req | periph_tx_req_reg;
   assign                   periph_rx_req1     = periph_rx_req0;
   assign                   periph_tx_req1     = periph_tx_req0;
   
   assign                   periph_rx_clr      = periph_rx_clr0 | periph_rx_clr1;
   assign                   periph_tx_clr      = periph_tx_clr0 | periph_tx_clr1;
   

   assign                   joint_remote0 = joint_mode0 & 0 & 0;
   
   
   dma_ahb64_apb_mux  dma_ahb64_apb_mux (
                   .clk(clk),
                   .reset(reset),
                   .pclken(pclken),
                   .psel(psel),
                   .penable(penable),
                   .pwrite(pwrite),
                   .paddr(paddr[12:11]),
                   .prdata(prdata),
                   .pslverr(pslverr),
                   .pready(pready),
                   .psel0(psel0),
                   .prdata0(prdata0),
                   .pslverr0(pslverr0),
                   .psel1(psel1),
                   .prdata1(prdata1),
                   .pslverr1(pslverr1),
                   .psel_reg(psel_reg),
                   .prdata_reg(prdata_reg),
                   .pslverr_reg(pslverr_reg)
                   );

   
   dma_ahb64_reg  dma_ahb64_reg (
               .clk(clk),
               .reset(reset),
               .pclken(pclken),
               .psel(psel_reg),
               .penable(penable),
               .paddr(paddr[7:0]),
               .pwrite(pwrite),
               .pwdata(pwdata),
               .prdata(prdata_reg),
               .pslverr(pslverr_reg),
               .core0_idle(core0_idle),
               .ch_int_all_proc0(ch_int_all_proc0),
               .int_all_proc(int_all_proc),
               .core0_clkdiv(core0_clkdiv),
               .core0_ch_start(core0_ch_start),
               .joint_mode0(joint_mode0),
               .rd_prio_top0(rd_prio_top0),
               .rd_prio_high0(rd_prio_high0),
               .rd_prio_top_num0(rd_prio_top_num0),
               .rd_prio_high_num0(rd_prio_high_num0),
               .wr_prio_top0(wr_prio_top0),
               .wr_prio_high0(wr_prio_high0),
               .wr_prio_top_num0(wr_prio_top_num0),
               .wr_prio_high_num0(wr_prio_high_num0),
               .periph_rx_req_reg(periph_rx_req_reg),
               .periph_tx_req_reg(periph_tx_req_reg),
               .periph_rx_clr(periph_rx_clr),
               .periph_tx_clr(periph_tx_clr)
               );
   
   

   dma_ahb64_core0_top
   dma_ahb64_core0_top (
      
             .clk(clk),
             .reset(reset),
             .scan_en(scan_en),
             
             .idle(core0_idle),
             .ch_int_all_proc(ch_int_all_proc0),
             .ch_start(core0_ch_start),
             .clkdiv(core0_clkdiv),
      
             .periph_tx_req(periph_tx_req0),
             .periph_tx_clr(periph_tx_clr0),
             .periph_rx_req(periph_rx_req0),
             .periph_rx_clr(periph_rx_clr0),
      
             .pclken(pclken),
             .psel(psel0),
             .penable(penable),
             .paddr(paddr[10:0]),
             .pwrite(pwrite),
             .pwdata(pwdata),
             .prdata(prdata0),
             .pslverr(pslverr0),
      
             .rd_port_num(rd_port_num0),
             .wr_port_num(wr_port_num0),

             .joint_mode(joint_mode0),
             .joint_remote(joint_remote0),
             .rd_prio_top(rd_prio_top0),
             .rd_prio_high(rd_prio_high0),
             .rd_prio_top_num(rd_prio_top_num0),
             .rd_prio_high_num(rd_prio_high_num0),
             .wr_prio_top(wr_prio_top0),
             .wr_prio_high(wr_prio_high0),
             .wr_prio_top_num(wr_prio_top_num0),
             .wr_prio_high_num(wr_prio_high_num0),
             
                     .WHADDR(M0_WHADDR), 
                     .WHBURST(M0_WHBURST), 
                     .WHSIZE(M0_WHSIZE), 
                     .WHTRANS(M0_WHTRANS), 
                     .WHWDATA(M0_WHWDATA), 
                     .WHREADY(M0_WHREADY), 
                     .WHRESP(M0_WHRESP), 
                     .RHADDR(M0_RHADDR), 
                     .RHBURST(M0_RHBURST), 
                     .RHSIZE(M0_RHSIZE), 
                     .RHTRANS(M0_RHTRANS), 
                     .RHRDATA(M0_RHRDATA), 
                     .RHREADY(M0_RHREADY), 
                     .RHRESP(M0_RHRESP), 
                     .WHLAST(M0_WHLAST), 
                     .WHOLD(M0_WHOLD), 
                     .RHLAST(M0_RHLAST), 
                     .RHOLD(M0_RHOLD) 
             );

   
   
 
   prgen_delay #(1) delay_pslverr1 (.clk(clk), .reset(reset), .din(psel1), .dout(pslverr1)); //return error
   assign                   prdata1          = {32{1'b0}};
   
   assign                   periph_rx_clr1   = {31{1'b0}};
   assign                   periph_tx_clr1   = {31{1'b0}};

   assign                   rd_port_num1     = 1'b0;
   assign                   wr_port_num1     = 1'b0;


endmodule



