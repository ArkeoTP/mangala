----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:53 11/18/2019 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
    Port ( 
        turnClock: in std_logic;
        resetButton: in std_logic;
        playerSelection: in std_logic_vector (3 downto 0);
        boardSwitch: in std_logic
    );
end main;

architecture Behavioral of main is

COMPONENT gamelogic
	PORT(
		p00 : IN std_logic_vector(7 downto 0);
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
		playerSelection : IN std_logic_vector(3 downto 0);          
		p00next : OUT std_logic_vector(7 downto 0);
		p01next : OUT std_logic_vector(7 downto 0);
		p02next : OUT std_logic_vector(7 downto 0);
		p03next : OUT std_logic_vector(7 downto 0);
		p04next : OUT std_logic_vector(7 downto 0);
		p05next : OUT std_logic_vector(7 downto 0);
		p06next : OUT std_logic_vector(7 downto 0);
		p07next : OUT std_logic_vector(7 downto 0);
		p08next : OUT std_logic_vector(7 downto 0);
		p09next : OUT std_logic_vector(7 downto 0);
		p10next : OUT std_logic_vector(7 downto 0);
		p11next : OUT std_logic_vector(7 downto 0);
		p12next : OUT std_logic_vector(7 downto 0);
		p13next : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

signal p00, p01, p02, p03, p04, p05, 
    p07, p08, p09, p10, p11, p12: std_logic_vector (7 downto 0) := x"04";
signal p06, p13 : std_logic_vector (7 downto 0) := x"00";
signal currentplayer : std_logic := '0';

signal p00next, p01next, p02next, p03next, p04next, p05next, p06next, p07next,
       p08next, p09next, p10next, p11next, p12next, p13next : std_logic_vector (7 downto 0);

begin

Initialize: Process(resetButton)
begin
    if (rising_edge(resetButton)) then
        p00 <= x"04"; p01 <= x"04"; p02 <= x"04"; p03 <= x"04"; p04 <= x"04"; p05 <= x"04"; 
        p07 <= x"04"; p08 <= x"04"; p09 <= x"04"; p10 <= x"04"; p11 <= x"04"; p12 <= x"04";
        p06 <= x"00"; p13 <= x"00";
        currentplayer <= '0';
    end if;
end process;
    
Update: Process(turnClock)
begin
    if (rising_edge(turnClock)) then 
        p00 <= p00next;
        p01 <= p01next;
        p02 <= p02next;
        p03 <= p03next;
        p04 <= p04next;
        p05 <= p05next;

        p06 <= p06next;

        p07 <= p07next;
        p08 <= p08next;
        p09 <= p09next;
        p10 <= p10next;
        p11 <= p11next;
        p12 <= p12next;

        p13 <= p13next;

        currentplayer <= (not currentplayer);
    end if;
end process;

Inst_gamelogic: gamelogic PORT MAP(
		p00 => p00,
		p01 => p01,
		p02 => p02,
		p03 => p03,
		p04 => p04,
		p05 => p05,
		p06 => p06,
		p07 => p07,
		p08 => p08,
		p09 => p09,
		p10 => p10,
		p11 => p11,
		p12 => p12,
		p13 => p13,
		p00next => p00next,
		p01next => p01next,
		p02next => p02next,
		p03next => p03next,
		p04next => p04next,
		p05next => p05next,
		p06next => p06next,
		p07next => p07next,
		p08next => p08next,
		p09next => p09next,
		p10next => p10next,
		p11next => p11next,
		p12next => p12next,
		p13next => p13next,
		playerSelection => playerSelection
	);

end Behavioral;

