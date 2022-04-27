
class Paleta {

  PImage paleta;
  Paleta(String nombreArchivo) {

    paleta= loadImage( nombreArchivo );
  }

  color darUnColor() {
    int x= int (random(paleta.width));
    int y=int (random(paleta.height));
    return paleta.get(x, y);
  }
}
