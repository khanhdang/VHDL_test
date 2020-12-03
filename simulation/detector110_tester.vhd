library ieee;
use ieee.std_logic_1164.all;

ENTITY detector110_tester IS END ENTITY;
--
ARCHITECTURE timed OF detector110_tester IS
   SIGNAL aa, clock, rst, ww : std_logic := '0'; 
BEGIN
   UUT1: ENTITY WORK.detector110 (procedural) 
         PORT MAP (
             a => aa, 
             clk => clock, 
             reset => rst, 
             w => ww);
   rst <= '1' AFTER 31 NS, '0' AFTER 54 NS;
   clock <= NOT clock AFTER 7 NS WHEN NOW<=165 NS ELSE '0';
   PROCESS BEGIN
      WAIT FOR 23 NS; aa <= '1';
      WAIT FOR 21 NS; aa <= '0';
      WAIT FOR 19 NS; aa <= '1';
      WAIT FOR 31 NS; aa <= '0';
      WAIT;
   END PROCESS;
   PROCESS (ww) BEGIN
      REPORT "Signal w changed to:"& std_logic'IMAGE(ww)& 
             " at " & TIME'IMAGE(NOW) 
      SEVERITY NOTE;
   END PROCESS;
END ARCHITECTURE timed;
