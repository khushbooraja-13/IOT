// Ultrasonic Sensor and Bulb Control Code
double distance;
long int duration;
const int trigPin = D6; // Trigger pin for ultrasonic sensor
const int echoPin = D7; // Echo pin for ultrasonic sensor
const int bulbPin = D8; // Output pin for the bulb or LED
const double thresholdDistance = 10.0; // Threshold distance in cm

void setup()
{
  // Set pin modes
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  // pinMode(buttonPin, INPUT_PULLUP);
  pinMode(bulbPin, OUTPUT);
  
  // Initialize serial communication
  Serial.begin(9600);
}

void loop()
{
  // Trigger the ultrasonic sensor
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  // Measure the duration of the echo signal
  duration = pulseIn(echoPin, HIGH);
  
  // Calculate distance in cm
  distance = 0.0343 * (duration / 2);
  
  // Print the distance to the serial monitor
  Serial.print("Measured Distance: ");
  Serial.print(distance);
  Serial.println(" cm");
  
  // Control the bulb based on the distance
  if (distance <= thresholdDistance && duration > 0) {
    digitalWrite(bulbPin, HIGH); // Turn ON the bulb
  } else {
    digitalWrite(bulbPin, LOW);  // Turn OFF the bulb
  }
  
  // Small delay for stability
  delay(500);
}
