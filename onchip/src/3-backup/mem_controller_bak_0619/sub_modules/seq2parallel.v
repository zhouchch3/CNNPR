//reused for activations and weights

module seq2parallel #(
  parameter IN_WIDTH = `DATA_WIDTH * `IF_WIDTH,
  parameter OUT_WIDTH= `DATA_WIDTH * `IF_WIDTH * `KERNEL_WIDTH,
  parameter NUM      = OUT_WIDTH / IN_WIDTH
)
(
    input                         clk,
    input                         reset,
    input                         mode,
    input [ IN_WIDTH    - 1 : 0 ] in_serial,
    input                         begin_serial_in,
    input                         refresh_parallel_array,
    output reg [ OUT_WIDTH   - 1 : 0 ] parallel_array
    );
  wire    condition_serial_in;
  reg [`C_LOG_2(NUM)    - 1 : 0 ] n;
  reg [ OUT_WIDTH  - 1 : 0 ] parallel_array_reg;

  assign condition_serial_in = begin_serial_in || (n>0 && n<NUM);

  always @(posedge clk) begin : proc_n
    if(reset) begin
      n <= 0;
    end else if( condition_serial_in ) begin
      n <= n + 1;
    end else
      n <= 0;
  end
  always @(posedge clk ) begin
    if(reset) begin
      parallel_array_reg <= 0;
    end else if( condition_serial_in ) begin // mode1 begin or the first reuse. cache in; delay 2 clk state_parallel=read
      parallel_array_reg <= {in_serial, parallel_array_reg [ OUT_WIDTH  - 1 : IN_WIDTH ]};// --->>
    end
  end
 
 always @(posedge clk ) begin : proc_parallel_array
   if(reset) begin
     parallel_array <= 0;
   end else if ( refresh_parallel_array ) // begin stream or every row done refresh
     parallel_array <= parallel_array_reg; // 
 end

endmodule // 