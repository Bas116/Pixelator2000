/*

 VENTANA DEL PANEL DE CONTROL
 
 */

public class ControlFrame extends PApplet {
  // Atributos
  int w, h;
  PApplet parent;
  ControlP5 cp5;

  // Constructor
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
  Slider Z;
  Slider Alfa;
  Slider Size;

  public void setup() {
    noStroke();
    background(0);
    cp5 = new ControlP5(this);

    cp5.addBang("load_image")
      // Cambio a load_image, así pilla la función directamente
      // sin tener que tirar al eventController
      .setPosition(20, 540)
      .setSize(40, 40)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("Cargar imagen")
      ;        
    cp5.addBang("procesar_imagen")
      .setPosition(300, 500)
      .setSize(80, 80)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("Procesar imagen")
      ;
    cp5.addBang("reiniciar_visor")
      .setPosition(320, 400)
      .setSize(50, 50)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("clear_output")
      ;

    /* cp5.addBang("guardar_png")
     .setPosition(20, 480)
     .setSize(50, 50)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("save_png")
     ;
     */
    cp5.addSlider("Z")
      .setPosition(20, 300)
      .setSize(100, 20)
      .setRange(0, 255)
      .setLabel("Profundidad");
    ;
    cp5.addSlider("Alfa")
      .setPosition(20, 340)
      .setSize(100, 20)
      .setRange(0, 255)
      .setLabel("Transparencia");
    ;
    cp5.addSlider("Size")
      .setPosition(20, 380)
      .setSize(100, 20)
      .setRange(0, 255)
      .setLabel("Profundidad");
    ;
    cp5.addBang("type_cubes")
      .setPosition(20, 420)
      .setSize(20, 20)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("Cubos");
    ;
    cp5.addBang("type_spheres")
      .setPosition(60, 420)
      .setSize(20, 20)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("Esferas");
    ;
    cp5.addBang("type_vertexs")
      .setPosition(100, 420)
      .setSize(20, 20)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("Círculos");
    ;
  }

  public void draw() {
    background(0);
    if ( thmb != null ) {
      showThumb();
    }
  }

  public void controlEvent(ControlEvent theEvent) {
    /*    
     if (theEvent.getController().getName().equals("cargar_imagen")) {
     load_image();
     println("cargando imagen");
     }
     */
    if (theEvent.getController().getName().equals("procesar_imagen")) {
      p.rendering = !p.rendering;
      println("procesando imagen");
    }
    if (theEvent.getController().getName().equals("reiniciar_visor")) {
      p.clear = true;
      println("visor reiniciado");
    }
    if (theEvent.getController().getName().equals("guardar_png")) {
      save_png();
      println("PNG guardado.");
    }
  }

  /*
    CARGAMOS IMAGEN
   */
  void load_image() {
    selectInput("Select an image", "imageChosen");
  }
  // COMPROBAMOS IMAGEN CARGADA
  void imageChosen( File f ) {
    if ( f.exists() ) {
      p.img = loadImage( f.getAbsolutePath() );
      thmb = loadImage( f.getAbsolutePath() );
    }
  }

  /*
    CAMBIAMOS TIPO DE OBJETO
   */
  void type_cubes() {
    p.change_type(p.CUBES);
  }
  void type_spheres() {
    p.change_type(p.SPHERES);
  }
  void type_vertexs() {
    p.change_type(p.VERTICES);
  }

  /*
    MOSTRAMOS MINIATURA
   */
  void showThumb() {
    thmb.resize (0, height/3);
    image( thmb, ((width/2)-(thmb.width/2)), 20);
  }
}
