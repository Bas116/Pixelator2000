/*
  CUBO
*/

class Cube {
  // Atributos
  float pointillize;
  int x;
  int y;
  color pix;
  
  // Constructor
  Cube (int xpos, int ypos, color col, float vol) {
    x=xpos;
    y=ypos;
    pix =col;
    pointillize=vol;
  }
  
  // A pintar
  void display() {
    C1.update();
    fill(pix, pointillize*2);
    translate(x, y, pointillize*-10);
    box(pointillize, pointillize, pointillize);
  }
  
  // Actualizamos
  void update() {
    pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    x = int(random(img.width));
    y = int(random(img.height));
    pix = img.get(x, y);
   // myCubes.add(new Cube(x, y, pix, pointillize));
  }
}
