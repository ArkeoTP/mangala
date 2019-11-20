----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:03 11/20/2019 
-- Design Name: 
-- Module Name:    moduloCalculator - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity moduloCalculator is
    Port ( currentValue : in  STD_LOGIC_VECTOR (7 downto 0);
           playerSelection : in  STD_LOGIC_VECTOR (3 downto 0);
           modulo : out  STD_LOGIC_VECTOR (3 downto 0);
           division : out  STD_LOGIC);
end moduloCalculator;

architecture Behavioral of moduloCalculator is

begin


end Behavioral;

