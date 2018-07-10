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
  
  // TIPO DE OBJETO
  final int CUBES = 0;
  final int SPHERES = 1;
  final int VERTICES = 2;
  // POR DEFECTO
  int type = CUBES;

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
    if (type == CUBES) {
      box(cube_size, cube_size, cube_size);
    } else if (type == SPHERES) {
      sphere(cube_size);
    } else if (type == VERTICES) {
      ellipse(0, 0, cube_size, cube_size);
    } else {
    }
    popMatrix();
    // println("["+index+"] " + pix + " " + cube_size + " " + x + " " + y);
  }
  
  void change_type(int _t) {
    type = _t;
  }

  // Actualizamos
  void update() {
    /*
      Aquí podriamos animar movidas.
      Rotaciones, tamaños, etc..
    */
  }
}
