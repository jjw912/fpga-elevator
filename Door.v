`timescale 1ns / 1ps
module Door(N1, N2, N3, N4, N5, Floor1, Floor2, Floor3, Floor4, Floor5, A, B, C, D, Aplus, Bplus, Cplus, Dplus, door, reset);
    input N1, N2, N3, N4, N5, Floor1, Floor2, Floor3, Floor4, Floor5, Aplus, Bplus, Cplus, Dplus, A, B, C, D;
    output door, reset;
    
    wire temp;
//    wire stop1, stop2;
//    assign stop1 = (~A & ~C) | (~A & ~B & D);
//    assign stop2 = (~Aplus & ~Cplus) | (~Aplus & ~Bplus & Dplus);
//    and (temp, stop1, stop2);
    
    assign temp = (~N1 & ~N2 & ~N3 & ~N4 & N5 & ~Floor1 & ~Floor2 & ~Floor3 & ~Floor4 & Floor5 & ~Aplus & Bplus & ~Cplus & Dplus) | (~N1 & ~N2 & ~N3 & N4 & ~N5 & ~Floor1 & ~Floor2 & ~Floor3 & Floor4 & ~Floor5 & ~Aplus & Bplus & ~Cplus & ~Dplus) | (~N1 & ~N2 & N3 & ~N4 & ~N5 & ~Floor1 & ~Floor2 & Floor3 & ~Floor4 & ~Floor5 & ~Aplus & ~Bplus & Cplus & Dplus) | (~N1 & N2 & ~N3 & ~N4 & ~N5 & ~Floor1 & Floor2 & ~Floor3 & ~Floor4 & ~Floor5 & ~Aplus & ~Bplus & ~Cplus & Dplus) | (N1 & ~N2 & ~N3 & ~N4 & ~N5 & Floor1 & ~Floor2 & ~Floor3 & ~Floor4 & ~Floor5 & ~Aplus & ~Bplus & ~Cplus & ~Dplus);
    
    not(door, temp);
    assign reset = temp;
endmodule
