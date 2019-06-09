entity reg_semafaro is
	port (load: in bit;
	vm, vd, am : out bit
	      );

end reg_semafaro;

architecture state_register of reg_semafaro is


signal jg, kg, jr, kr, jy, ky : bit;
signal r, g, y : bit;


component FFJK is
    port(
         clk,J,K,P,C: in bit;
         q: out bit
        );
end component;

begin

jg <= r and not y;
kg <= g;

F1: ffjk port map(
	clk => load,
	J => jg,
	K => kg,
	P => '1',
	C => '1',
	q => g
);

jr <= y and not g;
kr <= '1';

F2: ffjk port map(
	clk => load,
	J => jr,
	K => kr,
	P => '1',
	C => '1',
	q => r
);

jy <= g and not r;
ky <= '1';

F3: ffjk port map(
	clk =>load,
	J => jy,
	K => ky,
	P => '1',
	C => '1',
	q => y
	);

vm <= r;
am <= y;
vd <= g;


end state_register;
