library IEEE; --library used
use IEEE.STD_LOGIC_1164.ALL; --standards used

entity SixteenBitCLAAdder is -- declare the name of the unit
Port ( P : in STD_LOGIC_VECTOR (15 downto 0);--input declaration 
		Q : in STD_LOGIC_VECTOR (15 downto 0); --input declaration 
		Cin : in STD_LOGIC;--input declaration 
		Cout : out STD_LOGIC;--output declaration 
		Sum : out STD_LOGIC_VECTOR (15 downto 0) --output declaration
);
end SixteenBitCLAAdder;


architecture Behavioral of SixteenBitCLAAdder is -- the action of the unit
  
component CLAAdder --declare the units used for the test
Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --input array
B : in STD_LOGIC_VECTOR (3 downto 0);--input array
Cin : in STD_LOGIC;--input 
Cout : out STD_LOGIC;--output
Sum : out STD_LOGIC_VECTOR (3 downto 0)); --output array
end component;

signal C1,C2,C3,C4 : std_logic; --carry signals
begin
Full_Adder_0 : CLAAdder --using 4 bit full adder to add the first 4 bits of the 16 bit array
port map (
A(3 downto 0) => P(3 downto 0),
B(3 downto 0) => Q(3 downto 0),
Cin => Cin,
Cout => C1,
Sum(3 downto 0) => Sum(3 downto 0)
);

Full_Adder_1 : CLAAdder --using 4 bit full adder to add the second 4 bits of the 16 bit array
port map (
A(3 downto 0) => P(7 downto 4),
B(3 downto 0) => Q(7 downto 4),
Cin => C1,
Cout => C2,
Sum(3 downto 0) => Sum(7 downto 4)
);

Full_Adder_2 : CLAAdder --using 4 bit full adder to add the second 4 bits of the 16 bit array
port map (
A(3 downto 0) => P(11 downto 8),
B(3 downto 0) => Q(11 downto 8),
Cin => C2,
Cout => C3,
Sum(3 downto 0) => Sum(11 downto 8)
);

Full_Adder_3 : CLAAdder --using 4 bit full adder to add the third 4 bits of the 16 bit array
port map (
A(3 downto 0) => P(15 downto 12),
B(3 downto 0) => Q(15 downto 12),
Cin => C3,
Cout => Cout,
Sum(3 downto 0) => Sum(15 downto 12)
);

 
end Behavioral;
