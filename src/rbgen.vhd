<<<<<<< HEAD
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rbgen is
    Port (  nrst : in std_logic;
            clk : in std_logic;
        
            outbit : out std_logic);
end rbgen;

architecture arch of rbgen is

signal d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, fb : STD_LOGIC;

begin
    fb <= d5 xor d7 xor d10 xor d11 ;

    process(nrst, clk)
    begin
        if nrst = '0' then
            d0 <= '1';
            d1 <= '0';
            d2 <= '1';
            d3 <= '0';
            d4 <= '0';
            d5 <= '1';
            d6 <= '0';
            d7 <= '0';
            d8 <= '0';
            d9 <= '0';
            d10 <= '0';
            d11 <= '1';
        elsif rising_edge(clk) then
            d0 <= fb;
            d1 <= d0;
            d2 <= d1;
            d3 <= d2;
            d4 <= d3;
            d5 <= d4;
            d6 <= d5;
            d7 <= d6;
            d8 <= d7;
            d9 <= d8;
            d10 <= d9;
            d11 <= d10;
        end if;     
    end process;

    outbit <= d11;
    

=======
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rbgen is
    Port (  nrst : in std_logic;
            clk : in std_logic;
        
            outbit : out std_logic);
end rbgen;

architecture arch of rbgen is

signal d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, fb : STD_LOGIC;

begin
    fb <= d5 xor d7 xor d10 xor d11 ;

    process(nrst, clk)
    begin
        if nrst = '0' then
            d0 <= '1';
            d1 <= '0';
            d2 <= '1';
            d3 <= '0';
            d4 <= '0';
            d5 <= '1';
            d6 <= '0';
            d7 <= '0';
            d8 <= '0';
            d9 <= '0';
            d10 <= '0';
            d11 <= '1';
        elsif rising_edge(clk) then
            d0 <= fb;
            d1 <= d0;
            d2 <= d1;
            d3 <= d2;
            d4 <= d3;
            d5 <= d4;
            d6 <= d5;
            d7 <= d6;
            d8 <= d7;
            d9 <= d8;
            d10 <= d9;
            d11 <= d10;
        end if;     
    end process;

    outbit <= d11;
    

>>>>>>> 8eba962 (first upload)
end arch;