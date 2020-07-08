`timescale 1ns / 1ps
module m21(D0, D1, S, Y); // if s is true then d1 else d0
output Y;
input D0, D1, S;
/*assign Y=(S)?D1:D0;*/
assign Y = (D0 & ~S) | (D1 & S);
endmodule

module Ninput(ck, u1, u2, u3, u4, d2, d3, d4, d5, Floor1, Floor2, Floor3, Floor4, Floor5,
              R1, R2, R3, R4, R5, N1, N2, N3, N4, N5);
    input ck;
    input u1, u2, u3, u4, d2, d3, d4, d5, Floor1, Floor2, Floor3, Floor4, Floor5;
    input R1, R2, R3, R4, R5;
    output N1, N2, N3, N4, N5;
   
    wire t1, t2, t3, t4, t5, d1, d2, d3, d4, d5, nR1, nR2, nR3, nR4, nR5;
    or (t1, u1, Floor1);
    or (t2, u2, d2, Floor2);
    or (t3, u3, d3, Floor3);
    or (t4, u4, d4, Floor4);
    or (t5, d5, Floor5);
   
    not (nR1, R1);
    not (nR2, R2);
    not (nR3, R3);
    not (nR4, R4);
    not (nR5, R5);
   
    wire w1, w2, w3, w4, w5;
    and (w1, t1, nR1);
    and (w2, t2, nR2);
    and (w3, t3, nR3);
    and (w4, t4, nR4);
    and (w5, t5, nR5);
   
    m21 X(w1, 1'b0, R1, N1);
    m21 Y(w2, 1'b0, R2, N2);
    m21 Z(w3, 1'b0, R3, N3);
    m21 W(w4, 1'b0, R4, N4);
    m21 Q(w5, 1'b0, R5, N5);
endmodule