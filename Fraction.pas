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

{Возвращает наибольший общий делитель чисел A и B}
FUNCTION GreatestCommonDenominator(A, B: INTEGER):INTEGER;
VAR
  Temp: INTEGER;
BEGIN
  WHILE B <> 0
  DO
    BEGIN
      Temp := B;
      B := A MOD B;
      A := Temp
    END;
  GreatestCommonDenominator := A
END;

{Упрощает правильную дробь (дробь, где числитель меньше знаменателя)}
PROCEDURE SimplifyFraction(VAR Numerator, Denominator: INTEGER);
VAR
  GCD: INTEGER;
BEGIN
  GCD := GreatestCommonDenominator(Numerator, Denominator);
  Numerator := Numerator DIV GCD;
  Denominator := Denominator DIV GCD;
END;

BEGIN
  READLN(Numerator);
  READLN(Denominator);

  IntegerPart := Numerator DIV Denominator;
  Numerator := Numerator MOD Denominator;
  SimplifyFraction(Numerator, Denominator);

  PrintFraction(IntegerPart, Numerator, Denominator)
END.
