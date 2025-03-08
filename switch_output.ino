void setup()
{
  pinMode(D5, OUTPUT);
  pinMode(D0, INPUT);
}

void loop()
{
  int sw = digitalRead(D0);
  if(sw == 1)
    digitalWrite(D5, HIGH);
  else
    digitalWrite(D5, LOW);
}
