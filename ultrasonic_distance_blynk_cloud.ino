/*************************************************************

  This is a simple demo of sending and receiving some data.
  Be sure to check out other examples!
 *************************************************************/

/* Fill-in information from Blynk Device Info here */
#define BLYNK_TEMPLATE_ID           "TMPL3JzJh6pOb"
#define BLYNK_TEMPLATE_NAME         "Quickstart Template"
#define BLYNK_AUTH_TOKEN            "PuEgtsnixsdcxtfJb06Cekqk1z3Y-rKe"

/* Comment this out to disable prints and save space */
#define BLYNK_PRINT Serial


#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

double distance;
long int duration;
const int trigPin = D6; // Trigger pin for ultrasonic sensor
const int echoPin = D7; // Echo pin for ultrasonic sensor
const int bulbPin = D8; // Output pin for the bulb or LED
const double thresholdDistance = 10.0; // Threshold distance in cm

// Your WiFi credentials.
// Set password to "" for open networks.
char ssid[] = "Khushboo";
char pass[] = "zenkaiger13";

BlynkTimer timer;

// This function is called every time the Virtual Pin 0 state changes
BLYNK_WRITE(V0)
{
  // Set incoming value from pin V0 to a variable
  int value = param.asInt();
  digitalWrite(D4, value);

  // Update state
  Blynk.virtualWrite(V1, value);
}

// This function is called every time the device is connected to the Blynk.Cloud
BLYNK_CONNECTED()
{
  // Change Web Link Button message to "Congratulations!"
  Blynk.setProperty(V3, "offImageUrl", "https://static-image.nyc3.cdn.digitaloceanspaces.com/general/fte/congratulations.png");
  Blynk.setProperty(V3, "onImageUrl",  "https://static-image.nyc3.cdn.digitaloceanspaces.com/general/fte/congratulations_pressed.png");
  Blynk.setProperty(V3, "url", "https://docs.blynk.io/en/getting-started/what-do-i-need-to-blynk/how-quickstart-device-was-made");
}

// This function sends Arduino's uptime every second to Virtual Pin 2.
void myTimerEvent()
{
  // You can send any value at any time.
  // Please don't send more that 10 values per second.
}

void setup()
{
  // Debug console
  Serial.begin(115200);
  pinMode(D4, OUTPUT);
  // Set pin modes
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  // pinMode(buttonPin, INPUT_PULLUP);
  pinMode(bulbPin, OUTPUT);

  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
  // You can also specify server:
  //Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass, "blynk.cloud", 80);
  //Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass, IPAddress(192,168,1,100), 8080);

  // Setup a function to be called every second
  timer.setInterval(1000L, myTimerEvent);
}

void loop()
{
  Blynk.run();
  timer.run();
  
  // You can inject your own code or combine it with other sketches.
  // Check other examples on how to communicate with Blynk. Remember
  // to avoid delay() function!
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
   Blynk.virtualWrite(V2, distance);
  // Control the bulb based on the distance
  if (distance <= thresholdDistance && duration > 0) {
    digitalWrite(bulbPin, HIGH); // Turn ON the bulb
  } else {
    digitalWrite(bulbPin, LOW);  // Turn OFF the bulb
  }
  
  // Small delay for stability
  delay(500);
}