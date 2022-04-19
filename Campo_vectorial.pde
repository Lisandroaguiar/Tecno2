int len =25;
int w, h;
int cols, fila;
float off;
float u;
float v;
float inc=5;
float inca=1;
float a, b;
int q=60;
int z;
int p;
   Paleta paleta;
Celda grilla[][];
PVector campo (float x, float y) {
  a=-10;
  b=10;
  x = map(x, 0, width, a, b); //no se porque mapea (creo que para no ponerle valores tan)
  y = map(y, 0, height, a, b);

  float u =-log(abs(x)+z); //funciones que definiran la forma del campo vectorial
  float v =log(abs(y)+p);
  return new PVector(u, v); //retorna un vector que obedece esas funciones
}
void setup () {
  z=int(random(-3,3));
    p=int(random(-3,3));
  size(630, 630);
 paleta=new Paleta("paleta.jpg");
  println(q);
  background(255);
  int r = paleta.darUnColor();
    fill(r);
}
void draw() {
  cols = floor(q/ len); //divide el largo por len(medida de la celda)
  fila = floor(q/ len); //divide el ancho por len(medida de la celda)
  grilla = new Celda[cols][fila];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < fila; j++) {
      grilla[i][j] = new Celda(i, j);
      grilla[i][j].dibujar();
    }
  }

  if (mousePressed==true) {

    q+=inc;
  } else {
    q=10;
    len=10;
    background(255);
  }
  println(len, q);
}
