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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zeroRule is
    generic (remaining : std_logic_vector (7 downto 0) := x"00");
    Port (
           p00temp, p01temp, p02temp, p03temp, p04temp, p05temp, p07temp,
           p08temp, p09temp, p10temp, p11temp, p12temp : std_logic_vector (7 downto 0);
           p00out, p01out, p02out, p03out, p04out, p05out,
           p07out, p08out, p09out, p10out, p11out, p12out : out  STD_LOGIC_VECTOR (7 downto 0);
           playerSelection : in  STD_LOGIC_VECTOR (3 downto 0));
end zeroRule;

architecture Behavioral of zeroRule is

begin

    process begin
        case playerSelection is
            when x"0" => p00out <= remaining; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"1" => p00out <= p00temp; p01out <= remaining; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"2" => p00out <= p00temp; p01out <= p01temp; p02out <= remaining; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"3" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= remaining; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"4" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= remaining; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"5" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= remaining; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"7" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= remaining; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"8" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= remaining; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"9" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= remaining; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp;
            when x"A" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= remaining; p11out <= p11temp; p12out <= p12temp;
            when x"B" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= remaining; p12out <= p12temp;
            when x"C" => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= remaining;
            when others => p00out <= p00temp; p01out <= p01temp; p02out <= p02temp; p03out <= p03temp; p04out <= p04temp; p05out <= p05temp; p07out <= p07temp; p08out <= p08temp; p09out <= p09temp; p10out <= p10temp; p11out <= p11temp; p12out <= p12temp; 
        end case;
    end process;

end Behavioral;

