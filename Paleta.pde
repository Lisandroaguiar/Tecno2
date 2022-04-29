
class Paleta {
  int r= int(random(6));
  int cant=7;
  PImage paleta[];
  Paleta() {
    paleta= new PImage[cant];
    for (int i=0; i<cant; i++) {
      paleta[i]= loadImage("paleta0"+i+".png");
    }
  }

  color darUnColor(float cualNormalizado, float factor) {
    
    int cualRealX1=int(cualNormalizado*paleta[r].width);
    int cualRealY1=int(cualNormalizado*paleta[r].height);
    color color1= paleta[r].get(cualRealX1,cualRealY1);
    color color2= paleta[r+1].get(cualRealX1,cualRealY1);
   int c= lerpColor(color1,color2,factor);
    return c;
  }
}
