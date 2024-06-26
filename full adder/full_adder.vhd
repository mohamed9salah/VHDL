-- full adder using structural mode 
 library ieee; 
 use ieee.std_logic_1164.all;  
 entity full_adder is  
   port( 
  X1, X2, Cin : in std_logic;  
  S, Cout : out std_logic
  );  
 end full_adder;  
 architecture full_adder_arc of full_adder is  
 signal a1, a2, a3: std_logic;  
 begin  
   a1 <= X1 xor X2;  
   a2 <= X1 and X2;  
   a3 <= a1 and Cin;  
   Cout <= a2 or a3;  
   S <= a1 xor Cin;  
 end full_adder_arc;  
Library IEEE;
USE IEEE.Std_logic_1164.all;

-- Testbench code of the structural code for full adder 
entity tb_full_adder is
end tb_full_adder;
 
architecture  tb_full_adder_arc of tb_full_adder is
 component full_adder 
   port( 
  X1, X2, Cin : in std_logic;  
  S, Cout : out std_logic
  );  
 end component; 
 signal A,B,Cin: std_logic:='0';
 signal S,Cout: std_logic;
begin   
 structural_adder: full_adder port map 
   (
    X1 => A,
    X2 => B,
    Cin => Cin,
    S => S,
    Cout => Cout 
   );
  process
  begin
   A <= '0';
   B <= '0';
   Cin <= '0';
   wait for 100 ns;
   A <= '0';
   B <= '0';
   Cin <= '1';
   wait for 100 ns;   
   A <= '0';
   B <= '1';
   Cin <= '0';
   wait for 100 ns;
   A <= '0';
   B <= '1';
   Cin <= '1';
   wait for 100 ns;
   A <= '1';
   B <= '0';
   Cin <= '0';
   wait for 100 ns;
   A <= '1';
   B <= '0';
   Cin <= '1';
   wait for 100 ns;
   A <= '1';
   B <= '1';
   Cin <= '0';
   wait for 100 ns;   
   A <= '1';
   B <= '1';
   Cin <= '1';
   wait for 100 ns;   
  end process;
      
end tb_full_adder_arc;