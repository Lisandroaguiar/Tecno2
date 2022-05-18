class Gestor_Interaccion
{
  Dir_y_Vel mouse;
  boolean seMoviaEnElFrameAnterior;
  boolean arriba;
  boolean abajo;
  boolean derecha;
  boolean izquierda;

  Gestor_Interaccion() {


    mouse=new Dir_y_Vel();
  }

  void actualizar() {
    mouse.calcularTodo(mouseX, mouseY);
    boolean seMueveElMouseEnEsteFrame=false;
    float sensibilidad=35;
    if (mouse.velocidad()>sensibilidad) {
      seMueveElMouseEnEsteFrame=true;
    }
    arriba=false;
    abajo=false;
    derecha=false;
    izquierda=false;
    if (seMueveElMouseEnEsteFrame && !seMoviaEnElFrameAnterior) {
      arriba=mouse.direccionY()<-sensibilidad-25?true:false;
      abajo=mouse.direccionY()>sensibilidad?true:false;
      derecha=mouse.direccionX()>sensibilidad?true:false;
      izquierda=mouse.direccionX()<-sensibilidad?true:false;
    }
    seMoviaEnElFrameAnterior=seMueveElMouseEnEsteFrame;
  }
}
