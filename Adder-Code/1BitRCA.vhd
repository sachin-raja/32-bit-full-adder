library IEEE; --library use
use IEEE.STD_LOGIC_1164.ALL; --standards used	

entity OneBitRCAAdder is -- creating an entity
    Port ( A,B,Cin : in  STD_LOGIC; --declaration of inputs
           Cout,Sum : out  STD_LOGIC); --declaration of outputs
end OneBitRCAAdder;  --ending an entity

architecture ADDER of OneBitRCAAdder is

begin
Sum <= A XOR B XOR Cin ; --implementation of sum logic
 Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ; --implementation of carry logic
end ADDER;
