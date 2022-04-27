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
  inc=1;
}
void draw() {
  background(0);
  flujo.dibujar(l);
  flujo.iniciar(q);
  gestor.actualizar();

  if (mousePressed==true && l<10) {
    l+=inc;
  } else if (mousePressed==true) {
    q=random(0.1);
  } else if (gestor.abajo) {
    l-=inc*2;
  } else {
    q=0;
  }
  flujo.quepaleta();
}
