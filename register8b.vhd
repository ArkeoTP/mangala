----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:38 11/21/2019 
-- Design Name: 
-- Module Name:    register8b - Behavioral 
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

entity register8b is
	Port ( Hold : in  STD_LOGIC_VECTOR (7 downto 0);
           Show : out  STD_LOGIC_VECTOR (7 downto 0);
           Clock: in std_logic);
end register8b;

architecture Behavioral of register8b is

    signal feedback: std_logic_vector (7 downto 0) := x"00";

begin

    process (Clock) begin
        if Clock'event and clock = '1' then
            feedback <= Hold;
        end if;
    end process;

    Show <= feedback;


end Behavioral;

