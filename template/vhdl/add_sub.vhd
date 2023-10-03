library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add_sub is
    port(
        a        : in  std_logic_vector(31 downto 0);
        b        : in  std_logic_vector(31 downto 0);
        sub_mode : in  std_logic;
        carry    : out std_logic;
        zero     : out std_logic;
        r        : out std_logic_vector(31 downto 0)
    );
   signal s_b : signed(32 downto 0);
    signal sum : std_logic_vector(32 downto 0);
    signal sum_s : signed(32 downto 0);
    signal a_s : signed(32 downto 0);




end add_sub;

architecture synth of add_sub is
begin
    s_b <= resize(signed(b), 33);
    a_s <= resize(signed(a), 33);


    sum_s <= signed(s_b xor (others => '1')) + a_s  + 1 when sub_mode = '1' 
        else a_s + signed(s_b);


    r <= std_logic_vector(sum_s(31 downto 0));
    zero <= '1' when sum_s = 0;
    carry <= sum_s(32);



end synth;