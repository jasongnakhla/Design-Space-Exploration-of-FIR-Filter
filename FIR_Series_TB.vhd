----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2020 03:41:28 PM
-- Design Name: 
-- Module Name: FIR_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIR_TB is
--  Port ( );
end FIR_TB;

architecture Behavioral of FIR_TB is

component Series is
  Port (clk : in STD_LOGIC;
        x : in STD_LOGIC_VECTOR(15 DOWNTO 0);
        y : out STD_LOGIC_VECTOR (36 DOWNTO 0));
end component;

signal clk_tb: STD_LOGIC;
signal x_tb: STD_LOGIC_VECTOR(15 downto 0);
signal y_tb: STD_LOGIC_VECTOR(36 downto 0);
constant cp1: time:=1000ns;
constant cp5: time:=200ns;


begin

uut: series port map(clk => clk_tb, x => x_tb, y => y_tb);

--clock
process
begin
clk_tb <= '0';
wait for cp5/2;
clk_tb <= '1';
wait for cp5/2;
end process;

process
    begin
--        x_tb <= std_logic_vector(to_signed(0,16));
--    wait for 2*cp1;
--    x_tb <= std_logic_vector(to_signed(32767,16));
--    wait for cp1;

        x_tb <= std_logic_vector(to_signed(0,16));
        wait for cp1;
        x_tb <= std_logic_vector(to_signed(62328,16));
        wait for cp1;
        x_tb <= std_logic_vector(to_signed(38521,16));
        wait for cp1;
        x_tb <= std_logic_vector(to_signed(-38521,16));
        wait for cp1;
        x_tb <= std_logic_vector(to_signed(-62328,16));
        wait for cp1;
end process;



end Behavioral;
