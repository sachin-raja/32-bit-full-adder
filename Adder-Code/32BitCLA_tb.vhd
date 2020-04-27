
LIBRARY ieee; --library used
USE ieee.std_logic_1164.ALL;

ENTITY ThirtyTwoBitCLAAdder_tb IS
END ThirtyTwoBitCLAAdder_tb;
 
ARCHITECTURE behavior OF ThirtyTwoBitCLAAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ThirtyTwoBitCLAAdder
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Sum : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ThirtyTwoBitCLAAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );


   stim_proc: process --start the process
   begin		
		wait for 100 ns;
		A <= "00000000000000000000011111111001"; -- first half 2041 of the A number 20417970
		B <= "00000000000000000001101010000011"; -- second half 7970 of the A number 20417970
		wait for 100 ns;
		A <= "01111010101010101010011111111001";
		B <= "00000000000000000001111100100011"; 
		wait for 100 ns;
		A <= "00000000000000000000011111111001";
		B <= "00000000000000000001111100100010"; 
		wait for 100 ns;
   end process;

END;
