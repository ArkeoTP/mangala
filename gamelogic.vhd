----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:10:04 11/19/2019 
-- Design Name: 
-- Module Name:    gamelogic - Behavioral 
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
use ieee.std_logic_unsigned.all; -- addition


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gamelogic is
    Port (
    p00, p01, p02, p03, p04, p05, p06,
    p07, p08, p09, p10, p11, p12, p13: in std_logic_vector (7 downto 0);
    playerSelection: in std_logic_vector (3 downto 0);
    resetButton: in std_logic;

    p00next, p01next, p02next, p03next, p04next, p05next, p06next, p07next,
       p08next, p09next, p10next, p11next, p12next, p13next : out std_logic_vector (7 downto 0));
    
end gamelogic;

architecture Behavioral of gamelogic is

signal currentvalue: std_logic_vector (7 downto 0);
signal finalstep: std_logic_vector (7 downto 0);
signal modulo: std_logic_vector (3 downto 0);
signal division: std_logic;

COMPONENT moduloCalculator
	PORT(
		finalstep : IN std_logic_vector(7 downto 0);          
		modulo : OUT std_logic_vector(3 downto 0);
		division : OUT std_logic
		);
END COMPONENT;

function holeCheck (playerSelection: std_logic_vector (3 downto 0);
                    currentHole: std_logic_vector (3 downto 0);
                    modulo: std_logic_vector (3 downto 0);
                    division: std_logic) return std_logic is 
begin
    if division = '0' then    -- from playerselect to modulo
        if ((currentHole > playerSelection) and (currenthole < modulo)) then 
            return '1';
        end if;
    elsif division = '1' then -- from 0 to modulo and playerselect to 13
        if ((currentHole > playerSelection) or (currenthole < modulo)) then 
            return '1';
        end if;
    end if;
return '0';
end holeCheck;

begin
    process begin
    case playerSelection is -- stones on hand
        when x"0" => currentvalue <= p00;
        when x"1" => currentvalue <= p01;
        when x"2" => currentvalue <= p02;
        when x"3" => currentvalue <= p03;
        when x"4" => currentvalue <= p04;
        when x"5" => currentvalue <= p05;

        when x"7" => currentvalue <= p07;
        when x"8" => currentvalue <= p08;
        when x"9" => currentvalue <= p09;
        when x"A" => currentvalue <= p10;
        when x"B" => currentvalue <= p11;
        when x"C" => currentvalue <= p12;

        when others => currentvalue <= x"00";
    end case;
    end process;

    finalstep <= (currentvalue + playerSelection);

    getfinalhole: moduloCalculator PORT MAP(
		finalstep => finalstep,
		modulo => modulo,
		division => division
	);
    process begin
        if resetButton = '1' then -- fix later
            p00next <= x"04";
            p01next <= x"04";
            p02next <= x"04";
            p03next <= x"04";
            p04next <= x"04";
            p05next <= x"04";

            p06next <= x"00";

            p07next <= x"04";
            p08next <= x"04";
            p09next <= x"04";
            p10next <= x"04";
            p11next <= x"04";
            p12next <= x"04";

            p13next <= x"00";            
        else
    p00next <= p00 + holeCheck(playerSelection, x"0", modulo, division);
    p01next <= p01 + holeCheck(playerSelection, x"1", modulo, division);
    p02next <= p02 + holeCheck(playerSelection, x"2", modulo, division);
    p03next <= p03 + holeCheck(playerSelection, x"3", modulo, division);
    p04next <= p04 + holeCheck(playerSelection, x"4", modulo, division);
    p05next <= p05 + holeCheck(playerSelection, x"5", modulo, division);

    p06next <= p06 + holeCheck(playerSelection, x"6", modulo, division);

    p07next <= p07 + holeCheck(playerSelection, x"7", modulo, division);
    p08next <= p08 + holeCheck(playerSelection, x"8", modulo, division);
    p09next <= p09 + holeCheck(playerSelection, x"9", modulo, division);
    p10next <= p10 + holeCheck(playerSelection, x"A", modulo, division);
    p11next <= p11 + holeCheck(playerSelection, x"B", modulo, division);
    p12next <= p12 + holeCheck(playerSelection, x"C", modulo, division);
    
    p13next <= p13 + holeCheck(playerSelection, x"D", modulo, division);
        end if;
    end process;

end Behavioral;

