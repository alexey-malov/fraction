PROGRAM Fraction(INPUT, OUTPUT);
VAR
  Numerator, Denominator: INTEGER;
  IntegerPart: INTEGER;

{Выводит смешанную дробь на экран}
PROCEDURE PrintFraction(IntegerPart, Numerator, Denominator: INTEGER);
BEGIN
  IF IntegerPart = 0
  THEN
    WRITELN(Numerator, '/', Denominator)
  ELSE
    WRITELN(IntegerPart, ' ', Numerator, '/', Denominator)
END;

BEGIN
  READLN(Numerator);
  READLN(Denominator);

  IntegerPart := Numerator DIV Denominator;
  Numerator := Numerator MOD Denominator;

  PrintFraction(IntegerPart, Numerator, Denominator)
END.
