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
}
void draw() {
  background(0);

  flujo.dibujar(10, w);
  gestor.actualizar();

  if (mousePressed==true && q<3.3) //que haya ruido
  {
    q+=inc;
    flujo.iniciar(q);
  }
 if(mousePressed==true && q>3.3){
inc=-0.05;
}
  if (gestor.derecha && w<=2) {
    w++;
  } //ruido agudo corto
  else if (gestor.izquierda && w>0) {
    w--;
  } //ruido grave y corto
  //flujo.quepaleta();
  println(q);
}
