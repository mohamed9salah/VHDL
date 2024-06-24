LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY comp_8_bit IS 
PORT (
clock : IN STD_LOGIC;
IAB : IN STD_LOGIC;
A : IN STD_LOGIC_VECTOR (7 downto 0);
B : IN STD_LOGIC_VECTOR (7 downto 0);
output : OUT STD_LOGIC);
END comp_8_bit;

ARCHITECTURE comp_8_arc OF comp_8_bit IS 
SIGNAL temp : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL result : STD_LOGIC;
BEGIN 
temp(0) <= (NOT A(0) XOR NOT B(0));
temp(1) <= (NOT A(1) XOR NOT B(1));
temp(2) <= (NOT A(2) XOR NOT B(2));
temp(3) <= (NOT A(3) XOR NOT B(3));
temp(4) <= (NOT A(4) XOR NOT B(4));
temp(5) <= (NOT A(5) XOR NOT B(5));
temp(6) <= (NOT A(6) XOR NOT B(6));
temp(7) <= (NOT A(7) XOR NOT B(7));
process ( clock )
begin 
 if (rising_edge(clock )) then 
  if (temp = x"FF" and IAB = '0') then
   result <= '0';
  else 
  result <= '1';
  end if;
 end if;
 end process;
  output <= result;
 
 END comp_8_arc;
 
  