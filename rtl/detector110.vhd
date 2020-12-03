library ieee;
use ieee.std_logic_1164.all;

entity detector110 is
port (
	a, clk, reset: in std_logic;
	w: out std_logic
);
end entity;

architecture procedural of detector110 is

-- Dinh nghia type cua state
type state is (S0,S1,S2,S3);
signal current: state := S0;

begin

process (clk) begin
	if (clk = '0' and clk'event) then
		if reset = '1' then
			current <= S0;
		else
			case current is
				when S0 => 
					if a = '1' then current <= S1;
					else current <= S0; end if;
				when S1 =>
					if a = '1' then current <= S2;
					else current <= S0; end if;
				when S2 => 
					if a = '1' then current <= S2;
					else current <= S3; end if;
				when S3 =>
					if a = '1' then current <= S1;
					else current <= S0; end if;
				when others => current <= S0;
			end case;
		end if;

	end if;
end process;

w <= '1' when current = S3 else '0';

end architecture procedural;