--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:10:53 10/19/2016
-- Design Name:   
-- Module Name:   /home/anderson/WindowsManager/TB_WindowsManager.vhd
-- Project Name:  WindowsManager
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WindowsManager
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
 
ENTITY TB_WindowsManager IS
END TB_WindowsManager;
 
ARCHITECTURE behavior OF TB_WindowsManager IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WindowsManager
    PORT(
         cwp : IN  std_logic;
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         ncwp : OUT  std_logic_vector(1 downto 0);
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0);
         nrd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cwp : std_logic := '0';
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ncwp : std_logic_vector(1 downto 0);
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   signal nrd : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager PORT MAP (
          cwp => cwp,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          ncwp => ncwp,
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
			cwp <= '1';
			rs1 <= "10001";
			rs2 <= "10100";
			rd <= "00001";
			op <= "10";
			op3 <= "111100";
			wait for 40 ns;
			
			cwp <= '0';
			rs1 <= "10001";
			rs2 <= "10100";
			rd <= "00001";
			op <= "10";
			op3 <= "111101";
			wait for 40 ns;
		
			
			cwp <= '1';
			rs1 <= "10001";
			rs2 <= "10100";
			rd <= "00001";
			op <= "10";
			op3 <= "000000";
			wait for 80 ns; 
			
			
      wait;
   end process;

END;
