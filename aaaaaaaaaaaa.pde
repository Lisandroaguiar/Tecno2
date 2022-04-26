Flujo flujo;
PVector a;
Gestor_Interaccion gestor;
  Paleta paleta;
int l;
float inc;
float q;
void setup(){
flujo=new Flujo(10);
gestor= new Gestor_Interaccion();
size(600,600);
inc=1;
paleta=new Paleta("paleta2.jpeg");



}
void draw(){
 
  background(0);
gestor.actualizar();
flujo.iniciar(q);
flujo.dibujar(l);
//flujo.dibujar();

if(mousePressed==true&&l<=55){
l+=inc;
loop();
}
else if(gestor.derecha||gestor.izquierda) {
q=noise(0.1);

}
else if(gestor.abajo && l<=56){ l-=inc*2;


}
else if(gestor.arriba) {noLoop();}
else {q=0;

}
println(l);
}
void mouseClicked(){

loop();
}
