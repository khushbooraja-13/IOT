#include <ESP8266WiFi.h>
#include <PubSubClient.h>

const char* ssid = "IoT_Demo";
const char* password = "diet@iot";
const char* mqtt_server = "broker.mqtt-dashboard.com";

WiFiClient espClient;
PubSubClient client(espClient);

void setup_wifi() {
  delay(10);
  Serial.println("\nConnecting to WiFi...");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi connected!");
}

void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message received on [");
  Serial.print(topic);
  Serial.print("]: ");
  
  String message = "";
  for (int i = 0; i < length; i++) {
    message += (char)payload[i];
  }
  Serial.println(message);

  // Blink BUILTIN LED when a message is received
  digitalWrite(BUILTIN_LED, LOW);  // Turn LED ON
  delay(200);
  digitalWrite(BUILTIN_LED, HIGH); // Turn LED OFF
}

void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("KhushbooESP8266")) {
      Serial.println("Connected!");
      client.subscribe("group/chat");
    } else {
      Serial.println("Failed, retrying...");
      delay(5000);
    }
  }
}

void setup() {
  Serial.begin(115200);
  pinMode(BUILTIN_LED, OUTPUT);
  digitalWrite(BUILTIN_LED, HIGH); // Ensure LED is OFF initially

  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  if (Serial.available()) {
    String message = Serial.readStringUntil('\n');
    message.trim();
    String fullMessage = "Khushboo😜: " + message;
    client.publish("group/chat", fullMessage.c_str());
    Serial.println("Message sent: " + fullMessage);
  }
}