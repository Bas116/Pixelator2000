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

class ControlFrame extends PApplet {
  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    noStroke();
    background(0); 
    cp5 = new ControlP5(this);

    cp5.addBang("cargar_imagen")
      .setPosition((width/2)-140, 250)
      .setSize(280, 40)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("Cargar imagen")
      ;        
    cp5.addBang("procesar_imagen")
      .setPosition((width/2)-50, 300)
      .setSize(100, 80)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("Procesar imagen")
      ;
    cp5.addBang("reiniciar_visor")
      .setPosition((width/2)-50, 400)
      .setSize(50, 50)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("clear_output")
      ;
    cp5.addBang("guardar_png")
      .setPosition((width/2)-50, 480)
      .setSize(50, 50)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("save_png")
      ;
  }

  public void draw() {
    if ( thmb != null ) {
      showThumb();
    }
  }
  public void controlEvent(ControlEvent theEvent) {
    if (theEvent.getController().getName().equals("cargar_imagen")) {
      load_image();
      println("cargando imagen");
    }
    if (theEvent.getController().getName().equals("procesar_imagen")) {
      rendering = !rendering;
      println("procesando imagen");
    }
    if (theEvent.getController().getName().equals("reiniciar_visor")) {
      clear=true;
      println("visor reiniciado");
    }
    if (theEvent.getController().getName().equals("guardar_png")) {
      save_png();
      println("PNG guardado.");
    }
  }
  void showThumb() {
    thmb.resize (0, height/3);
    image( thmb, ((width/2)-(thmb.width/2)), 20);
  }
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
class Cube {
  float pointillize;
  int x;
  int y;
  color pix;
  Cube (int xpos, int ypos, color col, float vol) {
    x=xpos;
    y=ypos;
    pix =col;
    pointillize=vol;
  }
  void display() {
    C1.update();
    fill(pix, pointillize*2);
    translate(x, y, pointillize*-10);
    box(pointillize, pointillize, pointillize);
  }
  void update() {
    pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    x = int(random(img.width));
    y = int(random(img.height));
    pix = img.get(x, y);
   // myCubes.add(new Cube(x, y, pix, pointillize));
  }
}
