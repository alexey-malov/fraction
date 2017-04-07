PROGRAM Fraction(INPUT, OUTPUT);
CONST
  UpperBound = 1000000;

VAR
  Numerator, Denominator, IntegerPart: INTEGER;

{Выводит смешанную дробь на экран}
PROCEDURE PrintFraction(IntegerPart, Numerator, Denominator: INTEGER);
BEGIN
  IF Numerator = 0
  THEN
    WRITELN(IntegerPart)
  ELSE
    IF IntegerPart = 0 {Числитель не равен 0}
    THEN
      WRITELN(Numerator, '/', Denominator)
    ELSE
      WRITELN(IntegerPart, ' ', Numerator, '/', Denominator)
END;

{Возвращает наибольший общий делитель чисел A и B}
FUNCTION GreatestCommonDenominator(A, B: INTEGER): INTEGER;
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

FUNCTION ReadInteger(VAR X: INTEGER): BOOLEAN;
VAR
  InputString: STRING[255];
  ErrorCode: INTEGER;
BEGIN
  READLN(InputString);
  VAL(InputString, X, ErrorCode);
  ReadInteger := ErrorCode = 0
END;

FUNCTION IsInRange(X, MinValue, MaxValue: INTEGER): BOOLEAN;
BEGIN
  IsInRange := (X >= MinValue) AND (X <= MaxValue);
END;

FUNCTION ReadFraction(VAR Numerator, Denominator: INTEGER): BOOLEAN;
BEGIN
  ReadFraction := FALSE;
  IF ReadInteger(Numerator) AND ReadInteger(Denominator)
  THEN
    IF IsInRange(Numerator, 0, UpperBound) AND 
       IsInRange(Denominator, 1, UpperBound)
    THEN
      ReadFraction := TRUE
END; 

BEGIN
  IF ReadFraction(Numerator, Denominator)
  THEN
    BEGIN
      IntegerPart := Numerator DIV Denominator;
      Numerator := Numerator MOD Denominator;
      SimplifyFraction(Numerator, Denominator);

      PrintFraction(IntegerPart, Numerator, Denominator)
    END
  ELSE
    WRITELN('ERROR')
END.
