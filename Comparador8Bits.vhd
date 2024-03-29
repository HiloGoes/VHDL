ENTITY COMPARADOR8BITS IS
	PORT( AI,BI : IN BIT_VECTOR (7 DOWNTO 0);
	AM,BM,ABIG : IN BIT;
	ABW,BAW,IGW : OUT BIT);
END COMPARADOR8BITS;

ARCHITECTURE CKT OF COMPARADOR8BITS IS

SIGNAL ABI,BAI,IGI :BIT_VECTOR (7 DOWNTO 1);

COMPONENT BITCOMPARADOR
	PORT( A,B,AM,BM,ABIG : IN BIT;
	AB,BA,IG : OUT BIT);
END COMPONENT;

BEGIN
  
B7 : BITCOMPARADOR PORT MAP(
	A=>AI(7),
	B=>BI(7),
	AM=>'0',
	BM=>'0',
	ABIG=>'1',
	AB=>ABI(7),
	BA=>BAI(7),
	IG=>IGI(7));
B6 : BITCOMPARADOR PORT MAP(
	A=>AI(6),
	B=>BI(6),
	AM=>ABI(7),
	BM=>BAI(7),
	ABIG=>IGI(7),
	AB=>ABI(6),
	BA=>BAI(6),
	IG=>IGI(6));
B5 : BITCOMPARADOR PORT MAP(
	A=>AI(5),
	B=>BI(5),
	AM=>ABI(6),
	BM=>BAI(6),
	ABIG=>IGI(6),
	AB=>ABI(5),
	BA=>BAI(5),
	IG=>IGI(5));
B4 : BITCOMPARADOR PORT MAP(
	A=>AI(4),
	B=>BI(4),
	AM=>ABI(5),
	BM=>BAI(5),
	ABIG=>IGI(5),
	AB=>ABI(4),
	BA=>BAI(4),
	IG=>IGI(4));
B3 : BITCOMPARADOR PORT MAP(
	A=>AI(3),
	B=>BI(3),
	AM=>ABI(4),
	BM=>BAI(4),
	ABIG=>IGI(4),
	AB=>ABI(3),
	BA=>BAI(3),
	IG=>IGI(3));
B2 : BITCOMPARADOR PORT MAP(
	A=>AI(2),
	B=>BI(2),
	AM=>ABI(3),
	BM=>BAI(3),
	ABIG=>IGI(3),
	AB=>ABI(2),
	BA=>BAI(2),
	IG=>IGI(2));
B1 : BITCOMPARADOR PORT MAP(
	A=>AI(1),
	B=>BI(1),
	AM=>ABI(2),
	BM=>BAI(2),
	ABIG=>IGI(2),
	AB=>ABI(1),
	BA=>BAI(1),
	IG=>IGI(1));
B0 : BITCOMPARADOR PORT MAP(
	A=>AI(0),
	B=>BI(0),
	AM=>ABI(1),
	BM=>BAI(1),
	ABIG=>IGI(1),
	AB=>ABW,
	BA=>BAW,
	IG=>IGW);
	
END CKT ;




