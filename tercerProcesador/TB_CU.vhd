--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:07:44 11/10/2016
-- Design Name:   
-- Module Name:   /home/anderson/CU/TB_CU.vhd
-- Project Name:  CU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CU
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
 
ENTITY TB_CU IS
END TB_CU;
 
ARCHITECTURE behavior OF TB_CU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         wrenmem : OUT  std_logic;
         rfsource : OUT  std_logic_vector(1 downto 0);
         rfdest : OUT  std_logic;
         pcsource : OUT  std_logic_vector(1 downto 0);
         we : OUT  std_logic;
         Aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal wrenmem : std_logic;
   signal rfsource : std_logic_vector(1 downto 0);
   signal rfdest : std_logic;
   signal pcsource : std_logic_vector(1 downto 0);
   signal we : std_logic;
   signal Aluop : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          Op => Op,
          Op3 => Op3,
          icc => icc,
          cond => cond,
          wrenmem => wrenmem,
          rfsource => rfsource,
          rfdest => rfdest,
          pcsource => pcsource,
          we => we,
          Aluop => Aluop
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- BRANCH ALWAYS
		op <= "00";
		op3 <= "000010"; 
		icc <= "1000";
		cond <= "1000";
     

      -- insert stimulus here 

      wait;
   end process;

END;
