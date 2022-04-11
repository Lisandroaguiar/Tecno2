class Cell {
  int i, j; 
  int C=7;
  PVector vec;
// PImage trazo[];
  float arg;
  float mag;
  Paleta paleta;
  Trazo trazo[];
//PImage trazoo;
  Cell (int _i, int _j) {
    i = _i;
    j = _j;
      colorMode(HSB);
     noStroke();
    float x = (i + 0.5) * len;
    float y = (j + 0.5) * len;
   //trazoo=loadImage("Trazo0.png");
   trazo=new Trazo[C];
    vec = vector_field(x, y);
    mag = vec.mag();
    arg = vec.heading();
   // trazo= new PImage[C]; 
   for(int s=0; s<C; s++){
    trazo[s]= new Trazo();
 
 }

  }
  
  void show () {
    
    if (mag != 0) {
      push();
     
      //stroke(0);
  
     
      float l = len;
      float buffer = 5;
  
      translate((i + 0.5) * l, (j + 0.5) * l);
      rotate(arg);
    float r=random(100,150);
     
        fill(r,r,r);
        
        //ellipse(-l/2 + buffer,10, l/2 - buffer,10);
         for(int s=0; s<C; s++){
   trazo[s].dibujar(11);
 
 }
      //image(trazo[cual],-l/2 + buffer, l/2 - buffer);
      //image(trazoo,10,10);
      translate(l/2 - buffer, 0);
   pop();
    }
  }
}
