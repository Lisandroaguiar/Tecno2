class Flujo{
  Trazo trazo;
Paleta p;
PVector grilla[][];
int columna, fila;
int r;
float b;
Flujo(int a ){
  r=a;
  columna= width/r;
  fila= height/r;
  grilla=new PVector[columna][fila];
  iniciar(b);
  p=new Paleta("paleta6.png");
trazo=new Trazo();

}

void iniciar(float a){
float xoff=0;
for(int i=0; i<columna; i++){
float yoff=0;
for(int j=0; j<fila; j++){
float theta= map(noise(xoff,yoff),0,1,0,PI*2);
grilla[i][j]=PVector.fromAngle(theta+a);
yoff += 0.1;
}
xoff+=0.1;

}




}
void dibujar(int l){

for(int i=0; i<columna; i++){
for(int j=0; j<fila; j++){

dibujarVector(grilla[i][j],i*(l*(width/height)/5),j*(l*(width/height)/5), p);
}
}


}
void dibujarVector(PVector v, float y, float x, Paleta p){
push();
translate(x,y);
rotate(v.heading());
stroke(1);
fill(p.darUnColor());

trazo.dibujar(12);
pop();

}

}
