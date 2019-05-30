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
//-- Invoked Fri Mar 25 23:32:59 2011
//--
//-- Source file: dma_core_wdt.v
//---------------------------------------------------------


  
module dma_ahb64_core0_wdt(clk,reset,ch_active,rd_burst_start,rd_ch_num,wr_burst_start,wr_ch_num,wdt_timeout,wdt_ch_num);
   
   
   input               clk;
   input               reset;

   input [7:0]               ch_active;
   input               rd_burst_start;
   input [2:0]               rd_ch_num;
   input               wr_burst_start;
   input [2:0]               wr_ch_num;
   
   output               wdt_timeout;
   output [2:0]           wdt_ch_num;



   reg [`WDT_BITS-1:0]           counter;
   reg [2:0]               wdt_ch_num;
   wire               current_ch_active;
   wire               current_burst_start;
   wire               advance;
   wire               idle;



   assign               idle = ch_active == 8'd0;
   
   assign               current_ch_active = ch_active[wdt_ch_num];

   assign               current_burst_start =
                  (rd_burst_start & (rd_ch_num == wdt_ch_num)) |
                (wr_burst_start & (wr_ch_num == wdt_ch_num));

   assign               advance = (!current_ch_active) | current_burst_start | wdt_timeout;
   

   always @(posedge clk or posedge reset)
     if (reset)
       wdt_ch_num <= #1 3'd0;
     else if (advance)
       wdt_ch_num <= #1 wdt_ch_num + 1'b1;

   

   
   assign               wdt_timeout = (counter == 'd0);

   
   always @(posedge clk or posedge reset)
     if (reset)
       counter <= #1 {`WDT_BITS{1'b1}};
     else if (advance | idle)
       counter <= #1 {`WDT_BITS{1'b1}};
     else
       counter <= #1 counter - 1'b1;

   
endmodule


   
              


