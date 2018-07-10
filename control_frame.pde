/*

  VENTANA DEL PANEL DE CONTROL
  
*/

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
