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
    currentPlayer : in std_logic;

    p00next, p01next, p02next, p03next, p04next, p05next, p06next, p07next,
       p08next, p09next, p10next, p11next, p12next, p13next : out std_logic_vector (7 downto 0));
    
end gamelogic;

architecture Behavioral of gamelogic is

signal currentvalue: std_logic_vector (7 downto 0);
signal finalstep: std_logic_vector (7 downto 0);
signal modulo: std_logic_vector (3 downto 0);
signal division: std_logic;

signal p00temp, p01temp, p02temp, p03temp, p04temp, p05temp, p07temp,
p08temp, p09temp, p10temp, p11temp, p12temp : std_logic_vector (7 downto 0);

signal p06incr, p13incr : std_logic_vector (7 downto 0);
signal allzero06, allzero13 : std_logic_vector (7 downto  0) := x"00";

COMPONENT moduloCalculator
	PORT(
		finalstep : IN std_logic_vector(7 downto 0);          
		modulo : OUT std_logic_vector(3 downto 0);
		division : OUT std_logic
		);
END COMPONENT;

COMPONENT zeroRule
	PORT(
		p00temp : IN std_logic_vector(7 downto 0);
		p01temp : IN std_logic_vector(7 downto 0);
		p02temp : IN std_logic_vector(7 downto 0);
		p03temp : IN std_logic_vector(7 downto 0);
		p04temp : IN std_logic_vector(7 downto 0);
		p05temp : IN std_logic_vector(7 downto 0);
		p07temp : IN std_logic_vector(7 downto 0);
		p08temp : IN std_logic_vector(7 downto 0);
		p09temp : IN std_logic_vector(7 downto 0);
		p10temp : IN std_logic_vector(7 downto 0);
		p11temp : IN std_logic_vector(7 downto 0);
		p12temp : IN std_logic_vector(7 downto 0);
        playerSelection : IN std_logic_vector(3 downto 0);
        modulo : IN std_logic_vector (3 downto 0);
        currentplayer : IN std_logic;          
		p00out : OUT std_logic_vector(7 downto 0);
		p01out : OUT std_logic_vector(7 downto 0);
		p02out : OUT std_logic_vector(7 downto 0);
		p03out : OUT std_logic_vector(7 downto 0);
		p04out : OUT std_logic_vector(7 downto 0);
		p05out : OUT std_logic_vector(7 downto 0);
		p07out : OUT std_logic_vector(7 downto 0);
		p08out : OUT std_logic_vector(7 downto 0);
		p09out : OUT std_logic_vector(7 downto 0);
		p10out : OUT std_logic_vector(7 downto 0);
		p11out : OUT std_logic_vector(7 downto 0);
        p12out : OUT std_logic_vector(7 downto 0);
        p06incr : OUT std_logic_vector(7 downto 0);
        p13incr : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;


function holeCheck (playerSelection: std_logic_vector (3 downto 0);
                    currentHole: std_logic_vector (3 downto 0);
                    modulo: std_logic_vector (3 downto 0);
                    division: std_logic) return std_logic is 
begin
    if division = '0' then    -- from playerselect to modulo
        if ((currentHole > playerSelection) and (currenthole <= modulo)) then 
            return '1';
        end if;
    elsif division = '1' then -- from 0 to modulo and playerselect to 13
        if ((currentHole > playerSelection) or (currenthole <= modulo)) then 
            return '1';
        end if;
    end if;
return '0';
end holeCheck;

begin
    process (playerSelection, p00, p01, p02, p03, p04, p05, p07, p08, p09, p10, p11, p12) begin
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

    process (p00, p01, p02, p03, p04, p05, p07, p08, p09, p10, p11, p12) begin -- if someone gets all zero rows, he collects all the remaining stones
        if (p00 = x"00") and (p01 = x"00") and (p02 = x"00") and (p03 = x"00") and (p04 = x"00") and (p05 = x"00") then
            allzero06 <= p07 + p08 + p09 + p10 + p11 + p12;
            allzero13 <= x"00";
        elsif (p07 = x"00") and (p08 = x"00") and (p09 = x"00") and (p10 = x"00") and (p11 = x"00") and (p12 = x"00") then
            allzero13 <= p00 + p01 + p02 + p03 + p04 + p05;
            allzero06 <= x"00";
        else
            allzero06 <= x"00";
            allzero13 <= x"00";
        end if;
    end process;
    
    process (resetButton, modulo, division, playerSelection, 
             p00, p01, p02, p03, p04, p05, p06, 
             p07, p08, p09, p10, p11, p12, p13, 
             p06incr, p13incr, allzero06, allzero13) begin
        if resetButton = '1' then -- don't fix

            p00temp <= x"04";
            p01temp <= x"04";
            p02temp <= x"04";
            p03temp <= x"04";
            p04temp <= x"04";
            p05temp <= x"04";

            p06next <= x"00";

            p07temp <= x"04";
            p08temp <= x"04";
            p09temp <= x"04";
            p10temp <= x"04";
            p11temp <= x"04";
            p12temp <= x"04";

            p13next <= x"00";            
        else -- incrementation rule
            p00temp <= p00 + holeCheck(playerSelection, x"0", modulo, division);
            p01temp <= p01 + holeCheck(playerSelection, x"1", modulo, division);
            p02temp <= p02 + holeCheck(playerSelection, x"2", modulo, division);
            p03temp <= p03 + holeCheck(playerSelection, x"3", modulo, division);
            p04temp <= p04 + holeCheck(playerSelection, x"4", modulo, division);
            p05temp <= p05 + holeCheck(playerSelection, x"5", modulo, division);

            p06next <= p06 + holeCheck(playerSelection, x"6", modulo, division) + p06incr + allzero06;

            p07temp <= p07 + holeCheck(playerSelection, x"7", modulo, division);
            p08temp <= p08 + holeCheck(playerSelection, x"8", modulo, division);
            p09temp <= p09 + holeCheck(playerSelection, x"9", modulo, division);
            p10temp <= p10 + holeCheck(playerSelection, x"A", modulo, division);
            p11temp <= p11 + holeCheck(playerSelection, x"B", modulo, division);
            p12temp <= p12 + holeCheck(playerSelection, x"C", modulo, division);
    
            p13next <= p13 + holeCheck(playerSelection, x"D", modulo, division) + p13incr + allzero13;
        end if;
    end process;

    ZeroingRules: zeroRule PORT MAP(
		p00temp => p00temp,
		p01temp => p01temp,
		p02temp => p02temp,
		p03temp => p03temp,
		p04temp => p04temp,
		p05temp => p05temp,
		p07temp => p07temp,
		p08temp => p08temp,
		p09temp => p09temp,
		p10temp => p10temp,
		p11temp => p11temp,
		p12temp => p12temp,
		p00out => p00next,
		p01out => p01next,
		p02out => p02next,
		p03out => p03next,
		p04out => p04next,
		p05out => p05next,
		p07out => p07next,
		p08out => p08next,
		p09out => p09next,
		p10out => p10next,
		p11out => p11next,
		p12out => p12next,
        playerSelection => playerSelection,
        modulo => modulo,
        currentplayer => currentplayer,
        p06incr => p06incr,
        p13incr => p13incr
	);

end Behavioral;

