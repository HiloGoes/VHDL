-- Cria a entidade radar para as duas avenidas
entity radar is
	-- O radar é composto por um par de sensores que são entradas do bloco radar
	port(Sensor_A_Caju, Sensor_B_Caju, Sensor_A_Manga, Sensor_B_Manga, clk1: in bit;
	-- A saída para multa é composto por duas saídas Alerta_A e Alerta_B
	Alert_A, Alert_B: out bit);

end radar;-- FIM DA ENTIDADE

-- Organizar a arquitetura do bloco radar
architecture functionRadar of radar is

-- chama o componente flip flop D
component ffd is
    port(clk,D,P,C : IN BIT;
         q : OUT BIT);

end component;

-- Variáveis auxiliares para o acionameto do radar
signal A_C, B_C, auxA_C, auxB_C: bit;
signal A_M, B_M, auxA_M, auxB_M: bit;

begin

-- atribucao da inversão do sinal por causa dos set do ffd ser barrado
auxA_C <= not Sensor_A_Caju;
auxB_C <= not Sensor_B_Caju;

auxA_M <= not Sensor_A_Manga;
auxB_M <= not Sensor_B_Manga;


SA_C: ffd port map(clk => clk1,
	D => '0', 
	P => auxA_C,
	C => '0', 
	q => A_C);

SB_C: ffd port map(clk => clk1,
	D => '0', 
	P => auxB_C, 
	C => '0',
	q => B_C);

SA_M: ffd port map(clk => clk1,
	D => '0', 
	P => auxA_M,
	C => '0', 
	q => A_M);

SB_M: ffd port map(clk => clk1,
	D => '0', 
	P => auxB_M, 
	C => '0',
	q => B_M);

--  caso os dois sensores sejam atividado em um mesmo pulso de clock aciona a mukta
Alert_A <= A_C and B_C;
Alert_B <= A_M and B_M;

end architecture functionRadar;
