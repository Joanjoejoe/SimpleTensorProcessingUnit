LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

entity tb_menmory is
    port (clock, aclr, rden, wren: in std_logic;
          address : in std_logic_vector(1 downto 0);
          W_data : in std_logic_vector(23 downto 0);
          a0_data, a1_data, a2_data : in std_logic_vector (7 downto 0);
          W_q : out unsigned (23 downto 0);
          a0_out, a1_out, a2_out: out unsigned (7 downto 0)
    ) ;
  end tb_menmory;

  architecture test of tb_menmory is
  component menmory is
    port (clock, aclr, rden, wren: in std_logic;
          address : in std_logic_vector(1 downto 0);
          W_data : in std_logic_vector(23 downto 0);
          a0_data, a1_data, a2_data : in std_logic_vector (7 downto 0);
          W_q : out unsigned (23 downto 0);
          a0_out, a1_out, a2_out: out unsigned (7 downto 0)
    ) ;
    end component;

    signal addressig : std_logic_vector(1 downto 0);
    signal wrisig, readsig : std_logic;
    signal a0, a1, a2 : std_logic_vector (7 downto 0);
    signal w : std_logic_vector(23 downto 0);
    signal aclrsig : std_logic;
    signal clocksig : std_logic := '1';
    constant period : time := 13 ns;
    signal clear : std_logic;
  
  begin
  DUT : menmory 
  port map(clock => clocksig, aclr => clear, rden => readsig, wren => wrisig,
            address => addressig, W_data => w, a0_data => a0, a1_data => a1,
            a2_data => a2);
    clocksig <= NOT clocksig after period;

    process is 
    begin
        clear <= '0';
        addressig <= "00";
        readsig <= '0';
        wrisig <= '0';
        w <= "000000000000000000000001";
        a0 <= "00000001";
        a1 <= "00000011";
        a2 <= "00000111";
        wait for 35 ns;

        addressig <= "00";
        readsig <= '0';
        wrisig <= '1';
        w <= "000000000000000000000001";
        a0 <= "00000001";
        a1 <= "00000011";
        a2 <= "00000111";
        wait for 35 ns;

        addressig <= "01";
        readsig <= '0';
        wrisig <= '1';
        w <= "000100010001000100010001";
        a0 <= "10000001";
        a1 <= "10000011";
        a2 <= "10000111";
        wait for 35 ns;

        addressig <= "10";
        readsig <= '0';
        wrisig <= '1';
        w <= "100110011001100110011001";
        a0 <= "11110001";
        a1 <= "11110011";
        a2 <= "11110111";
        wait for 35 ns;

        addressig <= "11";
        readsig <= '0';
        wrisig <= '1';
        w <= "000000000000000000000000";
        a0 <= "00000000";
        a1 <= "00000000";
        a2 <= "00000000";
        wait for 35 ns;

        addressig <= "00";
        readsig <= '1';
        wrisig <= '0';
        wait for 35 ns;

        addressig <= "01";
        readsig <= '1';
        wrisig <= '0';
        wait for 35 ns;

        addressig <= "10";
        readsig <= '1';
        wrisig <= '0';
        wait for 35 ns;

        addressig <= "11";
        readsig <= '1';
        wrisig <= '0';
        wait for 35 ns;

        addressig <= "10";
        readsig <= '1';
        wrisig <= '0';
        wait for 35 ns;
        
        wait for 100 ns ;

        end process;
  end test ; -- test