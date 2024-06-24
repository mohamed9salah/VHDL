LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY tb_comp_8_bit IS
END tb_comp_8_bit;

ARCHITECTURE tb_comb_8_bit_arc OF tb_comp_8_bit IS 

COMPONENT comp_8_bit 
PORT (
clock : IN STD_LOGIC;
IAB : IN STD_LOGIC;
A : IN STD_LOGIC_VECTOR (7 downto 0);
B : IN STD_LOGIC_VECTOR (7 downto 0);
output : OUT STD_LOGIC);
END COMPONENT;

signal clock : STD_LOGIC := '0';
signal A :  STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal B :  STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal IAB : STD_LOGIC := '0';
signal output : STD_LOGIC;
constant clock_period : time := 10 ns;
BEGIN 
uut: comp_8_bit PORT MAP (
          clock => clock,
          A => A,
          B => B,
          IAB => IAB,
          Output => Output);
 process_clock: process 
begin 
clock <= '0';
wait for clock_period /2;

clock <='1';
wait for clock_period/2;
end process;

process 
begin 
wait for 100 ns;
A <= x"AA"; -- 10101010
B <= x"BB"; -- 10111011
wait for 100 ns;
B <= x"AA";
wait; 
end process;
END; 