--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:57 10/07/2016
-- Design Name:   
-- Module Name:   /home/anderson/nextProgramCounter/TB_nextProgramCounter.vhd
-- Project Name:  nextProgramCounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nextProgramCounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_nextProgramCounter IS
END TB_nextProgramCounter;
 
ARCHITECTURE behavior OF TB_nextProgramCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nextProgramCounter
    PORT(
         InAddress : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         Reset : IN  std_logic;
         outAddress : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal InAddress : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal outAddress : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nextProgramCounter PORT MAP (
          InAddress => InAddress,
          clk => clk,
          Reset => Reset,
          outAddress => outAddress
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      InAddress <= "10100000000000000000000000000000";
		Reset <= '0';
      wait for 40 ns;	

      InAddress <= "10100000000000000000000000000000";
		Reset <= '1';
      wait for 40 ns;	
		
      wait;
   end process;

END;
