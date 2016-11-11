-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_DataMemory IS
END TB_DataMemory;
 
ARCHITECTURE behavior OF TB_DataMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         reset : IN  std_logic;
         c_Rd : IN  std_logic_vector(31 downto 0);
         address : IN  std_logic_vector(4 downto 0);
         WE : IN  std_logic;
         data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal c_Rd : std_logic_vector(31 downto 0) := (others => '0');
   signal address : std_logic_vector(4 downto 0) := (others => '0');
   signal WE : std_logic := '0';

 	--Outputs
   signal data : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          reset => reset,
          c_Rd => c_Rd,
          address => address,
          WE => WE,
          data => data
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
		reset <= '1';
		c_Rd <= "11111111111111111111111111111111";
		address <= "00000";
		WE <= '1';
      wait for 100 ns;

		reset <= '0';
		c_Rd <= "11111111111111111111111111111111";
		address <= "00000";
		WE <= '1';
      wait for 100 ns;

		reset <= '0';
		c_Rd <= "11111111111111111111111111111111";
		address <= "00000";
		WE <= '1';
      wait for 100 ns;

		reset <= '1';
		c_Rd <= "11111111111111111111111111111111";
		address <= "00000";
		WE <= '1';
      wait for 100 ns;

		
		

      -- insert stimulus here 

      wait;
   end process;

END;
