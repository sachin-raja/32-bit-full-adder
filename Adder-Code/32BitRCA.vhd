library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T2BitRCAAdder is --declaring the 32 bir adder
    Port ( P,Q : in STD_LOGIC_VECTOR (31 downto 0);
			  Cin : in STD_LOGIC;
			  Cout: out  STD_LOGIC;
			  Sum : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end T2BitRCAAdder;

architecture Thirty2BitRCAAdder of T2BitRCAAdder is

    COMPONENT FourBitRCAAdder -- declaration of 4 bit adder to be used
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
			Cout : OUT  std_logic;
			Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

signal C1,C2,C3,C4,C5,C6,C7 : std_logic; --Carry signals
begin --start process
Full_Adder_0 : FourBitRCAAdder --mapping the first four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(3 downto 0),
B(3 downto 0) => Q(3 downto 0),
Cin => Cin,
Sum(3 downto 0) => Sum(3 downto 0),
Cout => C1
);

Full_Adder_1 : FourBitRCAAdder --mapping the second four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(7 downto 4),
B(3 downto 0) => Q(7 downto 4),
Cin => C1,
Sum(3 downto 0) => Sum(7 downto 4),
Cout => C2
);

Full_Adder_2 : FourBitRCAAdder --mapping the third four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(11 downto 8),
B(3 downto 0) => Q(11 downto 8),
Cin => C2,
Sum(3 downto 0) => Sum(11 downto 8),
Cout => C3
);

Full_Adder_3 : FourBitRCAAdder --mapping the fourth four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(15 downto 12),
B(3 downto 0) => Q(15 downto 12),
Cin => C3,
Sum(3 downto 0) => Sum(15 downto 12),
Cout => C4
--C4
);
 
Full_Adder_4 : FourBitRCAAdder --mapping the fifth four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(19 downto 16),
B(3 downto 0) => Q(19 downto 16),
Cin => C4,
Sum(3 downto 0) => Sum(19 downto 16),
Cout => C5
);

Full_Adder_5 : FourBitRCAAdder  --mapping the sixth four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(23 downto 20),
B(3 downto 0) => Q(23 downto 20),
Cin => C5,
Sum(3 downto 0) => Sum(23 downto 20),
Cout => C6
--C6
);

Full_Adder_6 : FourBitRCAAdder  --mapping the seventh four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(27 downto 24),
B(3 downto 0) => Q(27 downto 24),
Cin => C6,
Sum(3 downto 0) => Sum(27 downto 24),
Cout => C7
--C7
);

Full_Adder_7 : FourBitRCAAdder --mapping the eigth four bits of the 32 bit adder to the 4 bit adder
port map (
A(3 downto 0) => P(31 downto 28),
B(3 downto 0) => Q(31 downto 28),
Cin => C7,
Sum(3 downto 0) => Sum(31 downto 28),
Cout => Cout
);
end Thirty2BitRCAAdder;