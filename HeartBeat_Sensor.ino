int UpperThreshold = 518;
int LowerThreshold = 490;
int reading = 0;
float BPM = 0.0;
bool IgnoreReading = false;
bool FirstPulseDetecded = false;
unsigned long FirstPulseTime = 0;
unsigned long SecondPulseTime = 0;
unsigned long PulseInternal = 0;

void setup() {
  pinMode(A0, INPUT);
  Serial.begin(9600);
}

void loop() {
  reading = analogRead(A0);
  if(reading > UpperThreshold && IgnoreReading == false) {
    if(FirstPulseDetecded == false) {
      FirstPulseTime = millis();
      FirstPulseDetecded = true;
    }
    else {
      SecondPulseTime = millis();
      PulseInternal = SecondPulseTime - FirstPulseTime;
      FirstPulseDetecded = false;
      IgnoreReading = true;
    }
  }
  if(reading < LowerThreshold)
  {
	  IgnoreReading = false;
  }
  BPM = (1.0/PulseInternal) * 60.0 * 1000;
  Serial.print(BPM);
  Serial.println("BPM");
  Serial.flush();
}
