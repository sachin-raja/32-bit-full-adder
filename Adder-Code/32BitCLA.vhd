
library IEEE; --library used
use IEEE.STD_LOGIC_1164.ALL; -- library of functions used

entity ThirtyTwoBitCLAAdder is --declare the component
    Port ( A,B : in STD_LOGIC_Vector (31 downto 0); --input arrays
				Cin : in STD_LOGIC; 
				Cout: OUT  STD_LOGIC;
           Sum : out  STD_LOGIC_Vector (31 downto 0));--output arrays
end ThirtyTwoBitCLAAdder;

architecture adder of ThirtyTwoBitCLAAdder is
component SixteenBitCLAAdder -- a 16 bit CLA adder declared
Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
B : in STD_LOGIC_VECTOR (15 downto 0);
Cin : in STD_LOGIC;
Cout : out STD_LOGIC;
Sum : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal C1,C2 : std_logic;-- carry
begin
Full_Adder_16bit_0 : SixteenBitCLAAdder -- a 16 bit CLA adder used to add the first 16 bits of the 32 bit numbers
port map (--mapping the ports of the two adders
A(15 downto 0) => A(15 downto 0),
B(15 downto 0) => B(15 downto 0),
Cin => Cin,
Cout => C1,
Sum(15 downto 0) => Sum(15 downto 0)
);

Full_Adder_16bit_1 : SixteenBitCLAAdder -- a 16 bit CLA adder used to add the second 16 bits of the 32 bit numbers
port map (
A(15 downto 0) => A(31 downto 16),
B(15 downto 0) => B(31 downto 16),
Cin => C1,
Cout => Cout,
Sum(15 downto 0) => Sum(31 downto 16)
);
end adder;

