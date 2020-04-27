library IEEE; --library used
use IEEE.STD_LOGIC_1164.ALL; --stabdards used
 
entity OneBitPartialCLAAdder is --declare the entity
Port ( A : in STD_LOGIC; --input port
B : in STD_LOGIC; --input port
Cin : in STD_LOGIC; --input port
Sum : out STD_LOGIC; --sum output port
Prop : out STD_LOGIC; -- carry propagate output port
Gen : out STD_LOGIC); --carry generate output port
end OneBitPartialCLAAdder;
 
architecture CLAPartialAdder of OneBitPartialCLAAdder is --behaviour of the component
 
begin
 
Sum <= A xor B xor Cin; --sum logic
Prop <= A xor B;--carry propagate logic
Gen <= A and B;--carry generate logic
end CLAPartialAdder;