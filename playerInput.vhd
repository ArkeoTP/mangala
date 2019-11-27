----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:28 11/18/2019 
-- Design Name: 
-- Module Name:    playerInput - Behavioral 
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity playerInput is -- 6 to 4 bit decoder 2 to 1 bit MUX
    Port ( positionSelect : in  STD_LOGIC_VECTOR (5 downto 0);
           currentPlayer : in STD_LOGIC;
           positionOut: out STD_LOGIC_VECTOR (3 downto 0));
end playerInput;

architecture Behavioral of playerInput is

begin
    process begin
        if currentPlayer = '0' then
            case positionSelect is
                when "100000" => positionOut <= x"0";
                when "010000" => positionOut <= x"1";
                when "001000" => positionOut <= x"2";
                when "000100" => positionOut <= x"3";
                when "000010" => positionOut <= x"4";
                when "000001" => positionOut <= x"5";
                when others => positionOut <= x"6";
            end case;
        else
            case positionSelect is
                when "100000" => positionOut <= x"C";
                when "010000" => positionOut <= x"B";
                when "001000" => positionOut <= x"A";
                when "000100" => positionOut <= x"9";
                when "000010" => positionOut <= x"8";
                when "000001" => positionOut <= x"7";
                when others => positionOut <= x"6";
            end case;
        end if;
    end process;

end Behavioral;

