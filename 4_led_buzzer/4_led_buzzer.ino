int __ardublockAnalogRead(int pinNumber)
{
  pinMode(pinNumber, INPUT);
  return analogRead(pinNumber);
}


void __ardublockDigitalWrite(int pinNumber, boolean status)
{
  pinMode(pinNumber, OUTPUT);
  digitalWrite(pinNumber, status);
}

boolean __ardublockDigitalReadPullup(int pinNumber)
{
  pinMode(pinNumber, INPUT_PULLUP);
  return digitalRead(pinNumber);
}



void setup()
{
  Serial.begin(9600);
}

void loop()
{
  Serial.print("message");
  Serial.print(" ");
  Serial.print(__ardublockAnalogRead(A2));
  Serial.print(" ");
  Serial.println();
  if (( ( __ardublockAnalogRead(A2) ) < ( 30 ) ))
  {
    __ardublockDigitalWrite(5, HIGH);
  }
  else
  {
    __ardublockDigitalWrite(5, LOW);
  }
  if (( ( __ardublockDigitalReadPullup(A3) ) == ( false ) ))
  {
    __ardublockDigitalWrite(6, HIGH);
  }
  else
  {
    __ardublockDigitalWrite(6, LOW);
  }
}


