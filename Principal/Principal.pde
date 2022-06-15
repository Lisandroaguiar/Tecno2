
import oscP5.*;
//variables de calibración

float minimoAmp = 30;
float maximoAmp = 100;

float minimoPitch = 50;
float maximoPitch = 80;
boolean desordenar;
float f = 0.4;
boolean haySonido=false;
boolean sonidoCorto=false;
long marcaDeTiempo;
float marcaDeTiempoA;
int tiempo=20000;
OscP5 osc; // declaracion del objeto osc

float amp = 0.0;
float pitch = 0.0;
GestorSenial gestorAmp;
GestorSenial gestorPitch;

Flujo flujo;
int contador;
Paleta paleta;
float q;
float inc=0.5;
int w=int(random(4));
float enrularlo=0.7;
int separacion=int(random(10, 14));
void setup() {
  background(0);
  flujo=new Flujo(3);
  size(1280, 720);
  //fullScreen();
  flujo.iniciar(q, enrularlo);
  osc = new OscP5(this, 12345); // parametros: puntero a processing y puerto

  //inicialización
  //por defecto el rango es 0-100
  gestorAmp = new GestorSenial( minimoAmp, maximoAmp, f );
  gestorPitch = new GestorSenial( minimoPitch, maximoPitch, f );
}
void draw() {
  background(0);

  gestorAmp.actualizar( amp );
  gestorPitch.actualizar( pitch );
  float contenido = sin(q/2);
  float contenidoMap = map(contenido, -1, 1, -1.5, 2);
  flujo.dibujar(separacion, w);

  if (gestorAmp.filtradoNorm()>0.4) {
    haySonido=true;
    inc=0.5;
  } else {
    haySonido=false;
  }

  if (haySonido==true && enrularlo>0.009) {
    enrularlo-=0.01;
  }

  marcaDeTiempo=millis();
  if (haySonido==false && enrularlo<=0.6 && marcaDeTiempo > marcaDeTiempoA+tiempo) {
    desordenar=true;
  }

  if (desordenar==true) {
    enrularlo+=0.01;
    flujo.iniciar(contenidoMap, enrularlo);
    marcaDeTiempoA=marcaDeTiempo;
  }

  if (gestorPitch.filtradoNorm()>0.6 && w<=3 && contador>0 && contador<2) {
    w++;
  } else if (gestorPitch.filtradoNorm()<0.6 && w>0 && contador>0 && contador<2) {
    w--;
  }
  if (gestorPitch.derivadaNorm()>0 && haySonido==true ) {
    q-=inc;
    flujo.iniciar(contenidoMap, enrularlo);
  } else if (gestorPitch.derivadaNorm()<0 && haySonido==true) {
    q+=inc;
    flujo.iniciar(contenidoMap, enrularlo);
  }

  if (haySonido==true || enrularlo>0.6) {
    desordenar=false;
  }



  if (haySonido==true) {
    contador++;
  } else contador=0;



  println(enrularlo, haySonido, marcaDeTiempoA/1000, desordenar);
}

void oscEvent( OscMessage m) {

  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
    //println("amp: " + amp);
  }

  if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
    //println("pitch: " + pitch);
  }
}
