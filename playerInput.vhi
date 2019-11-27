
-- VHDL Instantiation Created from source file playerInput.vhd -- 10:27:54 11/27/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT playerInput
	PORT(
		positionSelect : IN std_logic_vector(5 downto 0);
		currentPlayer : IN std_logic;          
		positionOut : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_playerInput: playerInput PORT MAP(
		positionSelect => ,
		currentPlayer => ,
		positionOut => 
	);


