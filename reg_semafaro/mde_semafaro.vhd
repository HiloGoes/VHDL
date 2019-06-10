library ieee ;
use ieee . std_logic_1164 .all;

entity mde_b is
port ( clk , r , w: in std_logic ;
--z : out std_logic 
vd_C, am_C, vm_C, vd_M, am_M, vm_M: out std_logic);

end mde_b;

architecture ckt of mde_b is
                    -- a, b, c 
type state_type is (espera, am_inter, vd_vm , am_vm , vm_vd, vm_am);

signal y_present , y_next : state_type ;
begin
process (w , y_present )
begin

case y_present is

when espera =>
if w = '0' then y_next <= am_inter;
else y_next <= vd_vm; end if;

when am_inter =>
if w = '0' then y_next <= am_inter;
else y_next <= espera; end if;

when vd_vm =>
if w = '0' then y_next <= vd_vm;
else y_next <= am_vm; end if;

when am_vm =>

if w = '0' then y_next <= am_vm;
else y_next <= vm_vd; end if;

when vm_vd =>

if w = '0' then y_next <= vm_vd;
else y_next <= vm_am; end if;

when vm_am =>

if w = '0' then y_next <= vm_am;
else y_next <= vd_vm; end if;

end case ;
end process ;
process ( clk , r)
begin
if r = '0' then
y_present <= espera;
elsif (clk' event and clk = '1') then
y_present <= y_next ;
end if;
end process ;
--z <= '1' when y_present = c else '0';


vd_C <= '0';
am_C <= '1';
vm_C <= '0';

vd_M <= '0';
am_M <= '1';
vm_M <= '0' when y_present = espera;

vd_C <= '0';
am_C <= '1';
vm_C <= '0';

vd_M <= '0';
am_M <= '1';
vm_M <= '0' when y_present = am_inter;

vd_C <= '1';
am_C <= '0';
vm_C <= '0';

vd_M <= '0';
am_M <= '0';
vm_M <= '1' when y_present = vd_vm;

vd_C <= '0';
am_C <= '1';
vm_C <= '0';

vd_M <= '0';
am_M <= '0';
vm_M <= '1' when y_present = am_vm;

vd_C <= '0';
am_C <= '0';
vm_C <= '1';

vd_M <= '1';
am_M <= '0';
vm_M <= '0' when y_present = vm_vd;

vd_C <= '0';
am_C <= '0';
vm_C <= '1';

vd_M <= '0';
am_M <= '1';
vm_M <= '0' when y_present = vm_am;

end ckt ;
