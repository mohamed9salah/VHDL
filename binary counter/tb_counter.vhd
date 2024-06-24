-- counter testbench
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_TEXTIO.all;
use std.textio.all;

entity tb_counter is 
end tb_counter;

architecture tb_counter_arc of tb_counter is
component counter port (
d : IN std_logic_vector (3 downto 0);
rst : IN std_logic;
clk, load, en : IN std_logic;
q : OUT std_logic_vector (3 downto 0));
end component;

constant delay : integer := 10; -- wait
constant n : integer := 4; -- width counter
constant t : time := 20 ns; -- clock period
signal clk : std_logic :='0';
signal rst : std_logic :='0';
signal load : std_logic := '0';
signal en : std_logic := '0';
signal data_tb : std_logic_vector(3 downto 0) := "0000";
signal q_tb : std_logic_vector(3 downto 0);
signal check : std_logic_vector(3 downto 0) := "0000";

begin 
dut: counter PORT MAP (
d => d, rst => rst, q => q, en => en, clk => clk, load => load); 

clk_proc: process 
begin 
clk <='0';
wait for T/2 ;
clk <='1';
wait for T/2;
end process clk_proc;
rst <='1', '0' after 10 ns;

test_process: process 
variable line_x : line;
begin 
wait until (falling_edge(rst)) ;
wait until (falling_edge(clk)) ;
load <= '1'; en <= '0'; 
data_tb <= "1010";
wait until (falling_edge(clk));
if (q_tb /= "1010") then 
write (line_x, string'("load fail"));
write (line_x,q_tb);
writeline (output,line_x);
end if;
check <= "1010";
load <= '0';
en <= '1';

for i in 1 to 8 loop 
check <= check +1;
wait until falling_edge(clk);
if (q_tb /= check) then 
report "count fail at time count"; 
end if;
end loop;
wait;
end process;
end architecture;




