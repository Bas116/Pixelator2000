import controlP5.*;
import peasy.*;

PeasyCam cam;
ControlFrame cf;
Pixelator p;

PImage thmb;      // thmb, molaría en controlFrame

void settings() {
  fullScreen(P3D);
}

/*
  SETUP PRINCIPAL
*/
void setup() {
  cf = new ControlFrame(this, 400, 600, "Controls");
  cam = new PeasyCam(this, 800);
  
  // Configuramos escena
  // igual no debería ir aquí
  background(0);
  lights();
  noStroke();

  // Instanciamos Pixelator
  p = new Pixelator();
}

/*
  DRAW PRINCIPAL
*/
void draw() {
  // background(0);
  p.update();
  p.display();
}
