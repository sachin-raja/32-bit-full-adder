LIBRARY ieee; --library used
USE ieee.std_logic_1164.ALL; --standards used
 
ENTITY FourBitCLAAdder_tb IS 
END FourBitCLAAdder_tb;
 
ARCHITECTURE behavior OF FourBitCLAAdder_tb IS --declaration of behavior of the entity
 
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT CLAAdder --component declaration
PORT(
A : IN std_logic_vector(3 downto 0); --input
B : IN std_logic_vector(3 downto 0); --input
Cin : IN std_logic; --input
Sum : OUT std_logic_vector(3 downto 0); --output
Cout : OUT std_logic --output
);
END COMPONENT;
 
--Inputs
signal A : std_logic_vector(3 downto 0) := (others => '0');
signal B : std_logic_vector(3 downto 0) := (others => '0');
signal Cin : std_logic := '0';
 
--Outputs
signal Sum : std_logic_vector(3 downto 0);
signal Cout : std_logic;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: CLAAdder PORT MAP (
A => A,
B => B,
Cin => Cin,
Sum => Sum,
Cout => Cout
);
 
-- Stimulus process
stim_proc: process
begin
-- delay of 100ms
wait for 100 ns;
 
A <= "0010";
B <= "1110";
 
wait for 100 ns; --delay of 100 ns
A <= "1101";
B <= "1101";
 
wait for 100 ns; --delay of 100 ns
A <= "0111";
B <= "0111";
 
wait for 100 ns; --delay of 100 ns
A <= "0111";
B <= "1110";

wait for 100ns; --delay of 100 ns
 
end process;
 
END;
