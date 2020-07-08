`timescale 1ns / 1ps
module Updownstop(N1, N2, N3, N4, N5, Floor1, Floor2, Floor3, Floor4, Floor5, A, B, C, D, Aplus, Bplus, Cplus, Dplus, Up, Down, Stop);
    input N1, N2, N3, N4, N5, Floor1, Floor2, Floor3, Floor4, Floor5, Aplus, Bplus, Cplus, Dplus, A, B, C, D;
    output Up, Down, Stop;
    
    /*assign Stop =  (~N1 & ~N2 & ~N3 & ~N4 & N5 & ~Floor1 & ~Floor2 & ~Floor3 & ~Floor4 & Floor5 & ~Aplus & Bplus & ~Cplus & Dplus) | (~N1 & ~N2 & ~N3 & N4 & ~N5 & ~Floor1 & ~Floor2 & ~Floor3 & Floor4 & ~Floor5 & ~Aplus & Bplus & ~Cplus & ~Dplus) | (~N1 & ~N2 & N3 & ~N4 & ~N5 & ~Floor1 & ~Floor2 & Floor3 & ~Floor4 & ~Floor5 & ~Aplus & ~Bplus & Cplus & Dplus) | (~N1 & N2 & ~N3 & ~N4 & ~N5 & ~Floor1 & Floor2 & ~Floor3 & ~Floor4 & ~Floor5 & ~Aplus & ~Bplus & ~Cplus & Dplus) | (N1 & ~N2 & ~N3 & ~N4 & ~N5 & Floor1 & ~Floor2 & ~Floor3 & ~Floor4 & ~Floor5 & ~Aplus & ~Bplus & ~Cplus & ~Dplus);
    */
    wire stop1, stop2;
    assign stop1 = (~A & ~C) | (~A & ~B & D);
    assign stop2 = (~Aplus & ~Cplus) | (~Aplus & ~Bplus & Dplus);
    and (Stop, stop1, stop2);
    
    wire up1, up2;
    assign up1 = (~A & B & C) | (A & ~B & ~C);
    assign up2 = (~Aplus & Bplus & Cplus) | (Aplus & ~Bplus & ~Cplus);
    or (Up, up1, up2);
    
    wire down1, down2;
    assign down1 = (A & ~B & C) | (A & B & ~C);
    assign down2 = (Aplus & ~Bplus & Cplus) | (Aplus & Bplus & ~Cplus);
    or (Down, down1, down2);
endmodule