Flujo flujo;

PVector a;
Gestor_Interaccion gestor;
Paleta paleta;
int l;
float inc;
float q;
float b;
float m;
int w=0;
void setup() {
  background(0);
  flujo=new Flujo(5);
  gestor= new Gestor_Interaccion();
  fullScreen();
  flujo.iniciar(q);
}
void draw() {
  background(0);

  flujo.dibujar(10, w);
  gestor.actualizar();

  if (gestor.abajo) //que haya ruido
  {
    q+=0.05;
    flujo.iniciar(q);

    l+=inc;
  }

  if (gestor.derecha && w<=2) {
    w++;
  } //ruido agudo corto
  else if (gestor.izquierda && w>0) {
    w--;
  } //ruido grave y corto
  //flujo.quepaleta();
}
