import controlP5.*;
import peasy.*;

PeasyCam cam;
ControlP5 cp5;
ControlFrame cf;
Cube C1 = new Cube(0, 0, 0, 0);

//ArrayList<Cube> myCubes = new ArrayList<Cube>();
PImage img;
PImage thmb;
int smallPoint, largePoint;
int limit = 1000;
int control = 0;
Boolean rendering = false;
Boolean clear = false;

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

void load_image() {
  selectInput("Select an image", "imageChosen");
}
void imageChosen( File f ) {
  if ( f.exists() ) {
    img = loadImage( f.getAbsolutePath() );
    thmb = loadImage( f.getAbsolutePath() );
  }
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
void save_png() {
  if (rendering == true) noLoop();
  saveFrame(get_file_name(".png"));
  if (rendering == true) loop();
}
static final String get_file_name(final String ext) {
  return "../exports/" + year() + nf(month(), 2) + nf(day(), 2) +
    nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ext;
}
