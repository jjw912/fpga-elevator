`timescale 1ns / 1ps

module Floor(A, B, C, D, Floor1, Floor2, Floor3, Floor4, Floor5);
    input A, B, C, D;
    output Floor1, Floor2, Floor3, Floor4, Floor5;
    
    assign Floor1 = (~A & ~B & ~D) | (~A & C & ~D);
    assign Floor2 = (~A & ~B & ~C & D) | (B & C & D) | (~B & C & ~D);
    assign Floor3 = (A & ~B & ~C & ~D) | (~B & C & D);
    assign Floor4 = (B & ~C & ~D) | (A & ~B & ~C & D);
    assign Floor5 = (B & ~C & D);
endmodule
