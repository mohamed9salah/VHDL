LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY sync_d_flip_flop IS 
PORT (
d, clk, R : IN std_logic; -- clk: Clock , R: Reset
q : OUT std_logic);
END sync_d_flip_flop;

ARCHITECTURE d_arc OF sync_d_flip_flop IS 

BEGIN 
 process 
 begin 
 if (rising_edge(clk)) then 
   if (R ='1' ) then q <= '0';
   else q <= d;
   end if;
 end if;
 end process;
 END d_arc;