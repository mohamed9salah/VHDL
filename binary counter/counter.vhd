-- 4-bit up down binary counter
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY counter IS PORT (
rst, clk, up_down : IN STD_LOGIC;
q : OUT STD_LOGIC_VECTOR(3 downto 0));
END counter;

ARCHITECTURE counter_arc OF counter IS 

BEGIN 
process 
begin 
if (rst = '0') then q <= "0000";
elsif (rising_edge(clk)) then 
if (up_down = '1') then q <= q-1;
else q <= q+1;
end if;
end if;
wait; 
end process;
END counter_arc;