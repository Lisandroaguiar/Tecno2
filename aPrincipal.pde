
import oscP5.*;
//variables de calibración

float minimoAmp = 45; 
float maximoAmp = 100; 

float minimoPitch = 50;
float maximoPitch = 80;

float f = 0.9;
boolean haySonido=false;
boolean sonidoCorto=false;
OscP5 osc; // declaracion del objeto osc

float amp = 0.0;
float pitch = 0.0;
GestorSenial gestorAmp;
GestorSenial gestorPitch;

Flujo flujo;
Gestor_Interaccion gestor;
Paleta paleta;
float q;
float inc=0.05;
int w=int(random(4));
void setup() {
  background(0);
  flujo=new Flujo(3);
  gestor= new Gestor_Interaccion();
  fullScreen();
  flujo.iniciar(q);
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
  
  flujo.dibujar(10, w);
  gestor.actualizar();
if(gestorAmp.filtradoNorm()>0.9){
haySonido=true;
inc=0.1;}
if(gestorAmp.filtradoNorm()>0.7){
haySonido=true;
inc=0.07;}
if(gestorAmp.filtradoNorm()>0.4){
haySonido=true;
inc=0.05;}
else{haySonido=false;}
  if (haySonido==true) //que haya ruido
  {
    q+=inc;
    flujo.iniciar(q);
    
  }
  if (q>2.5) //que haya ruido
  {
    inc= inc*-1;
  }
    if (q<-1.5) //que haya ruido
  {
    inc= inc*-1;
  }
  if (gestorPitch.filtradoNorm()>0.6 && w<=2) {
    w++;
  } //ruido agudo corto
  else if (gestorPitch.filtradoNorm()<0.6 && w>0) {
    w--;
  } //ruido grave y corto
  //flujo.quepaleta();
// println(q);
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
