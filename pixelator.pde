/*
  PIXELATOR
 */

class Pixelator {
  // Atributos
  public PImage img;
  // Array de cubos
  ArrayList<Cube> myCubes = new ArrayList<Cube>();
  // Tamaño mín y máx de los cubos  
  int smallPoint = 4;
  int largePoint = 40;
  //
  int limit = 1000;
  boolean rendering = false;
  boolean clear = false;

  // Constructor
  Pixelator() {
    println("=======================");
    println("Eh aquí, Pixelator2000!");
    println("=======================");
  }

  /*
    CALCULAMOS CUBOS
   */
  public void calculate() {
    for (int i = 0; i < limit; i++) {
      float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
      int x = int(random(img.width));
      int y = int(random(img.height));
      int pix = img.get(x, y);
      myCubes.add(new Cube(x, y, pix, pointillize, i));
    }
  }

  /*
    PINTAMOS COSAS BONICAS
   */
  void display() {
    // Limpiamos pantalla
    if (clear == true) {
      background(0);
      clear = false;
    }
    // Iteramos los cubos pa pintarlos
    if (rendering == true) {
      for (Cube c : myCubes) {
        c.display();
      }
    }
  }

  void update() {
  }
}
