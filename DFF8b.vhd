----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:20:02 11/21/2019 
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

entity DFF8b is
    Port ( Ibits : in  STD_LOGIC_VECTOR (7 downto 0);
           Obits : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in std_logic);
end DFF8b;

architecture Behavioral of DFF8b is

    COMPONENT DFF1b
	PORT(
		D : IN std_logic;
		clk : IN std_logic;          
		Q : OUT std_logic
		);
    END COMPONENT;

    signal temp: std_logic_vector (7 downto 0);

begin

    Inst_DFF1b_7: DFF1b PORT MAP(
		D => Ibits(7),
		clk => clk ,
		Q => temp(7)
    );
    
    Inst_DFF1b_6: DFF1b PORT MAP(
		D => Ibits(6),
		clk => clk,
		Q => temp(6)
    );
    
    Inst_DFF1b_5: DFF1b PORT MAP(
		D => Ibits(5),
		clk => clk,
		Q => temp(5)
    );
    
    Inst_DFF1b_4: DFF1b PORT MAP(
		D => Ibits(4),
		clk => clk,
		Q => temp(4)
	);

    Inst_DFF1b_3: DFF1b PORT MAP(
		D => Ibits(3),
		clk => clk ,
		Q => temp(3)
    );
    
    Inst_DFF1b_2: DFF1b PORT MAP(
		D => Ibits(2),
		clk => clk,
		Q => temp(2)
    );
    
    Inst_DFF1b_1: DFF1b PORT MAP(
		D => Ibits(1),
		clk => clk,
		Q => temp(1)
    );
    
    Inst_DFF1b_0: DFF1b PORT MAP(
		D => Ibits(0),
		clk => clk,
		Q => temp(0)
	);

    Obits <= temp;

end Behavioral;

