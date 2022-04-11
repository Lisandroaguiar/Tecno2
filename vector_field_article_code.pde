int margin_x = 0;
int margin_y =0;
int len = 20;
int w, h;
int cols, rows;
float off;

Cell grid[][];
PGraphics field;

color[][] colors;

PVector vector_field (float x, float y) {
  x = map(x, 0, width, -3, 3);
  y = map(y, 0, height, -3, 3);
  
  float u = PI*sin(y);
  float v = x;
  
  return new PVector(u, v);
}

void setup () {
  size(630, 630);
 noStroke();
  background(255);
  colorMode(HSB);
 
  cols = floor(width / len);
  rows = floor(height / len);
  
  grid = new Cell[cols][rows];
  


  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i, j);
      
      grid[i][j].show();
    }
  }
  

}
