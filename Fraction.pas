PROGRAM Fraction(INPUT, OUTPUT);
CONST
  UpperBound = 1000000;

TYPE
  {Тип данных Смешанная дробь}
  CompoundFraction = RECORD
    IntegerPart, Numerator, Denominator: INTEGER;
  END;

{Выводит смешанную дробь на экран}
PROCEDURE PrintFraction(Fract: CompoundFraction);
BEGIN
  IF Fract.Numerator = 0
  THEN
    WRITELN(Fract.IntegerPart)
  ELSE
    BEGIN
      IF Fract.IntegerPart <> 0
      THEN
        WRITE(Fract.IntegerPart, ' ');
      WRITELN(Fract.Numerator, '/', Fract.Denominator)
    END
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

FUNCTION ReadInteger(VAR X: INTEGER): BOOLEAN;
VAR
  InputString: STRING[255];
  ErrorCode: INTEGER;
BEGIN
  IF NOT EOF
  THEN
    BEGIN
      READLN(InputString);
      VAL(InputString, X, ErrorCode);
      ReadInteger := ErrorCode = 0
    END  
  ELSE
    ReadInteger := FALSE
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

{Преобразует простую дробь в смешанную}
FUNCTION ToCompoundFraction(Numerator, Denominator: INTEGER): CompoundFraction;
VAR
  GCD: INTEGER;
  Fract: CompoundFraction;
BEGIN
  GCD := GreatestCommonDenominator(Numerator, Denominator);

  Fract.IntegerPart := Numerator DIV Denominator;
  Fract.Numerator := (Numerator MOD Denominator) DIV GCD;
  Fract.Denominator := Denominator DIV GCD;

  ToCompoundFraction := Fract
END;

VAR
  Numerator, Denominator: INTEGER;
BEGIN
  IF ReadFraction(Numerator, Denominator)
  THEN
    PrintFraction(ToCompoundFraction(Numerator, Denominator))
  ELSE
    WRITELN('ERROR')
END.
