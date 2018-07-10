import controlP5.*;
import peasy.*;

PeasyCam cam;
// ControlP5 cp5; // Ya se instancia en controlFrame
ControlFrame cf;
// Cube C1 = new Cube(0, 0, 0, 0);
Pixelator p;

PImage thmb;      // thmb, molaría en controlFrame
int control = 0;  // Esto creo que no se usa


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
background(0);
  p.display();
}
