-- DATA Register
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY data_reg IS PORT (
  D : IN STD_LOGIC_VECTOR (3 downto 0);
  clk, reset, load : IN STD_LOGIC;
  q : OUT STD_LOGIC_VECTOR (3 downto 0));
  END data_reg;
  
ARCHITECTURE reg_arc OF data_reg IS 
   BEGIN
   clk_rr: process 
   begin  
     if (reset='0') then q <="0000";
	 elsif ( rising_edge(clk)) then 
	 if (load = '1') then q <= d;
	 end if ;
	end if;
	wait;
	end process clk_rr;
END reg_arc;

 
  