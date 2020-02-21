library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        ALUCtl          : in     vl_logic_vector(10 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        I               : in     vl_logic_vector(7 downto 0);
        ALUOut          : out    vl_logic_vector(31 downto 0);
        cpsr            : out    vl_logic_vector(31 downto 0);
        cpsr_enable     : in     vl_logic
    );
end alu;
