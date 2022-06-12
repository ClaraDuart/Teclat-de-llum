//classe d'objectes que tindra:

//identificador
//posicio_x
//posicio_y
//tamany_x
//tamany_y
//color [array] 
//nota
//color_actiu

class Nota {

  int id;
  int pos_x;
  int pos_y;
  int tam_x;
  int tam_y;
  int color_;
  int nota;
  int color_actiu;
  int play;

  Nota(int id_, int pos_x_, int pos_y_, int tam_x_, int tam_y_, int color__, int nota_, int color_actiu_, int play_) {

    id = id_;
    pos_x = pos_x_;
    pos_y = pos_y_;
    tam_x = tam_x_;
    tam_y = tam_y_;
    color_ = color__;
    nota = nota_;
    color_actiu = color_actiu_;
    play = play_;
  }

  void display() {

    if (play == 1) {
      strokeWeight(2);
      stroke(255, 0, 0);
    } else {
      strokeWeight(1);
      stroke(255);
    }

//NEWTON MODE 1
    if (color_actiu == 1) {
      if (color_==0) {
        fill(255);
      } else  if (color_==1) {
        fill(234, 68, 35); //C VERMELL
      //} else if (color_==2) {
     //   fill(123, 186, 173); // C#
      } else if (color_==3) {
        fill(237, 152, 55); // D TARONJA
     // } else if (color_==4) {
      //  fill(158, 171, 101); // D#
      } else if (color_==5) {
        fill(246, 242, 105); // E GROC
      } else if (color_==6) {
        fill(70, 154, 77); // F VERD
     // } else if (color_==7) {
     //   fill(230, 140, 49); // F#
      } else if (color_==8) {
        fill(36, 37, 143); // G BLAU
     // } else if (color_==9) {
     //   fill(230, 112, 115);// G#
      } else if (color_==10) {
        fill(135, 49, 138); //A FUXIA
     // } else if (color_==11) {
     //   fill(225, 137, 151); //A#
      } else if (color_==12) {
        fill(208, 72, 149); //B ROSA
      }

      rect(pos_x, pos_y, tam_x, tam_y);
    }
    
     //CASTEL MODE 2

    if (color_actiu == 2) {
      if (color_==0) {
        fill(255);
      } else  if (color_==1) {
        fill(59, 116, 156); //C BLAU
      } else if (color_==2) {
        fill(123, 186, 173); // C# CIÀ
      } else if (color_==3) {
        fill(89, 146, 95); // D VERD
      } else if (color_==4) {
        fill(158, 171, 101); // D# VERD OLIVA
      } else if (color_==5) {
        fill(250, 227, 131); // E GROC
      } else if (color_==6) {
        fill(210, 143, 90); // F SALMÓ
      } else if (color_==7) {
        fill(230, 140, 49); // F# TARONJA
      } else if (color_==8) {
        fill(219, 75, 66); // G VERMELL
      } else if (color_==9) {
        fill(230, 112, 115);// G# ROSA 1
      } else if (color_==10) {
        fill(214, 89, 111); //A ROSA 2
      } else if (color_==11) {
        fill(225, 137, 151); //A# ROSA CLARET
      } else if (color_==12) {
        fill(225, 189, 178); //B ROSA CLARET 2
      }

      rect(pos_x, pos_y, tam_x, tam_y);
    }

    //BAINBRIDGE BISHOP MODE 3
    if (color_actiu == 3) {
      if (color_==0) {
        fill(255);
      } else  if (color_==1) {
        fill(234, 68, 35); //C VERMELL 1
      } else if (color_==2) {
        fill(163, 47, 22); // C# VERMELL 2
      } else if (color_==3) {
        fill(237, 152, 55); // D TARONJA
      } else if (color_==4) {
        fill(243, 215, 72); // D# GROC
      } else if (color_==5) {
        fill(246, 242, 105); // E GROC
      } else if (color_==6) {
        fill(204, 224, 98); // F VERD FLUIXET
      } else if (color_==7) {
        fill(70, 154, 77); // F# VERD
      } else if (color_==8) {
        fill(87, 174, 149); // G CIAN
      } else if (color_==9) {
        fill(135, 49, 138);// G# FUXIA
      } else if (color_==10) {
        fill(208, 72, 149); //A ROSA 1
      } else if (color_==11) {
        fill(209, 70, 100); //A# ROSA 2
      } else if (color_==12) {
        fill(234, 68, 35); //B RVERMELL
      }

      rect(pos_x, pos_y, tam_x, tam_y);
    }

    //SCRIABIN MODE 4
    if (color_actiu == 4) {
      if (color_==0) {
        fill(255);
      } else  if (color_==1) {
        fill(212, 73, 73); // C VERMELL
      } else if (color_==2) {
        fill(199, 77, 140); // C# ROSA
      } else if (color_==3) {
        fill(239, 231, 109); // D GROC
      } else if (color_==4) {
        fill(110, 108, 148); // D# LILA
      } else if (color_==5) {
        fill(58, 113, 173); // E BLAU
      } else if (color_==6) {
        fill(163, 48, 33); // F GRANATE
      } else if (color_==7) {
        fill(43, 51, 128); // F# BLAU MARÍ
      } else if (color_==8) {
        fill(230, 151, 60); // G TARONJA
      } else if (color_==9) {
        fill(131, 55, 131); // G# LILA
      } else if (color_==10) {
        fill(70, 153, 76); // A VERD
      } else if (color_==11) {
        fill(110, 108, 148); // A# LILA
      } else if (color_==12) {
        fill(58, 113, 173); // B BLAU
      }

      rect(pos_x, pos_y, tam_x, tam_y);
    }

   
    

    //ZIEVERINK MODE 5
    if (color_actiu == 5) {
      if (color_==0) {
        fill(255);
      } else  if (color_==1) {
        fill(204, 224, 98); //C VERD FLUIXET
      } else if (color_==2) {
        fill(170, 154, 77); // C# VERD
      } else if (color_==3) {
        fill(74, 157, 147); // D CIAN
      } else if (color_==4) {
        fill(36, 37, 143); // D# BLAU
      } else if (color_==5) {
        fill(135, 49, 138); // E FUXIA
      } else if (color_==6) {
        fill(208, 72, 149); // F ROSA
      } else if (color_==7) {
        fill(121, 40, 85); // F# ROSA FORD
      } else if (color_==8) {
        fill(163, 47, 22); // G VERMELL 1
      } else if (color_==9) {
        fill(234, 68, 35);// G# VERMELL 2
      } else if (color_==10) {
        fill(237, 152, 55); //A TARONJA
      } else if (color_==11) {
        fill(241, 240, 162); //A# GROC FLUIX
      } else if (color_==12) {
        fill(246, 242, 105); //B GROC FORT
      }

      rect(pos_x, pos_y, tam_x, tam_y);
    }
  }
}
