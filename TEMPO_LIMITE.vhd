--condi��es de funcionamento:
--EN_TEMPO_LIMITE ==1
--CLR_TEMPO_LIMITE ==1
--QUANDO SEL MUDAR CLR==0
	
ENTITY TEMPO_LIMITE IS
	PORT( EN_TEMPO_LIMITE : IN BIT;
	CLK_TEMPO_LIMITE : IN BIT;
	CLR_TEMPO_LIMITE : IN BIT;
	SEL_TEMPO_LIMITE : IN BIT_VECTOR(1 DOWNTO 0);
	SAIDA_CLK_LIMITE : OUT BIT);
END TEMPO_LIMITE;

ARCHITECTURE CKT OF TEMPO_LIMITE IS

SIGNAL CONTADOR : BIT_VECTOR (7 DOWNTO 0);
SIGNAL S00,S01,S10 : BIT_VECTOR (2 DOWNTO 0);
SIGNAL FINAL,FINAL_NOTURNO, CLR ,F00,F01,F10 : BIT;
 
COMPONENT CONTADOR_8 
	PORT(CLK_CONTADOR_8 : IN BIT;
	ENB_CONTADOR_8 : IN BIT;
	CLR_CONTADOR_8 : IN BIT;
	SAIDA_CONTADOR_8 : OUT BIT_VECTOR (7 DOWNTO 0));
END COMPONENT;

COMPONENT COMPARADOR8BITS 
	PORT(AI,BI : IN BIT_VECTOR (7 DOWNTO 0);
	AM,BM,ABIG : IN BIT;
	ABW,BAW,IGW : OUT BIT	);
END COMPONENT;

COMPONENT MUX 
	PORT( ENTRADA : IN BIT_VECTOR (3 DOWNTO 0);
	SEL : IN BIT_VECTOR(1 DOWNTO 0);
	SAI : OUT BIT);
END COMPONENT;

BEGIN
  
  CLR<=  (NOT FINAL) AND ( CLR_TEMPO_LIMITE) AND (NOT(FINAL_NOTURNO AND SEL_TEMPO_LIMITE(1) AND NOT SEL_TEMPO_LIMITE(0)));
  F00<=S00(0) OR S00(1) OR S00(2);
  F01<=S01(0) OR S01(1) OR S01(2);
  F10<=S10(0) OR S10(1) OR S10(2);

  MULTPLEX : MUX PORT MAP(
  ENTRADA(0)=>F00,
  ENTRADA(1)=>F01,
  ENTRADA(2)=>F10,  
  ENTRADA(3)=>CLK_TEMPO_LIMITE,
  SEL=>SEL_TEMPO_LIMITE,
  SAI=>SAIDA_CLK_LIMITE
  );
  
  CONT : CONTADOR_8 PORT MAP(
    
	CLK_CONTADOR_8=>CLK_TEMPO_LIMITE,
	ENB_CONTADOR_8=>EN_TEMPO_LIMITE,
	CLR_CONTADOR_8=>CLR, 
	SAIDA_CONTADOR_8=>CONTADOR);
	
  ESTADO_COMUM_COMP0 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00001110",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S00(0));
	
	ESTADO_COMUM_COMP1 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00010011",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S00(1));
	
	ESTADO_COMUM_COMP2 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00100010",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S00(2));
	
	ESTADO_FINAL : COMPARADOR8BITS PORT MAP(
    
	AI=>"00101000",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>FINAL);
	
	ESTADO_INTENSO_COMP0 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00011001",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S01(0));
	
	ESTADO_INTENSO_COMP1 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00011110",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S01(1));
	
	ESTADO_INTENSO_COMP2 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00100011",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S01(2));
		ESTADO_NOTURNO_COMP0 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00000100",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S10(0));
	
	ESTADO_NOTURNO_COMP1 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00000101",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S10(1));
	
	ESTADO_NOTURNO_COMP2 : COMPARADOR8BITS PORT MAP(
    
	AI=>"00001001",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>S10(2));
	
	ESTADO_FINAL_NOTURNO : COMPARADOR8BITS PORT MAP(
    
	AI=>"00001010",
	BI=>CONTADOR,
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	IGW=>FINAL_NOTURNO);

 
END CKT;