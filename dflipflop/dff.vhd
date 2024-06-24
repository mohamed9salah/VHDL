LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dflipflop IS 
port (
clk, d : IN STD_LOGIC;
q : OUT STD_LOGIC
);
END dflipflop;

ARCHITECTURE dff_arc OF dflipflop IS 
BEGIN
 b1: BLOCK (clk'EVENT AND clk ='1')
BEGIN 
q <= GUARDED d ; 
END BLOCK b1;
END dff_arc;