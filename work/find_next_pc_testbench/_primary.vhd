library verilog;
use verilog.vl_types.all;
entity find_next_pc_testbench is
    generic(
        CLOCK_PERIOD    : integer := 100
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_PERIOD : constant is 1;
end find_next_pc_testbench;
