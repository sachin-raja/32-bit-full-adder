LIBRARY ieee;--library used 
USE ieee.std_logic_1164.ALL; --standards used
ENTITY SixteenBitCLAAdder_tb IS --declaration of testbench
END SixteenBitCLAAdder_tb;
ARCHITECTURE behavior OF SixteenBitCLAAdder_tb IS --behavior of the 
    -- Component declaration for test bench
    COMPONENT SixteenBitCLAAdder
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
 	--Outputs
   signal Cout : std_logic;
   signal Sum : std_logic_vector(15 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: SixteenBitCLAAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 ns;--delay of 100 ns
		A <= "0000011111111101";
		B <= "0001111101110111";
				wait for 100 ns;--delay of 100 ns
		A <= "0000011111001010";
		B <= "0101010011011110";
				wait for 100 ns;--delay of 100 ns
		A <= "1111111111111001";
		B <= "0001111100111110";
		wait for 1000 ns;
   end process;
END;
