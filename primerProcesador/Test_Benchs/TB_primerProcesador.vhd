--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:54:36 10/07/2016
-- Design Name:   
-- Module Name:   /home/anderson/primerProcesador/TB_primerProcesador.vhd
-- Project Name:  primerProcesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: primerProcesador
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
 
ENTITY TB_primerProcesador IS
END TB_primerProcesador;
 
ARCHITECTURE behavior OF TB_primerProcesador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT primerProcesador
    PORT(
         clkP : IN  std_logic;
         ResetP : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clkP : std_logic := '0';
   signal ResetP : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkP_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: primerProcesador PORT MAP (
          clkP => clkP,
          ResetP => ResetP,
          AluResult => AluResult
        );

   -- Clock process definitions
   clkP_process :process
   begin
		clkP <= '0';
		wait for clkP_period/2;
		clkP <= '1';
		wait for clkP_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		 
      ResetP <= '0';
		wait for 10 ms;
		
		
   end process;

END;
