`timescale 1ns / 1ps
module stated_ff(A, B, C, D, ck, A_nextoutput, B_nextoutput, C_nextoutput, D_nextoutput);
    input A, B, C, D, ck;
    output A_nextoutput, B_nextoutput, C_nextoutput, D_nextoutput;
    
    DFF a(A, ck, A_nextoutput);
    DFF b(B, ck, B_nextoutput);
    DFF c(C, ck, C_nextoutput);
    DFF d(D, ck, D_nextoutput);
endmodule
