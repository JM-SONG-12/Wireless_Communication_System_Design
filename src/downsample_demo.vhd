library ieee;
use ieee.std_logic_1164.all;

entity dnsample is
    port(
        nrst : in STD_LOGIC;
        dsel : in STD_LOGIC_VECTOR(1 downto 0);
        clk4x, clk1x : in STD_LOGIC;
        rd4x, id4x : in STD_LOGIC_VECTOR(5 downto 0);
        rd1x, id1x : out STD_LOGIC_VECTOR(5 downto 0)
    );
end dnsample;

architecture arch of dnsample is
    signal rd1, rd2, rd3, rd4xsym : STD_LOGIC_VECTOR(5 downto 0);
    signal id1, id2, id3, id4xsym: STD_LOGIC_VECTOR(5 downto 0);
begin
    -- 1. clk4x 프로세스: 샘플링 데이터 시프트만 담당
    process (nrst, clk4x)
    begin
        if nrst = '0' then
            -- rd1x, id1x, rd4xsym 등 다른 곳에서 쓰는 신호는 여기서 지웁니다!
            rd1 <= "000000"; rd2 <= "000000"; rd3 <= "000000";
            id1 <= "000000"; id2 <= "000000"; id3 <= "000000";
        elsif rising_edge(clk4x) then
            rd1 <= rd4x; rd2 <= rd1; rd3 <= rd2;
            id1 <= id4x; id2 <= id1; id3 <= id2;
        end if;
    end process;

    -- 2. 조합 회로 프로세스: dsel에 따른 데이터 선택 (Mux)
    process(dsel, rd4x, rd1, rd2, rd3, id4x, id1, id2, id3)
    begin
        if dsel = "00" then
            rd4xsym <= rd4x; id4xsym <= id4x;
        elsif dsel = "01" then
            rd4xsym <= rd1;  id4xsym <= id1;
        elsif dsel = "10" then
            rd4xsym <= rd2;  id4xsym <= id2;
        else -- "11" 및 나머지 모든 경우 처리 (Latch 방지)
            rd4xsym <= rd3;  id4xsym <= id3;
        end if;
    end process;

    -- 3. clk1x 프로세스: 최종 출력 동기화
    process(nrst, clk1x)
    begin
        if nrst = '0' then
            rd1x <= "000000";
            id1x <= "000000";
        elsif rising_edge(clk1x) then
            rd1x <= rd4xsym;
            id1x <= id4xsym;         
        end if;
    end process;
end arch;