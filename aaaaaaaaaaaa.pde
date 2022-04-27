Flujo flujo;
PVector a;
Gestor_Interaccion gestor;
  Paleta paleta;
int l;
float inc;
float q;
float b;
void setup(){
flujo=new Flujo(5);
gestor= new Gestor_Interaccion();
fullScreen();
//size(1200,600);
inc=1;
paleta=new Paleta("images.jpeg");
b= random(55,60);


}
void draw(){
 
  background(0);
gestor.actualizar();
flujo.iniciar(q);
flujo.dibujar(l);


if((width/height)==2 && l<=b && mousePressed==true){
l+=inc;

}
else if((width/height)!=2 && mousePressed==true&&l<=b){ l+=inc;}
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
