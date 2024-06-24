-- shift register
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shift_reg IS PORT (
  d0 : IN STD_LOGIC;
  clk, reset, shift : IN STD_LOGIC;
  q : OUT STD_LOGIC_VECTOR (3 downto 0));
END shift_reg;

ARCHITECTURE shift_reg_arc OF shift_reg IS 
BEGIN 
process 
begin 
if (reset ='0') then q <= "0000";
elsif (rising_edge(clk)) then
   if (shift='1') then  
     q(0) <= d0;
	 q(1) <= q(0);
	 q(2) <= q(1);
	 q(3) <= q(2);
end if;
end if;

end process;
END shift_reg_arc;