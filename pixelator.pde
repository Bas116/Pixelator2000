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
  // Número máximo de cubos a generar
  int limit = 15000;
  // Variables varias
  boolean rendering = false;
  boolean clear = false;
  
  // TIPO DE OBJETO
  // También declarado dentro de CUBE
  final int CUBES = 0;
  final int SPHERES = 1;
  final int VERTICES = 2;
  // POR DEFECTO
  int object_type = CUBES;
  

  // Constructor
  Pixelator() {
    println("=======================");
    println("Eh aquí, Pixelator2000!");
    println("=======================");
  }

  /*
    CALCULAMOS CUBOS
   */
  void update() {
    
    if ((myCubes.size() > limit) || (img == null)) return;
    
    float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    int x = int(random(img.width));
    int y = int(random(img.height));
    int pix = img.get(x, y);
    myCubes.add(new Cube(x, y, pix, pointillize, myCubes.size(), pointillize));
  }

  /*
    PINTAMOS COSAS BONICAS
   */
  void display() {
    // Limpiamos pantalla
    if (clear == true) {
      background(0);
      // clear = false;
    }
    // Iteramos los cubos pa pintarlos
    if (rendering == true) {
      for (Cube c : myCubes) {
        c.change_type(object_type);
        c.display();
      }
    }
  }

  /*
    CAMBIAMOS TIPO DE OBJETO
  */
  void change_type(int _t) {
    object_type = _t;
  }
  
  // VACIAR ARRAR DE CUBOS
  // Falta testear
  void clear_cubes() {
    for (int i = myCubes.size() - 1; i >= 0; i--) {
      myCubes.remove(i);
    }
  }
}
