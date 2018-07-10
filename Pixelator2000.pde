import controlP5.*;
import peasy.*;

PeasyCam cam;
// ControlP5 cp5;
ControlFrame cf;
// Cube C1 = new Cube(0, 0, 0, 0);
Pixelator p;

PImage thmb;      // thmb, molaría en controlFrame
int control = 0;  // Creo que no se usa


void settings() {
  fullScreen(P3D);
}

void setup() {
  cf = new ControlFrame(this, 400, 600, "Controls");
  cam = new PeasyCam(this, 800);
  
  // Configuramos escena
  // igual no debería ir aquí
  background(0);
  lights();
  noStroke();

  p = new Pixelator();
}

void draw() {
  p.display();
}
