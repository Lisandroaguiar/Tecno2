class Celda {
  int i, j;  
  PVector vec; //vector asociado a la grilla
Trazo trazo;
  float arg; //argumento del vector
  float mag; //magnitud del vector
   
  Celda (int _i, int _j) {
    i = _i;
    j = _j;
  trazo=new Trazo();
    float x = (i + 0.5) * len; //Se calcula la mitad de cada celda y un vector correspondiente
    float y = (j + 0.5) * len;
    colorMode(HSB);
    vec = campo(x, y); //Aca se asocia el vector del campo a la grilla
    mag = vec.mag();  //distancia entre el punto inicial P y el punto final Q
    arg = vec.heading(); // El argumento de un vector es el ángulo que forma el vector con el semieje X positivo
  }
  
  void dibujar() {
    if (mag != 0) //la magnitud debe ser distinta a 0 pues no existiria vector
    
   {
      push();
int r = int(random(50,150));
  
 stroke(0.1);
      float l = len;
     
  
      translate((i + 0.5) * l, (j + 0.5) * l); // lo translada al medio de cada celda
      rotate(arg); //lo rota el argumento, recordemos que el argumento es un angulo
      trazo.dibujar(12);
       pop();
    }
  }
}
