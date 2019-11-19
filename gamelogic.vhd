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
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gamelogic is
    Port (p00, p01, p02, p03, p04, p05, p06,
    p07, p08, p09, p10, p11, p12, p13: in std_logic_vector (7 downto 0);
    p00next, p01next, p02next, p03next, p04next, p05next, p06next, p07next,
       p08next, p09next, p10next, p11next, p12next, p13next : out std_logic_vector (7 downto 0);
       playerSelection: in std_logic_vector (3 downto 0));
end gamelogic;

architecture Behavioral of gamelogic is

signal currentvalue: std_logic_vector (7 downto 0);
signal finalstep: std_logic_vector (7 downto 0);

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

    finalstep <= currentvalue + playerSelection;

    process begin
        if (holeCheck(p00, playerSelection, modulo, divison))
        p00next <= p00 + 1;
        else 
     end if;

end Behavioral;

