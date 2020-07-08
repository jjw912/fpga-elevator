`timescale 1ns / 1ps

module Top123(A, B, C, D, R1, R2, R3, R4, R5, Target1, Target2, Target3, Target4, Target5,
           clk, u1, u2, u3, u4, d2, d3, d4, d5, Floor1, Floor2, Floor3, Floor4, Floor5, Up, Down, Stop, RESET, Door3, nfloor11, nfloor21, nfloor31, nfloor41, nfloor51, aupdate, bupdate, cupdate, dupdate);
    input clk, u1, u2, u3, u4, d2, d3, d4, d5, Floor1, Floor2, Floor3, Floor4, Floor5, A, B, C, D, R1, R2, R3, R4, R5, Target1, Target2, Target3, Target4, Target5;
    output Up, Down, Stop, Door3;
    output nfloor11; output nfloor21; output nfloor31; output nfloor41; output nfloor51;
    output aupdate; output bupdate; output cupdate; output dupdate;
    output RESET;
    wire Aplus, Bplus, Cplus, Dplus;
    wire N1, N2, N3, N4, N5;
    wire treset;
    Ninput a (clk, u1, u2, u3, u4, d2, d3, d4, d5, Target1, Target2, Target3, Target4, Target5, R1, R2, R3, R4, R5, N1, N2, N3, N4, N5);
    NextState b (N1, N2, N3, N4, N5, Floor1, Floor2, Floor3, Floor4, Floor5, A, B, C, D, Aplus, Bplus, Cplus, Dplus);
   
   
    wire Aplusnext, Bplusnext, Cplusnext, Dplusnext;
    //stated_ff c(Aplus, Bplus, Cplus, Dplus, clk, Aplusnext, Bplusnext, Cplusnext, Dplusnext);
    Updownstop d(N1, N2, N3, N4, N5, Floor1, Floor2, Floor3, Floor4, Floor5, A, B, C, D, Aplus, Bplus, Cplus, Dplus, Up, Down, Stop);
    Door e(N1, N2, N3, N4, N5, Floor1, Floor2, Floor3, Floor4, Floor5, A, B, C, D, Aplus, Bplus, Cplus, Dplus, Door3, treset);
    assign aupdate = Aplus;
    assign bupdate = Bplus;
    assign cupdate = Cplus;
    assign dupdate = Dplus;
    assign RESET = treset;  
    wire nfloor1, nfloor2, nfloor3, nfloor4, nfloor5;
    Floor f(Aplus, Bplus, Cplus, Dplus, nfloor1, nfloor2, nfloor3, nfloor4, nfloor5);
    assign nfloor11 = nfloor1;
    assign nfloor21 = nfloor2;
    assign nfloor31 = nfloor3;
    assign nfloor41 = nfloor4;
    assign nfloor51 = nfloor5;

    wire noa, nob, noc, nod;
    stated_ff X(Aplus, Bplus, Cplus, Dplus, clk, noa, nob, noc, nod);
endmodule