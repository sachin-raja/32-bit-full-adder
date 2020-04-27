LIBRARY ieee; --library used
USE ieee.std_logic_1164.ALL; --standards used
ENTITY FourBitRCAAdderTestBench IS
END FourBitRCAAdderTestBench;
ARCHITECTURE behavior OF FourBitRCAAdderTestBench IS  --behavior of the adder
 
    -- Declare component for the adder Unit Under Test 
 
    COMPONENT FourBitRCAAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Input signals
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Output signals
   signal Cout : std_logic;
   signal Sum : std_logic_vector(3 downto 0);
 
BEGIN
   uut: FourBitRCAAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );

   stim_proc: process
begin
wait for 100 ns; --delay of 100ns
A <= "1110";
B <= "1010";
 
wait for 100 ns; --delay of 100ns
A <= "1101";
B <= "1110";
wait for 100 ns;--delay of 100ns
A <= "0100";
B <= "0111";
wait for 100 ns;--delay of 100ns
A <= "0100";
B <= "1010";
wait for 100 ns;--delay of 100ns
end process;
END;
