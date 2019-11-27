----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:20 10/14/2017 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity decoder is
port(
		inValue: in std_logic_vector(7 downto 0); 
		outValue: out std_logic_vector(7 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
with inValue select outValue <= 
		"00000011" when x"00", 
		"10011111" when x"01", 
		"00100101" when x"02", 
		"00001101" when x"03", 
		"10011001" when x"04", 
		"01001001" when x"05", 
		"01000001" when x"06", 
		"00011111" when x"07", 
		"00000001" when x"08", 
		"00001001" when x"09",

		"00010001" when x"0a", -- "A"
		"11000001" when x"0b", -- "b"
		"01100011" when x"0c", -- "C"
		"10000101" when x"0d", -- "d"
		"01100001" when x"0e", -- "E"
		"01110001" when x"0f", -- "F"

		"11111101" when x"10", -- "-" 0 to 15
		"11101101" when x"20", -- "--" 15 to 31
		"01101101" when x"30", -- "---" 32 to 47
--  	"01101100" when x"40", -- "----."

		"00110001" when x"41", -- P
		"11100011" when x"42", -- L
		"01001001" when x"43", -- S

		"11111111" when others;

end Behavioral;

