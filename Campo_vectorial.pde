int len =15;
int w, h;
int cols, fila;
float off;
float u;
float v;
float inc=1;
float a,b;
Celda grilla[][];
PVector campo (float x, float y) {
  a=-10;
  b=10;
  x = map(x, 0, width, a,b); //no se porque mapea
  y = map(y, 0, height, a, b);
  
    float u =-log(abs(x)); //funciones que definiran la forma del campo vectorial
   float v =log(abs(y));
  return new PVector(u, v); //retorna un vector que obedece esas funciones
}
void setup () {
  size(630, 630);

  background(255);

  cols = floor(width / len); //divide el largo por len(medida de la celda)
  fila = floor(height / len); //divide el ancho por len(medida de la celda)
  
  grilla = new Celda[cols][fila];
  

  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < fila; j++) {
      grilla[i][j] = new Celda(i, j);
    grilla[i][j].dibujar();
    }
  }

}
