import controlP5.*;
import peasy.*;

PeasyCam cam;
ControlP5 cp5;
ControlFrame cf;
Cube C1 = new Cube(0, 0, 0, 0);

PImage img;
PImage thmb;
int smallPoint, largePoint;
int limit = 1000;
int control = 0;
boolean rendering = false;
boolean clear = false;

void settings() {
  fullScreen(P3D);
  smallPoint = 4;
  largePoint = 40;
}

void setup() {
  cf = new ControlFrame(this, 400, 600, "Controls");
  background(0);
  lights();
  noStroke();
  cam = new PeasyCam(this, 800);
}

void draw() {
  process_image();
}

void process_image() { 
  if (rendering == true) {
    clear_viewer();
    C1.display();
  }
}

void clear_viewer() {
  if (clear==true) {
    background(0);
    clear=false;
  }
}
