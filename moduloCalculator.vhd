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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all; -- substraction

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity moduloCalculator is
    Port ( finalstep : in  STD_LOGIC_VECTOR (7 downto 0);
           modulo : out  STD_LOGIC_VECTOR (3 downto 0);
           division : out  STD_LOGIC);
end moduloCalculator;

architecture Behavioral of moduloCalculator is

signal substractor: std_logic_vector (7 downto 0);
signal divhold: std_logic;

begin

    process (finalstep) begin
        case finalstep is -- divide by 14 if 16 and above
            when x"00" => divhold <= '0';
            when x"01" => divhold <= '0';
            when x"02" => divhold <= '0';
            when x"03" => divhold <= '0';
            when x"04" => divhold <= '0';
            when x"05" => divhold <= '0';
            when x"06" => divhold <= '0';
            when x"07" => divhold <= '0';

            when x"08" => divhold <= '0';
            when x"09" => divhold <= '0';
            when x"0A" => divhold <= '0';
            when x"0B" => divhold <= '0';
            when x"0C" => divhold <= '0';
            when x"0D" => divhold <= '0'; -- 13

            when others => divhold <= '1'; -- 14 and up
        end case;
    end process;

    process (divhold, finalstep) begin
        if (divhold = '1') then
            substractor <= finalstep - x"0E";
        else
            substractor <= finalstep;
            -- case finalstep is 
                -- when  x"0E" => substractor <= x"00"; -- for 14
                -- when  x"0F" => substractor <= x"01"; -- for 15
              --  when others => substractor <= finalstep;
            --end case;   
        end if;
    end process;

    division <= divhold;
    
    modulo(3) <= substractor(3);
    modulo(2) <= substractor(2);
    modulo(1) <= substractor(1);
    modulo(0) <= substractor(0);

end Behavioral;

