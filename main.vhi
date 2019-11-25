
-- VHDL Instantiation Created from source file main.vhd -- 13:16:11 11/21/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT register8b
	PORT(
		Hold : IN std_logic_vector  (7 downto 0);
		Show : out std_logic_vector (7 downto 0);
		Clock : IN std_logic;       
		);
	END COMPONENT;

	Inst_register8b: register8b PORT MAP(
		Hold => ,
		Show => ,
		Clock => 
	);


