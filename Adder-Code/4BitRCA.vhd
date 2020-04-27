library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitRCAAdder is
    Port ( A,B : in STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in STD_LOGIC;
			  Cout: out  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end FourBitRCAAdder;

architecture fourBitRCAAdder of FourBitRCAAdder is

component OneBitRCAAdder --declare component
    Port ( A,B,Cin : in  STD_LOGIC; 0--
           Cout,Sum : out  STD_LOGIC);
end component;

signal c1,c2,c3: STD_LOGIC; 


begin
FA1: OneBitRCAAdder port map( A(0), B(0), Cin, c1,Sum(0)); --adding the first bit of the two numbers
FA2: OneBitRCAAdder port map( A(1), B(1), c1, c2,Sum(1));--adding the second bit of the two numbers
FA3: OneBitRCAAdder port map( A(2), B(2), c2, c3,Sum(2));--adding the third bit of the two numbers
FA4: OneBitRCAAdder port map( A(3), B(3), c3, Cout,Sum(3));--adding the fourth bit of the two numbers

end fourBitRCAAdder;

