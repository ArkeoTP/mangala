----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:22 11/25/2019 
-- Design Name: 
-- Module Name:    zeroRule - Behavioral 
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
use ieee.std_logic_unsigned.all; -- addition

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zeroRule is
    generic (remaining : std_logic_vector (7 downto 0) := x"00");
    Port (
           p00temp, p01temp, p02temp, p03temp, p04temp, p05temp, p07temp,
           p08temp, p09temp, p10temp, p11temp, p12temp : in std_logic_vector (7 downto 0);
           p00out, p01out, p02out, p03out, p04out, p05out,
           p07out, p08out, p09out, p10out, p11out, p12out : out  STD_LOGIC_VECTOR (7 downto 0);
           p06incr, p13incr : out STD_LOGIC_VECTOR (7 downto 0);
           playerSelection : in  STD_LOGIC_VECTOR (3 downto 0);
           modulo : in STD_LOGIC_VECTOR (3 downto 0);
           currentplayer : in std_logic);
end zeroRule;

architecture Behavioral of zeroRule is

    signal p00temp2, p01temp2, p02temp2, p03temp2, p04temp2, p05temp2, p07temp2,
           p08temp2, p09temp2, p10temp2, p11temp2, p12temp2 : std_logic_vector (7 downto 0);

begin
    process (currentplayer, modulo) begin
        if currentplayer = '0' then
            if modulo = x"0" then -- holes 0 and 12
                if p00temp = x"01" then
                    p06incr <= p12temp + 1;
                    p00temp2 <= x"00";
                    p12temp2 <= x"00";
                elsif p00temp(0) = '0' then
                    p06incr <= p00temp;
                    p00temp2 <= p00temp;
                    p12temp2 <= p12temp;
                else
                    p00temp2 <= p00temp;
                    p12temp2 <= p12temp;
                    p06incr <= x"00";
                end if;
                p01temp2 <= p01temp; p02temp2 <= p02temp; p03temp2 <= p03temp; p04temp2 <= p04temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p08temp2 <= p08temp; p09temp2 <= p09temp; p10temp2 <= p10temp; p11temp2 <= p11temp;
                p13incr <= x"00";


            elsif modulo = x"1" then -- holes 1 and 11
                if p01temp = x"01" then
                    p06incr <= p11temp + 1;
                    p01temp2 <= x"00";
                    p11temp2 <= x"00";
                elsif p01temp(0) = '0' then
                    p06incr <= p01temp;
                    p01temp2 <= x"00";
                    p11temp2 <= p11temp;
                else
                    p01temp2 <= p01temp;
                    p11temp2 <= p11temp;
                    p06incr <= x"00";
                end if;
                p00temp2 <= p00temp; p02temp2 <= p02temp; p03temp2 <= p03temp; p04temp2 <= p04temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p08temp2 <= p08temp; p09temp2 <= p09temp; p10temp2 <= p10temp; p12temp2 <= p12temp;
                p13incr <= x"00";


            elsif modulo = x"2" then -- holes 2 and 10
            if p02temp = x"01" then
                    p06incr <= p10temp + 1;
                    p02temp2 <= x"00";
                    p10temp2 <= x"00";
                elsif p02temp(0) = '0' then
                    p06incr <= p02temp;
                    p02temp2 <= x"00";
                    p10temp2 <= p10temp;
                else
                    p02temp2 <= p02temp;
                    p10temp2 <= p10temp;
                    p06incr <= x"00";
                end if;
                p00temp2 <= p00temp; p04temp2 <= p04temp; p03temp2 <= p03temp; p11temp2 <= p11temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p01temp2 <= p01temp; p09temp2 <= p09temp; p08temp2 <= p08temp; p12temp2 <= p12temp;
                p13incr <= x"00";
            elsif modulo = x"3" then -- holes 3 and 9
                if p03temp = x"01" then
                    p06incr <= p09temp + 1;
                    p03temp2 <= x"00";
                    p09temp2 <= x"00";
                elsif p03temp(0) = '0' then
                    p06incr <= p02temp;
                    p03temp2 <= x"00";
                    p09temp2 <= p09temp;
                else
                    p03temp2 <= p03temp;
                    p09temp2 <= p09temp;
                    p06incr <= x"00";
                end if;
                p00temp2 <= p00temp; p04temp2 <= p04temp; p02temp2 <= p02temp; p11temp2 <= p11temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p01temp2 <= p01temp; p10temp2 <= p10temp; p08temp2 <= p08temp; p12temp2 <= p12temp;
                p13incr <= x"00";
            elsif modulo = x"4" then -- holes 4 and 8
                if p04temp = x"01" then
                    p06incr <= p08temp + 1;
                    p04temp2 <= x"00";
                    p08temp2 <= x"00";
                elsif p04temp(0) = '0' then
                    p06incr <= p04temp;
                    p04temp2 <= x"00";
                    p08temp2 <= p08temp;
                else
                    p04temp2 <= p04temp;
                    p08temp2 <= p08temp;
                    p06incr <= x"00";
                end if;
                p00temp2 <= p00temp; p02temp2 <= p02temp; p03temp2 <= p03temp; p11temp2 <= p11temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p01temp2 <= p01temp; p09temp2 <= p09temp; p08temp2 <= p08temp; p12temp2 <= p12temp;
                p13incr <= x"00";
            elsif modulo = x"5" then -- holes 5 and 7
                if p05temp = x"01" then
                    p06incr <= p07temp + 1;
                    p05temp2 <= x"00";
                    p07temp2 <= x"00";
                elsif p05temp(0) = '0' then
                    p06incr <= p05temp;
                    p05temp2 <= x"00";
                    p07temp2 <= p07temp;
                else
                    p05temp2 <= p05temp;
                    p07temp2 <= p07temp;
                    p06incr <= x"00";
                end if;
                p00temp2 <= p00temp; p04temp2 <= p04temp; p03temp2 <= p03temp; p11temp2 <= p11temp; p02temp2 <= p02temp;
                p10temp2 <= p10temp; p01temp2 <= p01temp; p09temp2 <= p09temp; p08temp2 <= p08temp; p12temp2 <= p12temp;
                p13incr <= x"00";
            else -------
 if modulo = x"7" then -- holes 7 and 5
                if p007temp = x"01" then
                    p13incr <= p05temp + 1;
                    p07temp2 <= x"00";
                    p05temp2 <= x"00";
                elsif p07temp(0) = '0' then
                    p13incr <= p07temp;
                    p07temp2 <= x"00";
                    p05temp2 <= p05temp;
                else
                    p07temp2 <= p07temp;
                    p05temp2 <= p05temp;
                    p13incr <= x"00";
                end if;
                p01temp2 <= p01temp; p02temp2 <= p02temp; p03temp2 <= p03temp; p04temp2 <= p04temp; p00temp2 <= p00temp;
                p12temp2 <= p12temp; p08temp2 <= p08temp; p09temp2 <= p09temp; p10temp2 <= p10temp; p11temp2 <= p11temp;
                p06incr <= x"00";


            elsif modulo = x"8" then -- holes 4 and 8
                if p08temp = x"01" then
                    p13incr <= p04temp + 1;
                    p08temp2 <= x"00";
                    p04temp2 <= x"00";
                elsif p08temp(0) = '0' then
                    p13incr <= p08temp;
                    p08temp2 <= x"00";
                    p04temp2 <= p04temp;
                else
                    p08temp2 <= p08temp;
                    p04temp2 <= p04temp;
                    p13incr <= x"00";
                end if;
                p00temp2 <= p00temp; p02temp2 <= p02temp; p03temp2 <= p03temp; p11temp2 <= p11temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p01temp2 <= p01temp; p09temp2 <= p09temp; p10temp2 <= p10temp; p12temp2 <= p12temp;
                p06incr <= x"00";

            elsif modulo = x"9" then -- holes 3 and 9
            if p09temp = x"01" then
                    p13incr <= p03temp + 1;
                    p09temp2 <= x"00";
                    p03temp2 <= x"00";
                elsif p09temp(0) = '0' then
                    p13incr <= p08temp;
                    p09temp2 <= x"00";
                    p03temp2 <= p03temp;
                else
                    p09temp2 <= p09temp;
                    p03temp2 <= p03temp;
                    p13incr <= x"00";
                end if;
                p00temp2 <= p00temp; p02temp2 <= p02temp; p04temp2 <= p04temp; p11temp2 <= p11temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p01temp2 <= p01temp; p08temp2 <= p08temp; p10temp2 <= p10temp; p12temp2 <= p12temp;
                p06incr <= x"00";

            elsif modulo = x"A" then -- holes 2 and 10
if p10temp = x"01" then
                    p13incr <= p02temp + 1;
                    p10temp2 <= x"00";
                    p02temp2 <= x"00";
                elsif p010temp(0) = '0' then
                    p13incr <= p10temp;
                    p10temp2 <= x"00";
                    p02temp2 <= p02temp;
                else
                    p10temp2 <= p10temp;
                    p02temp2 <= p02temp;
                    p13incr <= x"00";
                end if;
                p00temp2 <= p00temp; p04temp2 <= p04temp; p03temp2 <= p03temp; p11temp2 <= p11temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p01temp2 <= p01temp; p09temp2 <= p09temp; p08temp2 <= p08temp; p12temp2 <= p12temp;
                p06incr <= x"00";
            elsif modulo = x"B" then -- holes 1 and 11
if p11temp = x"01" then
                    p13incr <= p01temp + 1;
                    p11temp2 <= x"00";
                    p01temp2 <= x"00";
                elsif p11temp(0) = '0' then
                    p13incr <= p11temp;
                    p11temp2 <= x"00";
                    p01temp2 <= p01temp;
                else
                    p11temp2 <= p11temp;
                    p01temp2 <= p01temp;
                    p13incr <= x"00";
                end if;
                p00temp2 <= p00temp; p02temp2 <= p02temp; p03temp2 <= p03temp; p04temp2 <= p04temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p08temp2 <= p08temp; p09temp2 <= p09temp; p10temp2 <= p10temp; p12temp2 <= p12temp;
                p06incr <= x"00";
            elsif modulo = x"C" then -- holes 0 and 12
if p12temp = x"01" then
                    p13incr <= p00temp + 1;
                    p12temp2 <= x"00";
                    p00temp2 <= x"00";
                elsif p12temp(0) = '0' then
                    p13incr <= p12temp;
                    p12temp2 <= x"00";
                    p00temp2 <= p00temp;
                else
                    p12temp2 <= p12temp;
                    p00temp2 <= p00temp;
                    p13incr <= x"00";
                end if;
                p04temp2 <= p04temp; p02temp2 <= p02temp; p03temp2 <= p03temp; p11temp2 <= p11temp; p05temp2 <= p05temp;
                p07temp2 <= p07temp; p01temp2 <= p01temp; p09temp2 <= p09temp; p10temp2 <= p10temp; p08temp2 <= p108temp;
                p06incr <= x"00";
   
            end if;
        else
            case modulo is 
                when x"7" =>
                when x"8" =>
                when x"9" =>
                when x"A" =>
                when x"B" =>
                when x"C" =>
                when others =>
            end case;
        end if;
    end process;


    process begin
        case playerSelection is
            when x"0" => p00out <= remaining; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"1" => p00out <= p00temp2; p01out <= remaining; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"2" => p00out <= p00temp2; p01out <= p01temp2; p02out <= remaining; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"3" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= remaining; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"4" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= remaining; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"5" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= remaining; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"7" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= remaining; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"8" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= remaining; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"9" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= remaining; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2;
            when x"A" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= remaining; p11out <= p11temp2; p12out <= p12temp2;
            when x"B" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= remaining; p12out <= p12temp2;
            when x"C" => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= remaining;
            when others => p00out <= p00temp2; p01out <= p01temp2; p02out <= p02temp2; p03out <= p03temp2; p04out <= p04temp2; p05out <= p05temp2; p07out <= p07temp2; p08out <= p08temp2; p09out <= p09temp2; p10out <= p10temp2; p11out <= p11temp2; p12out <= p12temp2; 
        end case;
    end process;

end Behavioral;

