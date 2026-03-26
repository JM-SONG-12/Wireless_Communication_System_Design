library ieee;
use ieee.std_logic_1164.all;

entity downsample is
    port(
        nrst : in STD_LOGIC;
        clk4x, clk1x : in STD_LOGIC;
        rd4x, id4x : in STD_LOGIC_VECTOR(5 downto 0);
        rd1x, id1x : out STD_LOGIC_VECTOR(5 downto 0)
    );
end downsample;

architecture arch of downsample is
    signal cnt : integer range 0 to 3;
    signal sel : STD_LOGIC;
    signal drdata : STD_LOGIC_VECTOR(5 downto 0);
    signal didata : STD_LOGIC_VECTOR(5 downto 0);
begin
        
    process (nrst, clk4x)
    begin
        if nrst = '0' then
            cnt <= 0;
        elsif rising_edge(clk4x) then
            if cnt = 3 then
                cnt <= 0;
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    sel <= '1' when cnt = 3  else '0';

    process(nrst, clk4x)
    begin
        if nrst = '0' then
            drdata <= "000000";
            didata <= "000000";
        elsif rising_edge(clk4x) then
            if sel = '1' then
                drdata <= rd4x;
                didata <= id4x;
            end if;
        end if;
    end process;

    process(nrst, clk1x)
    begin
        if nrst = '0' then
            rd1x <= "000000";
            id1x <= "000000";
        elsif rising_edge(clk1x) then
            rd1x <= drdata;
            id1x <= didata;         
        end if;
    end process;
end arch;