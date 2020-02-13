library verilog;
use verilog.vl_types.all;
entity find_next_pc is
    generic(
        branch          : vl_logic_vector(0 to 10) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        branchLink      : vl_logic_vector(0 to 10) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instruction     : in     vl_logic_vector(31 downto 0);
        program_counter : in     vl_logic_vector(31 downto 0);
        program_counter_next: out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of branch : constant is 1;
    attribute mti_svvh_generic_type of branchLink : constant is 1;
end find_next_pc;
