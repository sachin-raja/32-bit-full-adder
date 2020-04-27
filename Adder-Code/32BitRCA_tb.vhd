LIBRARY ieee; --library in use
USE ieee.std_logic_1164.ALL; --for using functions
 ENTITY ThirtytwoBitRCAAdder IS
END ThirtytwoBitRCAAdder; --name of the 32 bit adder
ARCHITECTURE behavior OF ThirtytwoBitRCAAdder IS --defines the action that the adder performs
     -- declaration of Components to test in our case its the 32 bit RCA adder
    COMPONENT T2BitRCAAdder
    PORT(
         P : IN  std_logic_vector(31 downto 0); 
         Q : IN  std_logic_vector(31 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Input signals
   signal P : std_logic_vector(31 downto 0) := (others => '0');
   signal Q : std_logic_vector(31 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   --Output signals
   signal Cout : std_logic;
   signal Sum : std_logic_vector(31 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: T2BitRCAAdder PORT MAP (
          P => P,
          Q => Q,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );
	stim_proc: process --start the process
	begin
		wait for 100 ns; --delay of 100ns
		P <= "00000000000000000000011111111001";-- first half 2041 of the A number 20417970
		Q <= "00000000000000000001111100100010";-- second half 7970 of the A number 20417970
				wait for 100 ns;
		P <= "00000000000000000000011111111001";
		Q <= "00000000000000000001101010000011"; 
		wait for 100 ns;
		P <= "01111010101010101010011111111001";
		Q <= "00000000000000000001111100100011"; 
	end process;
END behavior;
