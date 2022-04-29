Flujo flujo;

PVector a;
Gestor_Interaccion gestor;
Paleta paleta;
int l;
float inc;
float q;
float b;
float m;
void setup() {
  background(0);
  flujo=new Flujo(5);
  gestor= new Gestor_Interaccion();
  fullScreen();
  flujo.iniciar(q); 
}
void draw() {background(0);

   flujo.dibujar(10);
  gestor.actualizar();

  if (mousePressed==true) {  q+=0.1;
     flujo.iniciar(q); 
  
    l+=inc;}

  if(gestor.derecha){println("abajo"); q=0; flujo.iniciar(q);  }
  //flujo.quepaleta();
}
