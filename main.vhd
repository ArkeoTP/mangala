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
        playerSelection: in std_logic_vector (3 downto 0)
        -- boardSwitch: in std_logic
		
    );
end main;

architecture Behavioral of main is

    COMPONENT DFF8b
	PORT(
		Ibits : IN std_logic_vector(7 downto 0);
		clk : IN std_logic;          
		Obits : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

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

COMPONENT DisplayModule
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
		clk : IN std_logic       
		);
	END COMPONENT;

signal p00, p01, p02, p03, p04, p05, 
    p07, p08, p09, p10, p11, p12: std_logic_vector (7 downto 0);
signal p06, p13 : std_logic_vector (7 downto 0);
signal currentplayer : std_logic := '0';

signal p00next, p01next, p02next, p03next, p04next, p05next, p07next,
       p08next, p09next, p10next, p11next, p12next : std_logic_vector (7 downto 0);
signal p06next, p13next : std_logic_vector (7 downto 0);

signal p00temp, p01temp, p02temp, p03temp, p04temp, p05temp, p06temp,
       p07temp, p08temp, p09temp, p10temp, p11temp, p12temp, p13temp: std_logic_vector (7 downto 0);

signal p00out, p01out, p02out, p03out, p04out, p05out, p06out, -- send to display
	   p07out, p08out, p09out, p10out, p11out, p12out, p13out: std_logic_vector (7 downto 0);

begin

    reg_p00: DFF8b PORT MAP(
		Ibits => p00next,
		Obits => p00temp,
		clk => turnClock 
	);
    p00 <= p00temp;
	p00out <= p00temp;
	
	reg_p01: DFF8b PORT MAP(
		Ibits => p01next,
		Obits => p01temp,
		clk => turnClock 
	);
    p01 <= p01temp;
	p01out <= p01temp;

	reg_p02: DFF8b PORT MAP(
		Ibits => p02next,
		Obits => p02temp,
		clk => turnClock 
	);
    p02 <= p02temp;
	p02out <= p02temp;

	reg_p03: DFF8b PORT MAP(
		Ibits => p03next,
		Obits => p03temp,
		clk => turnClock 
	);
    p03 <= p03temp;
	p03out <= p03temp;

	reg_p04: DFF8b PORT MAP(
		Ibits => p04next,
		Obits => p04temp,
		clk => turnClock 
	);
    p04 <= p04temp;
	p04out <= p04temp;

	reg_p05: DFF8b PORT MAP(
		Ibits => p05next,
		Obits => p05temp,
		clk => turnClock 
	);
    p05 <= p05temp;
	p05out <= p05temp;

	reg_p06: DFF8b PORT MAP(
		Ibits => p06next,
		Obits => p06temp,
		clk => turnClock 
	);
    p06 <= p06temp;
	p06out <= p06temp;

	--

	reg_p07: DFF8b PORT MAP(
		Ibits => p07next,
		Obits => p07temp,
		clk => turnClock 
	);
    p07 <= p07temp;
	p07out <= p07temp;

	reg_p08: DFF8b PORT MAP(
		Ibits => p08next,
		Obits => p08temp,
		clk => turnClock 
	);
    p08 <= p08temp;
	p08out <= p08temp;

	reg_p09: DFF8b PORT MAP(
		Ibits => p09next,
		Obits => p09temp,
		clk => turnClock 
	);
    p09 <= p09temp;
	p09out <= p09temp;

	reg_p10: DFF8b PORT MAP(
		Ibits => p10next,
		Obits => p10temp,
		clk => turnClock 
	);
    p10 <= p10temp;
	p10out <= p10temp;

	reg_p11: DFF8b PORT MAP(
		Ibits => p11next,
		Obits => p11temp,
		clk => turnClock 
	);
    p11 <= p11temp;
	p11out <= p11temp;

	reg_p12: DFF8b PORT MAP(
		Ibits => p12next,
		Obits => p12temp,
		clk => turnClock 
	);
    p12 <= p12temp;
	p12out <= p12temp;

	reg_p13: DFF8b PORT MAP(
		Ibits => p13next,
		Obits => p13temp,
		clk => turnClock 
	);
    p13 <= p13temp;
	p13out <= p13temp;

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
    
Update: Process(turnClock)
begin
    if (rising_edge(turnClock)) then 
        currentplayer <= (not currentplayer);
    end if;
end process;

Inst_DisplayModule: DisplayModule PORT MAP(
		p00 => p00out,
		p01 => p01out,
		p02 => p02out,
		p03 => p03out,
		p04 => p04out,
		p05 => p05out,
		p06 => p06out,
		p07 => p07out,
		p08 => p08out,
		p09 => p09out,
		p10 => p10out,
		p11 => p11out,
		p12 => p12out,
		p13 => p13out,
		clk => turnClock
	);

end Behavioral;

