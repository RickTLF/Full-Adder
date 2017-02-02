LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY full_adder_tb IS
END full_adder_tb;
ARCHITECTURE behavioral OF full_adder_tb IS 

   COMPONENT full_adder
	Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c_in : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
   END COMPONENT;

   SIGNAL a	     :	STD_LOGIC;
   SIGNAL b	     :	STD_LOGIC;
   SIGNAL c_in	 :	STD_LOGIC;
   SIGNAL s	     :  STD_LOGIC;
   SIGNAL c_out  :	STD_LOGIC;
	--Signal Test_case: STD_LOGIC_VECTOR (2 downto 0):= (others =>'0');
	signal OK: boolean := true;

BEGIN

   UUT: full_adder PORT MAP(
		a => a, 
		b => b, 
		c_in => c_in,
		s => s, 
		c_out => c_out
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
			variable s_t	    :	STD_LOGIC;
			variable c_out_t	:	STD_LOGIC;
			variable a          : integer;
			variable b          : integer;
			variable sum        : integer;

	BEGIN
		c_in <= '0'; -- C_in is ignored in this test
		for I in 0 to 3 loop
			
			Test_case <= Std_logic_vector(to_unsigned(I,2));
			a <= Test_case(0);
			b <= Test_case(1);
			
			a := To_integer(unsigned(test_case(1 downto 0)));
			b := To_integer(unsigned(test_case(3 downto 2)));
			sum := a+b;
			
			s_t := to_unsigned(sum,2)(0);
			c_out_t := to_unsigned(sum,2)(1);
			
			wait for 5 ns;
				
			If s /= s_t then
				OK <= false;
			end if;
			
			if c_out /= c_out_t then
				OK <= false;
			end if;
			
			wait for 5 ns;
			
		end loop;
		
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;