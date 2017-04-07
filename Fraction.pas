PROGRAM Fraction(INPUT, OUTPUT);
VAR
  Numerator, Denominator: INTEGER;
  IntegerPart: INTEGER;

BEGIN
  READLN(Numerator);
  READLN(Denominator);

  IntegerPart := Numerator DIV Denominator;
  Numerator := Numerator MOD Denominator;

  IF IntegerPart = 0
  THEN
    WRITELN(Numerator, '/', Denominator)
  ELSE
    WRITELN(IntegerPart, ' ', Numerator, '/', Denominator)
END.
