----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:05 11/21/2019 
-- Design Name: 
-- Module Name:    DisplayModule - Behavioral 
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
use ieee.std_logic_unsigned.all; -- addition for BCD

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DisplayModule is
    Port (  
        p00 : in  STD_LOGIC_VECTOR (7 downto 0);
        p01 : IN std_logic_vector(7 downto 0);
		p02 : IN std_logic_vector(7 downto 0);
		p03 : IN std_logic_vector(7 downto 0);
		p04 : IN std_logic_vector(7 downto 0);
		p05 : IN std_logic_vector(7 downto 0);
		p06 : IN std_logic_vector(7 downto 0);
		p07 : IN std_logic_vector(7 downto 0);
		p08 : IN std_logic_vector(7 downto 0);
		p09 : IN std_logic_vector(7 downto 0);
		p10 : IN std_logic_vector(7 downto 0);
		p11 : IN std_logic_vector(7 downto 0);
		p12 : IN std_logic_vector(7 downto 0);
		p13 : IN std_logic_vector(7 downto 0);
		boardSwitch: in std_logic;
		SevSegBus: out std_logic_vector (7 downto 0);
		SevSegControl: out std_logic_vector (7 downto 0);
        
        clk: in std_logic
        );
end DisplayModule;

architecture Behavioral of DisplayModule is

    COMPONENT sevenSegment
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		C : IN std_logic_vector(7 downto 0);
		D : IN std_logic_vector(7 downto 0);
		E : IN std_logic_vector(7 downto 0);
		F : IN std_logic_vector(7 downto 0);
		G : IN std_logic_vector(7 downto 0);
		H : IN std_logic_vector(7 downto 0);
		clk : IN std_logic;          
		SevenSegControl : OUT std_logic_vector(7 downto 0);
		SevenSegBus : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	signal A, B, C, D, E, F, G, H: std_logic_vector (7 downto 0) := x"FF";

	signal p06left, p06right, p13left, p13right, p06hold, p13hold : std_logic_vector (7 downto 0);

begin

	p06hold <= p06 + x"10";
	p13hold <= p13 + x"10";
	
	p06left (7 downto 4) <= p06hold (7 downto 4);
	p06left (3 downto 0) <= "0000";
	p13left (7 downto 4) <= p13hold (7 downto 4);
	p13left (3 downto 0) <= "0000";

	p06right(3 downto 0) <= p06 (3 downto 0);
	p06right(7 downto 4) <= "0000";

	p13right(3 downto 0) <= p13 (3 downto 0);
	p13right(7 downto 4) <= "0000";

	process (boardswitch, p13, p06) begin 

	if (p13 > x"18") then
		H <= x"41"; -- P1 LOSE
		G <= x"01";
		F <= x"FF";
		E <= x"42";
		D <= x"00";
		C <= x"43";
		B <= x"0E";
		A <= x"FF";
	elsif (p06 > x"18") then
		H <= x"41"; -- P2 LOSE
		G <= x"02";
		F <= x"FF";
		E <= x"42";
		D <= x"00";
		C <= x"43";
		B <= x"0E";
		A <= x"FF";
	else

	if boardswitch = '0' then
		A <= p06right(7 downto 0);
		B <= p06left(7 downto 0);

		C <= p05(7 downto 0);
		D <= p04(7 downto 0);
		E <= p03(7 downto 0);
		F <= p02(7 downto 0);
		G <= p01(7 downto 0);
		H <= p00(7 downto 0);
	else 
		A <= p07(7 downto 0);
		B <= p08(7 downto 0);
		C <= p09(7 downto 0);
		D <= p10(7 downto 0);
		E <= p11(7 downto 0);
		F <= p12(7 downto 0);

		H <= p13right(7 downto 0);
		G <= p13left(7 downto 0);
	end if;
	end if;
	end process;


	inst_display: sevenSegment port map (
		A => A,
		B => B,
		C => C,
		D => D,
		E => E,
		F => F,
		G => G,
		H => H,
		clk => clk,
		SevenSegControl => SevSegControl,
		SevenSegBus => SevSegBus
	);
	
end Behavioral;

