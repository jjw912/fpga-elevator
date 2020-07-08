`timescale 1ns / 1ps
module Top_tb(input clk, u1, u2, u3, u4, d2, d3, d4, d5, target1, target2, target3, target4, target5,
                /*output reg [0:7] led,*/ output reg [3:0] ssSel, output reg[0:7] ssDisp);
    reg  a, b, c, d, r1, r2, r3, r4, r5, floor1, floor2, floor3, floor4, floor5;
    integer counter = 0;
    reg Sclk;
    initial begin
    a = 1'b0; 
    b = 1'b0; 
    c = 1'b0; 
    d = 1'b0;
    r1 = 1'b0;
    r2 = 1'b0;
    r3 = 1'b0;
    r4 = 1'b0;
    r5 = 1'b0;
    floor1 = 1'b1;
    floor2 = 1'b0;
    floor3 = 1'b0;
    floor4 = 1'b0;
    floor5 = 1'b0;
    end
    wire up /*= 1'b0*/;
    wire down /*= 1'b0*/;
    wire stop /*= 1'b1*/;
    wire reset;
    wire door3;
    wire tempf1, tempf2, tempf3, tempf4, tempf5, tempa, tempb, tempc, tempd;
    Top123  k(.A(a), .B(b), .C(c), .D(d), .R1(r1), .R2(r2), .R3(r3), .R4(r4), .R5(r5), .Target1(target1), .Target2(target2), .Target3(target3), .Target4(target4), .Target5(target5),
        .clk(Sclk), .u1(u1), .u2(u2), .u3(u3), .u4(u4), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .Floor1(floor1), .Floor2(floor2), .Floor3(floor3), .Floor4(floor4), .Floor5(floor5), .Up(up), .Down(down),
        .Stop(stop), .RESET(reset), .Door3(door3), .nfloor11(tempf1), .nfloor21(tempf2), .nfloor31(tempf3), .nfloor41(tempf4), .nfloor51(tempf5),
        .aupdate(tempa), .bupdate(tempb), .cupdate(tempc), .dupdate(tempd));
//    always @(posedge clk)
//    begin
//     assign a = tempa;
//     assign b = tempb;
//     assign c = tempc;
//     assign d = tempd;
//     assign floor1 = tempf1;
//     assign floor2 = tempf2;
//     assign floor3 = tempf3;
//     assign floor4 = tempf4;
//     assign floor5 = tempf5;
//     assign r1 = reset;
//     assign r2 = reset;
//     assign r3 = reset;
//     assign r4 = reset;
//     assign r5 = reset;
//    end
    parameter ssC = 8'b01100011;
    parameter ssL = 8'b11100011;
    parameter ssO = 8'b00000011;
    parameter ssP = 8'b00110001;
    parameter ssF = 8'b01110001;
    parameter ss1 = 8'b10011111;
    parameter ss2 = 8'b00100101;
    parameter ss3 = 8'b00001101;
    parameter ss4 = 8'b10011001;
    parameter ss5 = 8'b01001001;
    parameter ss_ = 8'b11111111;
    
    parameter flickerClk = 200000;
    parameter sec_clk=100000000;
    reg [3:0] ssDispState;
    reg [0:7] ssDispBuf0;
    reg [0:7] ssDispBuf1;
    reg [0:7] ssDispBuf2;
    reg [0:7] ssDispBuf3;
    integer flicker_counter;
    integer sec_counter;
    initial begin
    ssSel = 4'b1110;
    ssDisp = ss5; /*debug */
    ssDispState = 4'b0000;
//    ssDispBuf[3] = ssF; ssDispBuf[2] = ssP; ssDispBuf[1] = 11111111; ssDispBuf[0] = ss1;
    flicker_counter = 0;
    sec_counter = 0;
    end
    
    always @(posedge clk) begin
        if (sec_counter % sec_clk ==0) begin
            Sclk<=1;
        end
        else begin Sclk<=0;
        end
        
    end
    
    always @(posedge clk) begin
        if (sec_counter==100000001) begin sec_counter<=1;end
        else begin sec_counter<=sec_counter+1;end
    end
    
    
    
    
    reg [3:0] state;
    reg [4:0] floor;
    always @(posedge clk)begin
        state<={up,down, stop, door3};
        floor<={floor1,floor2,floor3, floor4,floor5};
        if (floor == 5'b10000 && state == 4'b1000)
        begin
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss1;
        end
        else if (floor == 5'b10000 && state == 4'b1001)
        begin
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss1;
        end
        else if (floor == 5'b01000 && state == 4'b1000)
        begin
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_ ;
        ssDispBuf0 <= ss2;
        end
        else if (floor == 5'b01000 && state == 4'b1001)
        begin
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_ ;
        ssDispBuf0 <= ss2;
        end
        else if (floor == 5'b00100 && state == 4'b1000)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss3;
        end
        else if (floor == 5'b00100 && state == 4'b1001)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss3;
        end
        else if (floor == 5'b00010 && state == 4'b1000)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss4;
        end
        else if (floor == 5'b00010 && state == 4'b1001)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss4;
        end
        else if (floor == 5'b00001 && state == 4'b1000)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss5;
        end
        else if (floor == 5'b00001 && state == 4'b1001)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss5;
        end
        else if (floor == 5'b10000 && state == 4'b0100)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss1;
        end
        else if (floor == 5'b10000 && state == 4'b0101)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss1;
        end
        else if (floor == 5'b01000 && state == 4'b0100)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss2;
        end
        else if (floor == 5'b01000 && state == 4'b0101)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss2;
        end
        else if (floor == 5'b00100 && state == 4'b0100)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss3;
        end
        else if (floor == 5'b00100 && state == 4'b0101)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss3;
        end
        else if (floor == 5'b00010 && state == 4'b0100)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss4;
        end
        else if (floor == 5'b00010 && state == 4'b0101)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss4;
        end
        else if (floor == 5'b00001 && state == 4'b0100)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss5;
        end
        else if (floor == 5'b00001 && state == 4'b0101)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss5;
        end
        else if (floor == 5'b10000 && state == 4'b0010)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss1;
        end
        else if (floor == 5'b10000 && state == 4'b0011)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss1;
        end
        else if (floor == 5'b01000 && state == 4'b0010)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss2;
        end
        else if (floor == 5'b01000 && state == 4'b0011)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss2;
        end
        else if (floor == 5'b00100 && state == 4'b0010)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss3;
        end
        else if (floor == 5'b00100 && state == 4'b0011)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss3;
        end
        else if (floor == 5'b00010 && state == 4'b0010)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss4;
        end
        else if (floor == 5'b00010 && state == 4'b0011)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss4;
        end
        else if (floor == 5'b00001 && state == 4'b0010)
        begin 
        ssDispBuf3 <= ssO;
        ssDispBuf2 <= ssP;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss5;
        end
        else if (floor == 5'b00001 && state == 4'b0011)
        begin 
        ssDispBuf3 <= ssC;
        ssDispBuf2 <= ssL;
        ssDispBuf1 <= ss_;
        ssDispBuf0 <= ss5;
        end
       
        if(flicker_counter % flickerClk == 0) begin
            case(ssSel)
                4'b1110 : begin ssSel <= 4'b1101; ssDisp <= ssDispBuf1;end
                4'b1101 : begin ssSel <= 4'b1011; ssDisp <= ssDispBuf2;end
                4'b1011 : begin ssSel <= 4'b0111; ssDisp <= ssDispBuf3;end
                4'b0111 : begin ssSel <= 4'b1110; ssDisp <= ssDispBuf0;end
            endcase
        end
    end
     always @(posedge clk) begin
        if(flicker_counter == 800000) begin flicker_counter <= 0; end
        else begin flicker_counter <= flicker_counter + 1; end
    end
   
    /*always @(posedge clk)begin
        state<={up,down, stop};
        floor<={floor1,floor2,floor3, floor4,floor5};
        case(state)
            3'b100 : begin ssDispBuf[3]<=ssO; ssDispBuf[2]<=ssP; end
            3'b010 : begin ssDispBuf[3]<=ssC; ssDispBuf[2]<=ssL; end
            3'b001 : begin ssDispBuf[3]<=ss5; ssDispBuf[2]<=ss5; end
            default : begin ssDispBuf[3] <= ssC; ssDispBuf[2] <= ssL; end
        endcase
        case (floor)
            5'b10000 : begin ssDispBuf[0]<=ss1; end
            5'b01000 : begin ssDispBuf[0]<=ss2; end
            5'b00100 : begin ssDispBuf[0]<=ss3; end
            5'b00010 : begin ssDispBuf[0]<=ss4; end
            5'b00001 : begin ssDispBuf[0]<=ss5; end
        endcase
        if(flicker_counter % flickerClk == 0) begin
            case(ssSel)
                4'b1110 : begin ssSel <= 4'b1101; ssDisp <= ssDispBuf[1]; end
                4'b1101 : begin ssSel <= 4'b1011; ssDisp <= ssDispBuf[2]; end
                4'b1011 : begin ssSel <= 4'b0111; ssDisp <= ssDispBuf[3]; end
                4'b0111 : begin ssSel <= 4'b1110; ssDisp <= ssDispBuf[0]; end
            endcase
        end
        case (floor)
            5'b10000 : begin ssDisp<=ss1; end
            5'b01000 : begin ssDisp<=ss2; end
            5'b00100 : begin ssDisp<=ss3; end
            5'b00010 : begin ssDisp<=ss4; end
            5'b00001 : begin ssDisp<=ss5; end
        endcase
        if(flicker_counter % flickerClk == 0) begin
            case(ssSel)
                4'b1110 : begin ssSel <= 4'b1101; end
                4'b1101 : begin ssSel <= 4'b1011; end
                4'b1011 : begin ssSel <= 4'b0111; end
                4'b0111 : begin ssSel <= 4'b1110; end
            endcase
        end
    end
    always @(posedge clk) begin
        if(flicker_counter == 800000) begin flicker_counter <= 0; end
        else begin flicker_counter <= flicker_counter + 1; end
    end*/
    
    
    always @(posedge Sclk)
    begin
     a <= tempa;
     b <= tempb;
     c <= tempc;
     d <= tempd;
     floor1 <= tempf1;
     floor2 <= tempf2;
     floor3 <= tempf3;
     floor4 <= tempf4;
     floor5 <= tempf5;
     r1 <= reset;
     r2 <= reset;
     r3 <= reset;
     r4 <= reset;
     r5 <= reset;
     #0.2
     r1 <= reset;
     r2 <= reset;
     r3 <= reset;
     r4 <= reset;
     r5 <= reset;
    end
endmodule