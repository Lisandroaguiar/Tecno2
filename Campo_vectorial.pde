int len;
int w, h;
int cols, fila;
float off;
float u;
float v;
float inc=2;
float inca=1;
float a, b;
int q=0;
int z;
int p;
Gestor_Interaccion interaccion;

Paleta paleta;
Celda grilla[][];
PVector campo (float x, float y) {
  a=-100;
  b=100;
  x = map(x, 0, width, a, b); //no se porque mapea (creo que para no ponerle valores tan altos)
  y = map(y, 0, height, a, b);

  float u =-log(abs(x)+z); //funciones que definiran la forma del campo vectorial
  float v =log(abs(y)+p); //DUDA: puedo elegir entre una funcion u otra para poner aca???? como un random pero de formulas
  return new PVector(u, v); //retorna un vector que obedece esas funciones
}
void setup () {
  z=int(random(-3, 3));//DUDA: como excluyo numeros del random?
  p=int(random(-3, 3));
  len=int(random(13, 20));
  size(630, 630);
  paleta=new Paleta("paleta.jpg");
  interaccion=new Gestor_Interaccion();
  println(q);
  background(255);
  fill(paleta.darUnColor());
}
void draw() {


  background(255);
  cols = floor(q/ len); //divide el largo por len(medida de la celda) y lo redondea para abajo
  fila = floor(q/ len); //divide el ancho por len(medida de la celda) y lo redondea para abajo
  grilla = new Celda[cols][fila];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < fila; j++) {
      grilla[i][j] = new Celda(i, j);
      grilla[i][j].dibujar();
    }
  }
  interaccion.actualizar();

  if (interaccion.derecha) {
    println("derecha");
    q+=inc*10;
  } else if (q>0&&interaccion.abajo) {
    //   fill(paleta.darUnColor());
    q-=inc*5;
  } else if (interaccion.arriba) {
    q=0;
  }
  println(len, q);
}
