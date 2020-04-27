
library IEEE; --library use
use IEEE.STD_LOGIC_1164.ALL; --standards used

entity CLAAdder is --declare the entity
Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --input
B : in STD_LOGIC_VECTOR (3 downto 0);  --input
Cin : in STD_LOGIC; --input
Sum : out STD_LOGIC_VECTOR (3 downto 0);  --output port
Cout : out STD_LOGIC); --output port
end CLAAdder;


architecture Behavioral of CLAAdder is --behaviour implementation
component OneBitPartialCLAAdder
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
Sum : out STD_LOGIC;
Prop : out STD_LOGIC;
Gen : out STD_LOGIC);
end component;
 
signal c1,c2,c3: STD_LOGIC;
signal P,G: STD_LOGIC_VECTOR(3 downto 0);
begin
 
PFA1: OneBitPartialCLAAdder port map( A(0), B(0), Cin, Sum(0), P(0), G(0));
PFA2: OneBitPartialCLAAdder port map( A(1), B(1), c1, Sum(1), P(1), G(1));
PFA3: OneBitPartialCLAAdder port map( A(2), B(2), c2, Sum(2), P(2), G(2));
PFA4: OneBitPartialCLAAdder port map( A(3), B(3), c3, Sum(3), P(3), G(3));
 
c1 <= G(0) OR (P(0) AND Cin);
c2 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
c3 <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
Cout <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin);
 
end Behavioral;

