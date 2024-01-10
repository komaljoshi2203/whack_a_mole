`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Module Name: Whack_a_Mole
// Name: Komal Joshi
//Roll No.: 21PHC1R16
//////////////////////////////////////////////////////////////////////////////////


module Whack_a_Mole(   //Top Module
    input clk,
	input [15:0] sw,//switches to whack a mole
	input reset, //to reset the game
	output [15:0] led, //leds as mole
	output [3:0] an, 
	output [6:0] seg); //to display timer (2 left most segments) and mole count (2 right most segments)
	
	
	wire clk_out;
	wire timer_clk_out;
	wire [3:0] mux_out;
	wire [1:0] counter_out;
	wire [3:0] timer_count_ones, timer_count_tens, score_ones, score_tens;
	wire [6:0] score_count; //Max score of 32
	wire [4:0] timer_count; //Game Timer runs for 20 seconds

	
	binarytobcd UBCD(timer_count, score_count, timer_count_ones, timer_count_tens, score_ones, score_tens); 
	
	mux4to1 UMUX(score_ones, score_tens, timer_count_ones, timer_count_tens, counter_out, mux_out); 
	
	slowclock USCK(clk, clk_out); //slow clock for seven segment
	
	twobitcounter U2BC(clk_out, counter_out); //counter for toggling 4 segments on board and displaying game timer and score count
	
	decoder2to4 UD(counter_out, an); //cycles through 4 segments on Basys 3
	
	bcd7seg UBCDSEG(mux_out, seg); //Converts bcd to seven segment
	
    timerClock UTCK(clk, timer_clk_out);
	
	timerCount UTC(clk, reset, timer_count);
	
	//game u9(clk, sw, reset, LED, score_count);//make a game file here
	game UGM(clk, sw, reset, led, score_count);//make a game file here
	
endmodule
