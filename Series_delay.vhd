----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2020 11:12:49 AM
-- Design Name: 
-- Module Name: delay - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity delay is
    Port ( clk : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));  
end delay;

architecture Behavioral of delay is

signal temp: std_logic_vector (15 downto 0) := (others => '0');

begin
process (clk)
    begin
    if (rising_edge(clk)) then
            for i in 0 to 14 loop
                temp(i+1) <= temp(i);
                end loop;
                temp <= x;
     end if;
end process;
y <= temp; 



end Behavioral;
