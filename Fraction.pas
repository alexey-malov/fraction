PROGRAM Fraction(INPUT, OUTPUT);
VAR
  Numerator, Denominator, IntegerPart: INTEGER;

{Выводит смешанную дробь на экран}
PROCEDURE PrintFraction(IntegerPart, Numerator, Denominator: INTEGER);
BEGIN
  IF IntegerPart = 0
  THEN
    WRITELN(Numerator, '/', Denominator)
  ELSE
    WRITELN(IntegerPart, ' ', Numerator, '/', Denominator)
END;

{Упрощает правильную дробь (дробь, где числитель меньше знаменателя)}
PROCEDURE SimplifyFraction(VAR Numerator, Denominator: INTEGER);
VAR
  {Greatest Common Denominator - наибольший общий делитель}
  GCD: INTEGER;
BEGIN
  GCD := Numerator;
  WHILE GCD > 1
  DO
    BEGIN
      IF (Numerator MOD GCD = 0) AND (Denominator MOD GCD = 0)
      THEN
        BEGIN
          Numerator := Numerator DIV GCD;
          Denominator := Denominator DIV GCD;
          GCD := Numerator
        END
      ELSE
        GCD := GCD - 1
    END
END;

BEGIN
  READLN(Numerator);
  READLN(Denominator);

  IntegerPart := Numerator DIV Denominator;
  Numerator := Numerator MOD Denominator;
  SimplifyFraction(Numerator, Denominator);

  PrintFraction(IntegerPart, Numerator, Denominator)
END.
