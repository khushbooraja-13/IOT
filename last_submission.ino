/*************************************************************
  This is a simple demo of sending and receiving some data.
  Be sure to check out other examples!
 *************************************************************/

/* Fill-in information from Blynk Device Info here */
#define BLYNK_TEMPLATE_ID "TMPL3JzJh6pOb"
#define BLYNK_TEMPLATE_NAME "Quickstart Template"
#define BLYNK_AUTH_TOKEN "5_IGhVNp98EJvHs3_S6wLBTnI3s8S4Bu"

/* Comment this out to disable prints and save space */
#define BLYNK_PRINT Serial

#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>
#include <PubSubClient.h>

const char* mqtt_server = "broker.emqx.io";
const char* topic = "bulb/control";

WiFiClient espClient;
PubSubClient client(espClient);

// Your WiFi credentials.
char ssid[] = "Khushboo";
char pass[] = "zenkaiger13";

void setup_wifi() {
  delay(10);
  Serial.begin(115200);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  WiFi.begin(ssid, pass);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

BlynkTimer timer;

void callback(char* topic, byte* payload, unsigned int length) {
  String message = "";
  for (int i = 0; i < length; i++) {
    message += (char)payload[i];
  }
  Serial.println("Message received: " + message);

  int value = message.toInt();
  digitalWrite(2, !value);  // Invert for active low LED
  Blynk.virtualWrite(V0, value);  // Update Blynk switch to match
}

void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("BlynkESP8266")) {
      Serial.println("Connected to MQTT");
      client.subscribe(topic);
    } else {
      Serial.print("Failed, retrying...");
      delay(5000);
    }
  }
}

// This function is called every time the Virtual Pin 0 state changes
BLYNK_WRITE(V0) {
  int value = param.asInt();
  digitalWrite(2, !value);  // Invert for active low LED
  Blynk.virtualWrite(V1, value);  // Optional: Update another widget if needed
  client.publish(topic, value ? "1" : "0");  // Publish state to MQTT
}

// This function is called every time the device is connected to the Blynk.Cloud
BLYNK_CONNECTED() {
  Blynk.setProperty(V3, "offImageUrl", "https://static-image.nyc3.cdn.digitaloceanspaces.com/general/fte/congratulations.png");
  Blynk.setProperty(V3, "onImageUrl",  "https://static-image.nyc3.cdn.digitaloceanspaces.com/general/fte/congratulations_pressed.png");
  Blynk.setProperty(V3, "url", "https://docs.blynk.io/en/getting-started/what-do-i-need-to-blynk/how-quickstart-device-was-made");
}

// This function sends Arduino's uptime every second to Virtual Pin 2.
void myTimerEvent() {
  Blynk.virtualWrite(V2, millis() / 1000);
}

void setup() {
  Serial.begin(115200);
  pinMode(2, OUTPUT);
  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
  digitalWrite(2, HIGH);
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  timer.setInterval(1000L, myTimerEvent);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();
  Blynk.run();
  timer.run();
}