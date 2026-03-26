<<<<<<< HEAD
library IEEE;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity clkgen is
    port (
        nrst : in std_logic;
        mclk : in std_logic;
        clk8x : out std_logic;
        clk4x : out std_logic;
        clk2x : out std_logic;
        clk1x : out std_logic
    );
end clkgen;


architecture behavior of clkgen is
signal count : UNSIGNED(3 downto 0) := (others => '0');

begin
    process(nrst, mclk)
    begin
        if nrst = '0' then
            count <= (others => '0');
            clk1x <= '0';
            clk2x <= '0';
            clk4x <= '0';
            clk8x <= '0';
        elsif rising_edge(mclk) then
            count <= count + 1;

            clk8x <= count(0);
            clk4x <= count(1);
            clk2x <= count(2);
            clk1x <= count(3);
        end if;
    end process;    

=======
library IEEE;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity clkgen is
    port (
        nrst : in std_logic;
        mclk : in std_logic;
        clk8x : out std_logic;
        clk4x : out std_logic;
        clk2x : out std_logic;
        clk1x : out std_logic
    );
end clkgen;


architecture behavior of clkgen is
signal count : UNSIGNED(3 downto 0) := (others => '0');

begin
    process(nrst, mclk)
    begin
        if nrst = '0' then
            count <= (others => '0');
            clk1x <= '0';
            clk2x <= '0';
            clk4x <= '0';
            clk8x <= '0';
        elsif rising_edge(mclk) then
            count <= count + 1;

            clk8x <= count(0);
            clk4x <= count(1);
            clk2x <= count(2);
            clk1x <= count(3);
        end if;
    end process;    

>>>>>>> 8eba962 (first upload)
end architecture;