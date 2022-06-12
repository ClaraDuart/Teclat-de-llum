import ddf.minim.*; //<>//
import ddf.minim.effects.*;

Minim minim;
AudioPlayer c;
AudioPlayer c_; 
AudioPlayer d;
AudioPlayer d_;
AudioPlayer e;
AudioPlayer f; 
AudioPlayer f_;
AudioPlayer g;
AudioPlayer g_;
AudioPlayer a;
AudioPlayer a_;
AudioPlayer b;



import processing.serial.*;

Serial portPiano;  // Create object from Serial class
Serial portSensors;  // Create object from Serial class

int val;      // Data received from the serial port




int playing = 0;

boolean playMusica = false;
int color_actiu_set = 1;


long previousMillis = 0;        // will store last time LED was updated

// temps de metronom
long interval = 1000; 

int spacing_x;
int spacing_y;


int columnes = 20;
int files  = 20;

int nota_piano = 0;

Nota[] notes = new Nota[columnes*files];

void setup() {

  printArray(Serial.list());

  //arduino piano
  String portName = Serial.list()[5];
  portPiano= new Serial(this, portName, 9600);

  //arduino dels sensors
  String portName2 = Serial.list()[4]; //cambiar el port per l'altre arduinoa
  portSensors = new Serial(this, portName2, 9600);

  minim = new Minim(this);
  c= minim.loadFile("c.mp3");
  c_= minim.loadFile("c#.mp3");
  d= minim.loadFile("d.mp3");
  d_= minim.loadFile("d#.mp3");
  e= minim.loadFile("e.mp3");
  f= minim.loadFile("f.mp3");
  f_=minim.loadFile("f#.mp3");
  g= minim.loadFile("g.mp3");
  g_=minim.loadFile("g#.mp3");
  a= minim.loadFile("a.mp3");
  a_= minim.loadFile("a#.mp3");
  b=minim.loadFile("b.mp3");


  //size(900, 900);
  fullScreen();
  spacing_x = width/columnes;
  spacing_y = height/files;


  int suma = 0;
  for (int y = 0; y<height; y+= spacing_y) {
    for (int x = 0; x<width; x+=spacing_x) {
      rect(x, y, spacing_x, spacing_y);
      Nota nota  = new Nota(suma, x, y, spacing_x, spacing_y, 0, 0, color_actiu_set, 0);
      notes[suma] =  nota;
      suma++;
      //omplir la matriu d'objectes 'notes'
    }
  }
}

void draw() {

  if (portPiano.available()>0) {

    String num =  portPiano.readStringUntil('\n');
    if (num!=null) {
      nota_piano = int(num.trim());
      println(nota_piano);
      
      portSensors.write('A');
      if (nota_piano == 0) {
        notes[add].color_ = 1;
        notes[add].nota = 1;

        add++;
        c.rewind();
        c.play();

        //repetir les lletres per envioar a arduino i pinti els leds
        portSensors.write('B');
      } else if (nota_piano == 1) {
        notes[add].color_ = 2;
        notes[add].nota = 2;

        add++;
        c_.rewind();
        c_.play();

        portSensors.write('C');
      } else if (nota_piano == 2) {
        notes[add].color_ = 3;
        notes[add].nota = 3;

        add++;
        d.rewind();
        d.play();

        portSensors.write('D');
      } else if (nota_piano == 3) {
        notes[add].color_ = 4;
        notes[add].nota = 4;

        add++;
        d_.rewind();
        d_.play();

        portSensors.write('E');
      } else if (nota_piano == 4) {
        notes[add].color_ = 5;
        notes[add].nota = 5;

        add++;
        e.rewind();
        e.play();

        portSensors.write('F');
      } else if (nota_piano == 5) {
        notes[add].color_ = 6;
        notes[add].nota = 6;

        add++;
        f.rewind();
        f.play();

        portSensors.write('G');
      } else if (nota_piano == 6) {
        notes[add].color_ = 7;
        notes[add].nota = 7;

        add++;
        f_.rewind();
        f_.play();

        portSensors.write('H');
      } else if (nota_piano == 7) {
        notes[add].color_ = 8;
        notes[add].nota = 8;

        add++;
        g.rewind();
        g.play();

        portSensors.write('I');
      } else if (nota_piano == 8) {
        notes[add].color_ = 9;
        notes[add].nota = 9;

        add++;
        g_.rewind();
        g_.play();

        portSensors.write('J');
      } else if (nota_piano == 9) {
        notes[add].color_ = 10;
        notes[add].nota = 10;

        add++;
        a.rewind();
        a.play();

        portSensors.write('K');
      } else if (nota_piano == 10) {
        notes[add].color_ = 11;
        notes[add].nota = 11;

        add++;
        a_.rewind();
        a_.play();

        portSensors.write('L');
      } else if (nota_piano == 11) {
        notes[add].color_ = 12;
        notes[add].nota = 12;

        add++;
        b.rewind();
        b.play();
      }
    }
  }


  if (portSensors.available()>0) {
    //llegir multiples sensors
    String valors = portSensors.readStringUntil('\n');

    if (valors!=null) {
      String[] list_sensors = split(valors, '-');

      if (int(list_sensors[0].trim())==1) {
        playMusica = true;
      } else {
        playMusica = false;
      }
      if (int(list_sensors[1].trim())==1) {
        reset();
      }
      for (int i =0; i<notes.length; i++) {
        notes[i].color_actiu = int(list_sensors[2].trim());
      }
    }
  }
  background(0);


  stroke(255);
  strokeWeight(1);



  for (int i =0; i<notes.length; i++) {
    notes[i].display();
  }

  long currentMillis = millis();

  if (currentMillis - previousMillis >= interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    if (playMusica) {
      if (notes[playing].nota>0) {
        notes[playing].play =  1;
        if (notes[playing].nota == 1) {
          c.rewind();
          c.play();
          //loop mp3
        } else if (notes[playing].nota == 2) {
          c_.rewind();
          c_.play();
          //loop mp3
        } else if (notes[playing].nota == 3) {
          d.rewind();
          d.play();
        } else  if (notes[playing].nota == 4) {
          d_.rewind();
          d_.play();
          //loop mp3
        } else if (notes[playing].nota == 5) {
          e.rewind();
          e.play();
        } else if (notes[playing].nota == 6) {
          f.rewind();
          f.play();
        } else if (notes[playing].nota == 7) {
          f_.rewind();
          f_.play();
        } else if (notes[playing].nota == 8) {
          g.rewind();
          g.play();
        } else if (notes[playing].nota == 9) {
          g_.rewind();
          g_.play();
        } else if (notes[playing].nota == 10) {
          a.rewind();
          a.play();
        } else if (notes[playing].nota == 11) {
          a_.rewind();
          a_.play();
        } else if (notes[playing].nota == 12) {
          b.rewind();
          b.play();
        }
        if (playing>0) {
          notes[playing-1].play =  0;
        }
        playing++;
      } else {
        notes[playing-1].play =  0;
        playing = 0;
      }
    }
  }
}


void reset() {

  int suma = 0;
  add = 0;
  playing = 0;
  playMusica = false;
  for (int y = 0; y<height; y+= spacing_y) {
    for (int x = 0; x<width; x+=spacing_x) {
      rect(x, y, spacing_x, spacing_y);
      Nota nota  = new Nota(suma, x, y, spacing_x, spacing_y, 0, 0, color_actiu_set, 0);
      notes[suma] =  nota;
      suma++;

      //omplir la matriu d'objectes 'notes'
    }
  }
}
int add = 0;
void keyReleased() {
  if (key == 'a') {
    notes[add].color_ = 1;
    notes[add].nota = 1;

    add++;
    c.rewind();
    c.play();
  } else if (key == 'w') {
    notes[add].color_ = 2;
    notes[add].nota = 2;

    add++;
    c_.rewind();
    c_.play();
  } else if (key == 's') {
    notes[add].color_ = 3;
    notes[add].nota = 3;

    add++;
    d.rewind();
    d.play();
  } else if (key == 'e') {
    notes[add].color_ = 4;
    notes[add].nota = 4;

    add++;
    d_.rewind();
    d_.play();
  } else if (key == 'd') {
    notes[add].color_ = 5;
    notes[add].nota = 5;

    add++;
    e.rewind();
    e.play();
  } else if (key == 'f') {
    notes[add].color_ = 6;
    notes[add].nota = 6;

    add++;
    f.rewind();
    f.play();
  } else if (key == 't') {
    notes[add].color_ = 7;
    notes[add].nota = 7;

    add++;
    f_.rewind();
    f_.play();
  } else if (key == 'g') {
    notes[add].color_ = 8;
    notes[add].nota = 8;

    add++;
    g.rewind();
    g.play();
  } else if (key == 'y') {
    notes[add].color_ = 9;
    notes[add].nota = 9;

    add++;
    g_.rewind();
    g_.play();
  } else if (key == 'h') {
    notes[add].color_ = 10;
    notes[add].nota = 10;

    add++;
    a.rewind();
    a.play();
  } else if (key == 'u') {
    notes[add].color_ = 11;
    notes[add].nota = 11;

    add++;
    a_.rewind();
    a_.play();
  } else if (key == 'j') {
    notes[add].color_ = 12;
    notes[add].nota = 12;

    add++;
    b.rewind();
    b.play();
  } else if (key == '1') { // MODE 1
    for (int i =0; i<notes.length; i++) {
      notes[i].color_actiu = 1;
    }
    color_actiu_set = 2; // MODE 2
  } else if (key == '2') {
    for (int i =0; i<notes.length; i++) {
      notes[i].color_actiu = 2;
    }
    color_actiu_set = 3;
  } else if (key == '3') {
    for (int i =0; i<notes.length; i++) {
      notes[i].color_actiu = 3;
    }
    color_actiu_set = 4;
  } else if (key == '4') {
    for (int i =0; i<notes.length; i++) {
      notes[i].color_actiu = 4;
    }
    color_actiu_set = 5;
  } else if (key == '5') {
    for (int i =0; i<notes.length; i++) {
      notes[i].color_actiu = 5;
    }
    color_actiu_set = 1;
  } else if (key == 'n') { // RESET I COMENÇA DES DEL PRINCIPI
    int suma = 0;
    add = 0;
    playing = 0;
    playMusica = false;
    for (int y = 0; y<height; y+= spacing_y) {
      for (int x = 0; x<width; x+=spacing_x) {
        rect(x, y, spacing_x, spacing_y);
        Nota nota  = new Nota(suma, x, y, spacing_x, spacing_y, 0, 0, color_actiu_set, 0);
        notes[suma] =  nota;
        suma++;

        //omplir la matriu d'objectes 'notes'
      }
    }
  } else if (key == 'p') {
    playing = 0;
    playMusica = true;
  } else if (key == 'l') {
    playing = 0;
    playMusica = false;
  }
}
