
-- VHDL Instantiation Created from source file moduloCalculator.vhd -- 15:53:07 11/20/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT moduloCalculator
	PORT(
		finalstep : IN std_logic_vector(7 downto 0);          
		modulo : OUT std_logic_vector(3 downto 0);
		division : OUT std_logic
		);
	END COMPONENT;

	Inst_moduloCalculator: moduloCalculator PORT MAP(
		finalstep => ,
		modulo => ,
		division => 
	);


