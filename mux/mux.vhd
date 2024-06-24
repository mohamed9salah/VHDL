-- multibluxer

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS 
PORT (
a, b, c, d, s0, s1 : IN STD_LOGIC;
z : OUT STD_LOGIC
);
END mux;

ARCHITECTURE muxarc OF mux IS 
BEGIN 

z <= ( a AND NOT s0 AND NOT s1 ) 
  OR (b AND NOT s0 AND s1 ) 
  OR (c AND s0 AND NOT s1 ) 
  OR (d AND s0 AND s1 );


END muxarc; 