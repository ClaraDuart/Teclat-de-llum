#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
#include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

#define PIN        6 // NUMERO DE PIN DE LA TIRA DE LEDS (DO)
#define NUMPIXELS 60 // NUMERO DE LEDS

Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

#define DELAYVAL 500 // Time (in milliseconds) to pause between pi


const int BUTTON1 = 2;
const int BUTTON2 = 4;
const int LED1 = 7;
const int LED2 = 8;
const int LED3 = 9;
const int LED4 = 12;
const int LED5 = 13;
int BUTTONstate1 = 0;
int BUTTONstate2 = 0;
int potenciometre = 0;
int artista = 1;
int prev_button_state = 0;
int prev_button_state_1 = 0;
int prev_artista = 1;
int play = 0;
int color_led = 0;


int r = 255;
int g = 255;
int b = 255;

void setup()
{
  pinMode(BUTTON1, INPUT);
  pinMode(BUTTON2, INPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);

  Serial.begin(9600);

  pixels.begin();
}

void loop()
{


  if (Serial.available()) {

    char color_led = Serial.read();

  }


  BUTTONstate1 = digitalRead(BUTTON1);
  BUTTONstate2 = digitalRead(BUTTON2);
  potenciometre = analogRead(A2);
  if (BUTTONstate1 == HIGH && prev_button_state == 0) {
    if (play == 0) {
      play = 1;
    } else {
      play = 0;
    }

    Serial.print(play);
    Serial.print("-");
    Serial.print("0");
    Serial.print("-");
    Serial.println(artista);

  }

  prev_button_state = BUTTONstate1;

  if (BUTTONstate2 == HIGH && prev_button_state_1 == 0) {

    Serial.print(play);
    Serial.print("-");
    Serial.print("1");
    Serial.print("-");
    Serial.println(artista);

  }

  prev_button_state_1 = BUTTONstate2;


  artista = int(map(potenciometre, 0, 1023, 5, 1));

  if (artista != prev_artista) {

    Serial.print(play);
    Serial.print("-");
    Serial.print("1");
    Serial.print("-");
    Serial.println(artista);

  }

  prev_artista = artista;
  //repetir pels 5 leds
  if (artista == 1) {
    digitalWrite(LED1, HIGH);
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, LOW);
    digitalWrite(LED5, LOW);

  } else  if (artista == 2) {
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, HIGH);
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, LOW);
    digitalWrite(LED5, LOW);

  } else  if (artista == 3) {
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, HIGH);
    digitalWrite(LED4, LOW);
    digitalWrite(LED5, LOW);

  } else  if (artista == 4) {
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, HIGH);
    digitalWrite(LED5, LOW);

  } else  if (artista == 5) {
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, LOW);
    digitalWrite(LED5, HIGH);

  }



  //tira de leds (artista 1-5) posar el color d cada nota (lletra)
  

  if (artista == 1) {

    if (color_led == 'A') {

      r = 234;
      g = 68;
      b = 35;
    } else  if (color_led == 'B') {

      r = 234;
      g = 68;
      b = 35;
    } else  if (color_led == 'C') {

      r = 237;
      g = 152;
      b = 55;
    } else if (color_led == 'D') {

      r = 237;
      g = 152;
      b = 55;
    } else  if (color_led == 'E') {

      r = 246;
      g = 242;
      b = 105;
    } else  if (color_led == 'F') {

      r = 70;
      g = 154;
      b = 77;
    } else  if (color_led == 'G') {

      r = 70;
      g = 154;
      b = 77;
    } else  if (color_led == 'H') {

      r = 36;
      g = 37;
      b = 143;
    } else  if (color_led == 'I') {

      r = 36;
      g = 37;
      b = 143;
    } else if (color_led == 'J') {

      r = 135;
      g = 49;
      b = 138;
    } else  if (color_led == 'K') {

      r = 135;
      g = 49;
      b = 138;
    } else  if (color_led == 'L') {

      r = 208;
      g = 72;
      b = 149;
    }
  }
if (artista == 2) {

    if (color_led == 'A') {

      r = 59;
      g = 116;
      b = 156;
    } else  if (color_led == 'B') {

      r = 123;
      g = 186;
      b = 173;
    } else  if (color_led == 'C') {

      r = 89;
      g = 146;
      b = 95;
    } else if (color_led == 'D') {

      r = 158;
      g = 171;
      b = 101;
    } else  if (color_led == 'E') {

      r = 250;
      g = 227;
      b = 131;
    } else  if (color_led == 'F') {

      r = 210;
      g = 143;
      b = 90;
    } else  if (color_led == 'G') {

      r = 230;
      g = 140;
      b = 49;
    } else  if (color_led == 'H') {

      r = 219;
      g = 75;
      b = 66;
    } else  if (color_led == 'I') {

      r = 230;
      g = 112;
      b = 115;
    } else if (color_led == 'J') {

      r = 214;
      g = 89;
      b = 111;
    } else  if (color_led == 'K') {

      r = 225;
      g = 137;
      b = 151;
    } else  if (color_led == 'L') {

      r = 225;
      g = 189;
      b = 178;
    }
  }
  if (artista == 3) {

    if (color_led == 'A') {

      r = 234;
      g = 68;
      b = 35;
    } else  if (color_led == 'B') {

      r = 163;
      g = 47;
      b = 22;
    } else  if (color_led == 'C') {

      r = 237;
      g = 152;
      b = 55;
    } else if (color_led == 'D') {

      r = 243;
      g = 215;
      b = 72;
    } else  if (color_led == 'E') {

      r = 246;
      g = 242;
      b = 105;
    } else  if (color_led == 'F') {

      r = 204;
      g = 224;
      b = 98;
    } else  if (color_led == 'G') {

      r = 70;
      g = 154;
      b = 77;
    } else  if (color_led == 'H') {

      r = 87;
      g = 174;
      b = 149;
    } else  if (color_led == 'I') {

      r = 135;
      g = 49;
      b = 138;
    } else if (color_led == 'J') {

      r = 208;
      g = 72;
      b = 149;
    } else  if (color_led == 'K') {

      r = 209;
      g = 70;
      b = 100;
    } else  if (color_led == 'L') {

      r = 234;
      g = 68;
      b = 35;
    }
  }
   if (artista == 4) {

    if (color_led == 'A') {

      r = 212;
      g = 73;
      b = 73;
    } else  if (color_led == 'B') {

      r = 199;
      g = 77;
      b = 140;
    } else  if (color_led == 'C') {

      r = 239;
      g = 231;
      b = 109;
    } else if (color_led == 'D') {

      r = 110;
      g = 108;
      b = 148;
    } else  if (color_led == 'E') {

      r = 58;
      g = 113;
      b = 173;
    } else  if (color_led == 'F') {

      r = 163;
      g = 48;
      b = 33;
    } else  if (color_led == 'G') {

      r = 43;
      g = 51;
      b = 128;
    } else  if (color_led == 'H') {

      r = 230;
      g = 151;
      b = 60;
    } else  if (color_led == 'I') {

      r = 131;
      g = 55;
      b = 131;
    } else if (color_led == 'J') {

      r = 70;
      g = 153;
      b = 76;
    } else  if (color_led == 'K') {

      r = 110;
      g = 108;
      b = 148;
    } else  if (color_led == 'L') {

      r = 58;
      g = 113;
      b = 173;
    }
  }
   if (artista == 5) {

    if (color_led == 'A') {

      r = 204;
      g = 224;
      b = 98;
    } else  if (color_led == 'B') {

      r = 170;
      g = 154;
      b = 77;
    } else  if (color_led == 'C') {

      r = 74;
      g = 157;
      b = 147;
    } else if (color_led == 'D') {

      r = 36;
      g = 37;
      b = 143;
    } else  if (color_led == 'E') {

      r = 135;
      g = 49;
      b = 138;
    } else  if (color_led == 'F') {

      r = 208;
      g = 72;
      b = 149;
    } else  if (color_led == 'G') {

      r = 121;
      g = 40;
      b = 85;
    } else  if (color_led == 'H') {

      r = 163;
      g = 47;
      b = 22;
    } else  if (color_led == 'I') {

      r = 234;
      g = 68;
      b = 35;
    } else if (color_led == 'J') {

      r = 237;
      g = 152;
      b = 55;
    } else  if (color_led == 'K') {

      r = 241;
      g = 240;
      b = 162;
    } else  if (color_led == 'L') {

      r = 246;
      g = 242;
      b = 105;
    }
  }

  for (int i = 0; i < NUMPIXELS; i++) {
    pixels.setPixelColor(i, pixels.Color(r, g, b));
    pixels.show();
  }




}
