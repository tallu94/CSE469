library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        shift_type      : in     vl_logic_vector(1 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        shift           : in     vl_logic_vector(4 downto 0);
        b               : out    vl_logic_vector(31 downto 0);
        carry           : out    vl_logic
    );
end shifter;
