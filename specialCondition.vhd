----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:03 11/22/2019 
-- Design Name: 
-- Module Name:    specialCondition - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all; -- addition and substraction

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity specialCondition is
    Port ( currentfinalvalue : in  STD_LOGIC_VECTOR (7 downto 0);
           currentOppositeHole : in  STD_LOGIC_VECTOR (7 downto 0);
           currentScorehole : in  STD_LOGIC_VECTOR (7 downto 0);
           nextFinalvalue : out  STD_LOGIC_VECTOR(7 downto 0);
           nextOppositeHole : out  STD_LOGIC_VECTOR (7 downto 0);
           nextScorehole : out  STD_LOGIC_VECTOR (7 downto 0));
end specialCondition;

architecture Behavioral of moduloCalculator is
signal oppositeHole: STD_LOGIC_VECTOR (3 downto 0)

begin
  process  begin
	   if currentFinalvalue(0) = '0' then  -- to check even condition
		nextScorehole <= currentScorehole + currentFinalvalue;
		nextFinalvalue <= x"00";
	elsif currentFinalvalue = x"01" then  -- to check empty condition
		nextScorehole <= (currentScorehole + currentFinalvalue)+currentOppositeHole;
		nextFinalvalue <= x"00";
		nextOppositeHole <= x"00";
	else
		nextScorehole <= currentScorehole;
		nextOppositeHole  <= currentOppositeHole;
		nextFinalvalue <= currentFinalvalue;
	end if;
  end process; 

end Behavioral;
