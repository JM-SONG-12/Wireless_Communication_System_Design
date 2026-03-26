<<<<<<< HEAD
library IEEE;
use ieee.std_logic_1164.all;

entity P2S is
    port (
        nrst : in std_logic;
        sclk : in std_logic;
        inbits : in STD_LOGIC_VECTOR(1 downto 0);
        outbit : out STD_LOGIC
    );
end P2S;

architecture arch of P2S is
signal counter : STD_LOGIC;

begin
    process (nrst, sclk)
    begin
    if nrst = '0' then
        counter <= '0';
    elsif rising_edge(sclk) then
            counter <= not counter;
        end if;
    end process;

    process(nrst, sclk)
    begin
        if nrst = '0' then
            outbit <= '0';
        elsif rising_edge(sclk) then
            if counter = '1' then
                outbit <= inbits(1);
            else 
                outbit <= inbits(0);
            end if;
        end if;
    end process;
=======
library IEEE;
use ieee.std_logic_1164.all;

entity P2S is
    port (
        nrst : in std_logic;
        sclk : in std_logic;
        inbits : in STD_LOGIC_VECTOR(1 downto 0);
        outbit : out STD_LOGIC
    );
end P2S;

architecture arch of P2S is
signal counter : STD_LOGIC;

begin
    process (nrst, sclk)
    begin
    if nrst = '0' then
        counter <= '0';
    elsif rising_edge(sclk) then
            counter <= not counter;
        end if;
    end process;

    process(nrst, sclk)
    begin
        if nrst = '0' then
            outbit <= '0';
        elsif rising_edge(sclk) then
            if counter = '1' then
                outbit <= inbits(1);
            else 
                outbit <= inbits(0);
            end if;
        end if;
    end process;
>>>>>>> 8eba962 (first upload)
end arch;