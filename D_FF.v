`timescale 1ns / 1ps

module DFF (input D, input ck, output reg Q);
    always @ (negedge ck)
    begin
      Q <= D;
    end
endmodule