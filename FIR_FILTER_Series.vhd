----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2020 11:14:56 PM
-- Design Name: 
-- Module Name: Series - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Series is
  Port (clk : in STD_LOGIC;
        x : in STD_LOGIC_VECTOR(15 DOWNTO 0);
        y : out STD_LOGIC_VECTOR (36 DOWNTO 0));
end Series;

architecture Behavioral of Series is


component delay is
    Port ( clk : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));          
end component;

signal count: integer:=0;
type coeff is array (19 downto 0) of integer;
signal h : coeff := (others => 0);
signal output : SIGNED (15 downto 0) := (others => '0');
signal mult : integer;
signal tmp_reg : SIGNED (36 downto 0) := (others => '0');
signal add : SIGNED (36 downto 0);
signal coeff_sig : integer;
signal connections0,connections1,connections2,connections3,connections4,connections5,connections6,connections7,connections8,connections9,connections10,connections11,connections12,connections13,connections14,connections15,connections16,connections17,connections18,connections19 : STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');

begin

block_19: delay port map(clk => clk, x => x, y=> connections19);
block_18: delay port map(clk => clk, x => connections19, y=> connections18);
block_17: delay port map(clk => clk, x => connections18, y=> connections17);
block_16: delay port map(clk => clk, x => connections17, y=> connections16);
block_15: delay port map(clk => clk, x => connections16, y=> connections15);
block_14: delay port map(clk => clk, x => connections15, y=> connections14);
block_13: delay port map(clk => clk, x => connections14, y=> connections13);
block_12: delay port map(clk => clk, x => connections13, y=> connections12);
block_11: delay port map(clk => clk, x => connections12, y=> connections11);
block_10: delay port map(clk => clk, x => connections11, y=> connections10);
block_9: delay port map(clk => clk, x => connections10, y=> connections9);
block_8: delay port map(clk => clk, x => connections9, y=> connections8);
block_7: delay port map(clk => clk, x => connections8, y=> connections7);
block_6: delay port map(clk => clk, x => connections7, y=> connections6);
block_5: delay port map(clk => clk, x => connections6, y=> connections5);
block_4: delay port map(clk => clk, x => connections5, y=> connections4);
block_3: delay port map(clk => clk, x => connections4, y=> connections3);
block_2: delay port map(clk => clk, x => connections3, y=> connections2);
block_1: delay port map(clk => clk, x => connections2, y=> connections1);
block_0: delay port map(clk => clk, x => connections1, y=> connections0);

h(0) <= 0;
h(1) <= 81;
h(2) <= 0;
h(3) <= -280;
h(4) <= 0;
h(5) <= 797;
h(6) <= 0;
h(7) <= -2014;
h(8) <= 0;
h(9) <= 7324;
h(10) <= 11776;
h(11) <= 7324;
h(12) <= 0;
h(13) <= -2014;
h(14) <= 0;
h(15) <= 797;
h(16) <= 0;
h(17) <= -280;
h(18) <= 0;
h(19) <= 81;

--counter
counter: process (count, clk)
begin
    if (rising_edge(clk)) then
        if (count > 18) then
            count <= 0;
        else
            count <= count + 1;
        end if;
    end if;
end process counter;

--output logic
with count select
      output <= signed(x) when 0,
                 signed(connections0) when 1,
                 signed(connections1) when 2,
                 signed(connections2) when 3,
                 signed(connections3) when 4,
                 signed(connections4) when 5,
                 signed(connections5) when 6,
                 signed(connections6) when 7,
                 signed(connections7) when 8,
                 signed(connections8) when 9,
                 signed(connections9) when 10,
                 signed(connections10) when  11,
                 signed(connections11) when 12,
                 signed(connections12) when 13,
                 signed(connections13) when 14,
                 signed(connections14) when 15,
                 signed(connections15) when 16,
                 signed(connections16) when 17,
                 signed(connections17) when 18,
                 signed(connections18) when 19,
                 signed(x) when others;

coeff_sig <= h(count);
mult <= to_integer(output) * coeff_sig;
add <= mult + tmp_reg;
y <= STD_LOGIC_VECTOR(add) when count > 18;--/32767);

process (clk)
begin
if (rising_edge(clk)) then
        tmp_reg <= add;
    end if;
end process;

end Behavioral;
