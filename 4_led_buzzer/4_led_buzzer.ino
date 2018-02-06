int _ABVAR_1_count = 0 ;
void __ardublockDigitalWrite(int pinNumber, boolean status)
{
  pinMode(pinNumber, OUTPUT);
  digitalWrite(pinNumber, status);
}


void setup()
{
  Serial.begin(9600);
  _ABVAR_1_count = 0 ;

}

void loop()
{
  while ( ( ( _ABVAR_1_count ) < ( 1 ) ) )
  {
    Serial.print("\"LED on pin 6 turns on”");
    Serial.print(" ");
    Serial.println();
    __ardublockDigitalWrite(6, HIGH);
    delay( 500 );
    Serial.print("\"LED on pin 9 turns on”");
    Serial.print(" ");
    Serial.println();
    __ardublockDigitalWrite(9, HIGH);
    delay( 500 );
    Serial.print("\"LED on pin 10 turns on”");
    Serial.print(" ");
    Serial.println();
    __ardublockDigitalWrite(10, HIGH);
    delay( 500 );
    Serial.print("\"LED on pin 11 turns on”");
    Serial.print(" ");
    Serial.println();
    __ardublockDigitalWrite(11, HIGH);
    delay( 500 );
    Serial.print("\"Make noise at pin 5\"");
    Serial.print(" ");
    Serial.println();
    tone(5, 440);
    delay( 500 );
    _ABVAR_1_count = 1 ;
  }

}


