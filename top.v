module Mux(
  input [3:0] CEO, You, Fred, Jill,
  input [1:0] Sel, 
  input Enable,
  output [3:0] Y1
);
 
  
 assign Y1 = Enable ? (Sel == 0 ? CEO : 
                       Sel == 1 ? You:
                       Sel == 2 ? Fred:
                       Sel == 3 ? Jill : 0) : 0;
endmodule

 
 module DeMux(
    input [3:0] Y,
    input[1:0] Sel, //(0-3 integer)
    input Enable,
    output [3:0] local_lib, Fire, School, Rib
);
    assign local_lib = (Sel == 0 ? Y : 0); 
    assign Fire = (Sel == 1 ? Y : 0); 
    assign School =(Sel == 2 ? Y : 0);
    assign  Rib = (Sel == 3 ? Y : 0);
    
endmodule
     
    
  module top(
    input [15:0] sw,
    input btnL, btnU, //multiplexer btnL[0] btnU[1]
          btnD, btnR, //de-mux btnD[0] btnR[1]
          btnC, //enable
    output [15:0] led
 );
    wire [3:0] mux_out;
    wire [1:0] multiplexer;
    wire[1:0] demux; 
    assign multiplexer = {btnU, btnL};
    assign demux = {btnR, btnD};
    
  Mux Mux_inst(
    .CEO(sw[3:0]),
    .You(sw[7:4]),
    .Fred(sw[11:8]),
    .Jill(sw[15:12]),
    .Sel(multiplexer),
    .Enable(btnC),
    .Y1(mux_out)
    );
    
 DeMux DeMux_inst(
    .Sel(demux),
    .Enable(btnC),
    .Y(mux_out),
    .local_lib(led[3:0]),
    .Fire(led[7:4]),
    .School(led[11:8]),
    .Rib(led[15:12])
    );
    
    
    
    
    
    
endmodule
    
