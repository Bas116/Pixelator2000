/*
  CUBO
 */

class Cube {

  // Atributos
  float cube_size; // Antes pointillize
  int x;
  int y;
  color pix;
  int index;

  // Constructor
  Cube (int xpos, int ypos, color col, float vol, int _i) {
    x = xpos;
    y = ypos;
    pix = col;
    cube_size = vol;
    index = _i;
  }

  /*
    PINTAMOS EL CUBO
  */
  void display() {
    pushMatrix();
    fill(pix, cube_size * 2);
    translate(x, y, cube_size * -10);
    box(cube_size, cube_size, cube_size);
    popMatrix();
    // println("["+index+"] " + pix + " " + cube_size + " " + x + " " + y);
  }

  // Actualizamos
  void update() {
    /*
      Aquí podriamos animar movidas.
      Rotaciones, tamaños, etc..
    */
  }
}
