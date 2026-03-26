library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity upsample is
    port (
        nrst : in STD_LOGIC;
        clk4x : in STD_LOGIC;
        clk1x : in STD_LOGIC;
        rdata : in STD_LOGIC_VECTOR(5 downto 0);
        idata : in STD_LOGIC_VECTOR(5 downto 0);
        rd4x, id4x : out STD_LOGIC_VECTOR(5 downto 0)        
    );
end entity;

architecture arch of upsample is

signal cnt : STD_LOGIC_VECTOR(1 downto 0);

begin
    process (nrst, clk4x)
    begin
        if nrst = '0' then
            rd4x <= "000000";
            id4x <= "000000";
            cnt <= "00";
        elsif rising_edge(clk4x) then
            cnt <= cnt + 1;
            if cnt = "10" then
                rd4x <= rdata;
                id4x <= idata;
            else
                rd4x <= "000000";
                id4x <= "000000";
            end if;
        end if;            
    end process;
end arch;