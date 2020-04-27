library IEEE; --library use
use IEEE.STD_LOGIC_1164.ALL; --standards used

entity OneBitRCAAdderTestBench is
end OneBitRCAAdderTestBench;
architecture Behavioral of OneBitRCAAdderTestBench is --behaviour of the system


Component OneBitRCAAdderm  --declare component used for test bench
    Port ( A,B,Cin : in  STD_LOGIC; --input ports
           Cout,Sum : out  STD_LOGIC); --output ports
end Component;

 --Input signals
 signal A : std_logic := '0';
 signal B : std_logic := '0';
 signal Cin : std_logic := '0';
 
 --Outputs signals
 signal Sum : std_logic;
 signal Cout : std_logic;

begin -- declare the unit under test and port map it
 uut: OneBitRCAAdder PORT MAP (
 A => A,
 B => B,
 Cin => Cin,
 Sum => Sum,
 Cout => Cout
 );

-- Stimulus process
 stim_proc: process
 begin
 -- Stimulus process
 wait for 100 ns;
  A <= '1';
 B <= '1';
 Cin <= '0';
 wait for 20 ns;
 
 A <= '0';
 B <= '0';
 Cin <= '1';
 wait for 20 ns;
 
 A <= '1';
 B <= '1';
 Cin <= '1';
 wait for 20 ns;
 
 A <= '0';
 B <= '1';
 Cin <= '1';
 wait for 20 ns;
 
 
 A <= '1';
 B <= '0';
 Cin <= '1';
 wait for 20 ns;
 
 
 end process;


end Behavioral;

