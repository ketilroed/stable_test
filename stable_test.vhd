library ieee;
use ieee.std_logic_1164.all;


entity stable_test is
end entity;

architecture behave of stable_test is

  signal test : std_logic := '0';
  signal test_stable : boolean := false;

begin
  

  test_stable <= test'stable(50 ns);

  process
  begin
    test <= '0';
    wait for 10 ns;
    test <= '1';
    wait for 10 ns;
    test <= '0';
    wait for 10 ns;
    test <= '0';
    for i in 0 to 6 loop
      wait for 10 ns;
      assert not (test'stable(50 ns)) report "Assert from process!";
    end loop;
    wait;
  end process;




end architecture behave;
