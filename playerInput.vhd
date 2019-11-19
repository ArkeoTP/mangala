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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity playerInput is
    Port ( positionSelect : in  STD_LOGIC_VECTOR (3 downto 0);
           playTurn : in STD_LOGIC;
           clk : in STD_LOGIC;
           
           positionOut: out STD_LOGIC_VECTOR (3 downto 0));
end playerInput;

architecture Behavioral of playerInput is

signal position2 : STD_LOGIC_VECTOR (3 downto 0);

begin

incrementTurn: process(playTurn)
begin
    if (rising_edge(playTurn)) then
        positionOut <= positionSelect;
    end if;
end process;

end Behavioral;

