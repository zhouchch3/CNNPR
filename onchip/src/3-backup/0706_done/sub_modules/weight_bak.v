`include "def_params.vh" 
module weight
(
    input                                clk,
    input                                reset,
    input                                mode,
    input                                start,
    input [ 2 : 0 ]                      state,
    input                                row_cal_done,
    input                                wr_req_wei_flag,
    input [ `KERNEL_SIZE       - 1 : 0 ] wr_data_wei_flag,
    input                                wr_req_wei,
    input [ `DATA_WIDTH        - 1 : 0 ] wr_data_wei,
    output[ `WEI_INDEX_WIDTH   - 1 : 0 ] wei_index,
    output[ `WEI_INDEX_WIDTH   - 1 : 0 ] wei_row_index,
    output[ `WEI_INDEX_WIDTH   - 1 : 0 ] row_val_num_wei_real,
    output[ `DATA_WIDTH        - 1 : 0 ] wei_serial_out,
    output[ `DATA_WIDTH * `KERNEL_SIZE - 1 : 0 ] wei_parallel_out,
    output reg                              en
    );

  wire rd_req_wei_flag;
  wire refresh_seq;
  wire [ `ACT_INDEX_WIDTH   - 1 : 0 ] i;
  wire [ `KERNEL_SIZE          - 1 : 0 ] rd_data_wei_flag;
  wire [ `KERNEL_SIZE          - 1 : 0 ] rd_data_wei_flag_dd;
  wire [ `DATA_WIDTH        - 1 : 0 ] rd_data_wei;
  wire [ `DATA_WIDTH * `KERNEL_SIZE - 1 : 0 ] wei_array_full;
  wire [ `DATA_WIDTH * `KERNEL_WIDTH - 1 : 0 ]wei_array;
  wire [ `WEI_INDEX_WIDTH * `KERNEL_SIZE - 1 : 0 ] wei_index_array_full;
//  wire [ `WEI_INDEX_WIDTH   - 1 : 0 ] wei_row_index;
  wire [ `WEI_INDEX_WIDTH   - 1 : 0 ] wei_col_index;
  wire [ `WEI_INDEX_WIDTH * `KERNEL_WIDTH - 1 : 0 ] valid_num_index_array;
  wire [ `WEI_INDEX_WIDTH * `KERNEL_WIDTH - 1 : 0 ] wei_index_array;

  assign rd_req_wei_flag = start;
  wire rd_req_wei_flag_d;
  wire rd_req_wei_flag_dd;

  assign refresh_seq = rd_req_wei_flag_d;

ram #(
    .DATA_WIDTH               ( `KERNEL_SIZE              ),
    .ADDR_WIDTH               ( `ACT_INDEX_WIDTH                    )
  ) ram_wei_flag (
    .clk                      ( clk                     ),  //input
    .reset                    ( reset                   ),  //input
    .wr_req                   ( wr_req_wei_flag         ),  //input
    .wr_data                  ( wr_data_wei_flag        ),  //input

    .rd_req                   ( rd_req_wei_flag         ),  //input
    .rd_data                  ( rd_data_wei_flag        )  //output
  );
column_parallel #(
    .DATA_WIDTH               ( `DATA_WIDTH      ),
    .ADDR_WIDTH               ( `ADDR_WIDTH      )
  ) column_parallel_wei (
    .clk                      ( clk             ),  //input
    .reset                    ( reset           ),  //input
    .mode                     ( mode            ),
    .wr_req_p                 ( wr_req_wei       ),  //input
    .wr_data_p                ( wr_data_wei      ),  //input
    .rd_en                    ( rd_data_wei_flag[i]             ),
    .rd_req_p                   ( rd_data_wei_flag[i]    ),  //input
    .rd_data_p                  ( rd_data_wei    )  //output
  );
loop_count 
loop_count_i(
  .clk           (clk),
  .reset         (reset),
  .reset2        ( 1'b0 ),
  .count_condition(refresh_seq || i != 0 ),//stop count
  .max           ( 4'd9 ),
  .stride        ( 4'd1),
  .count         (i)
  );
always @(posedge clk or negedge reset) begin : proc_en
  if(~reset) begin
    en <= 0;
  end else begin
    en <= i ==  9;
  end
end

seq2parallel #(
  .IN_WIDTH ( `DATA_WIDTH ),
  .OUT_WIDTH( `DATA_WIDTH * `KERNEL_SIZE )
  )
seq2parallel_wei_array_full(
  .clk(clk),
  .reset(reset),
  .mode(mode),
  .in_serial(rd_data_wei),
  .begin_serial_in( rd_req_wei_flag_dd ),
  .refresh_parallel_array( en ), // one refresh
  .parallel_array( wei_array_full )
  );
/////////////////////////// wei_index_array_full////////////////////////////////////////////////////////////
wire [ `WEI_INDEX_WIDTH * `KERNEL_WIDTH   - 1 : 0 ]  wei_index_array0, wei_index_array1, wei_index_array2;
wire [ `WEI_INDEX_WIDTH                   - 1 : 0 ] valid_wei_index0, valid_wei_index1, valid_wei_index2;
seq2index #(
  .DATA_WIDTH ( `KERNEL_WIDTH ),
  .INDEX_WIDTH( `WEI_INDEX_WIDTH )
    )
seq2index_valid_wei_index0(
    .clk(clk),
    .reset(reset),
    .refresh_seq( mode &&  rd_req_wei_flag_d),
    .seq        ({rd_data_wei_flag[6], rd_data_wei_flag[7], rd_data_wei_flag[8]}),
    .index      (valid_wei_index0)
    );
seq2parallel #(
  .IN_WIDTH ( `WEI_INDEX_WIDTH ),
  .OUT_WIDTH( `WEI_INDEX_WIDTH * `KERNEL_WIDTH )
  )
seq2parallel_wei_index_array0(
  .clk(clk),
  .reset(reset),
  .mode(mode),
  .in_serial(valid_wei_index0),
  .begin_serial_in( mode && rd_req_wei_flag_dd ),
  .refresh_parallel_array( en ), // one refresh
  .parallel_array( wei_index_array0 )
  );
//---------------------------------------------------------------
seq2index #(
  .DATA_WIDTH ( `KERNEL_WIDTH ),
  .INDEX_WIDTH( `WEI_INDEX_WIDTH )
    )
seq2index_valid_wei_index1(
    .clk(clk),
    .reset(reset),
    .refresh_seq( mode &&  rd_req_wei_flag_d),
    .seq        ({rd_data_wei_flag[3], rd_data_wei_flag[4], rd_data_wei_flag[5]}),
    .index      (valid_wei_index1)
    );
seq2parallel #(
  .IN_WIDTH ( `WEI_INDEX_WIDTH ),
  .OUT_WIDTH( `WEI_INDEX_WIDTH * `KERNEL_WIDTH )
  )
seq2parallel_wei_index_array1(
  .clk(clk),
  .reset(reset),
  .mode(mode),
  .in_serial(valid_wei_index1),
  .begin_serial_in( mode && rd_req_wei_flag_dd ),
  .refresh_parallel_array( en ), // one refresh
  .parallel_array( wei_index_array1 )
  );
  //----------------------------------------------------------------------
  seq2index #(
  .DATA_WIDTH ( `KERNEL_WIDTH ),
  .INDEX_WIDTH( `WEI_INDEX_WIDTH )
    )
seq2index_valid_wei_index2(
    .clk(clk),
    .reset(reset),
    .refresh_seq( mode && rd_req_wei_flag_d),
    .seq        ({rd_data_wei_flag[0], rd_data_wei_flag[1], rd_data_wei_flag[2]}),
    .index      (valid_wei_index2)
    );
seq2parallel #(
  .IN_WIDTH ( `WEI_INDEX_WIDTH ),
  .OUT_WIDTH( `WEI_INDEX_WIDTH * `KERNEL_WIDTH )
  )
seq2parallel_wei_index_array2(
  .clk(clk),
  .reset(reset),
  .mode(mode),
  .in_serial(valid_wei_index2),
  .begin_serial_in( mode && rd_req_wei_flag_dd  ),
  .refresh_parallel_array( en ), // one refresh
  .parallel_array( wei_index_array2 )
  );

 assign wei_index_array_full = { wei_index_array2, wei_index_array1, wei_index_array0 };

loop_count#(
  .DATA_WIDTH ( `WEI_INDEX_WIDTH )
  )
loop_count_wei_row_index(
  .clk           (clk),
  .reset         (reset),
  .reset2        ( !mode ),
  .count_condition( row_cal_done ),//0 1 2 
  .max           ( 2'd2 ),
  .stride        ( 2'd1 ),
  .count         ( wei_row_index )
  );
wire [ `WEI_INDEX_WIDTH     - 1 : 0 ] valid_num0, valid_num1, valid_num2;
assign valid_num0 = rd_data_wei_flag[8] + rd_data_wei_flag[7] + rd_data_wei_flag[6];
assign valid_num1 = rd_data_wei_flag[5] + rd_data_wei_flag[4] + rd_data_wei_flag[3];
assign valid_num2 = rd_data_wei_flag[2] + rd_data_wei_flag[1] + rd_data_wei_flag[0];

assign valid_num_index_array = { valid_num2, valid_num1, valid_num0 };

assign row_val_num_wei_real = valid_num_index_array[ wei_row_index *2 +:2];
assign wei_index_array = wei_index_array_full[6*wei_row_index +:6];
assign wei_array       = wei_array_full [ `DATA_WIDTH*`KERNEL_WIDTH * wei_row_index +: `DATA_WIDTH*`KERNEL_WIDTH ];
loop_count#(
  .DATA_WIDTH( `WEI_INDEX_WIDTH )
  )
loop_count_wei_col_index(
  .clk            (clk),
  .reset          ( reset ),
  .reset2         (en || row_cal_done || !mode),
  .count_condition( state != `PREP ),
  .max            ( row_val_num_wei_real - 1 ), //
  .stride         ( 2'd1 ),
  .count          ( wei_col_index )
  );
  wire [ `WEI_INDEX_WIDTH   - 1 : 0 ] wei_index_d;

assign wei_index = mode? wei_index_array[ wei_col_index *2 +:2] : 2'bz;
assign wei_serial_out = wei_array[ `DATA_WIDTH *wei_index_d +: `DATA_WIDTH];

assign wei_parallel_out = wei_array_full;

  delay #(
    .DATA_WIDTH( 1 )
    )
  delay_rd_req_wei_flag_d(
    .clk(clk),
    .reset(reset),
    .delay_in(rd_req_wei_flag),
    .delay_num_clk( 2'd1 ),
    .delay_out(rd_req_wei_flag_d)
    ); 
  delay #(
    .DATA_WIDTH( 1 )
    )
  delay_rd_req_wei_flag_dd(
    .clk(clk),
    .reset(reset),
    .delay_in(rd_req_wei_flag),
    .delay_num_clk( 2'd2 ),
    .delay_out(rd_req_wei_flag_dd)
    );
  delay #(
    .DATA_WIDTH( `WEI_INDEX_WIDTH )
    )
  delay_wei_index_d(
    .clk(clk),
    .reset(reset),
    .delay_in(wei_index),
    .delay_num_clk( 2'd1 ),
    .delay_out(wei_index_d)
    );

endmodule // weight
