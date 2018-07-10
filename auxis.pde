/*

  Archivo de funciones auxiliares

*/

/*
  GUARDAR IMAGEN EN PNG
  Aún no funciona.
*/
void save_png() {
  if (p.rendering == true) noLoop();
  saveFrame(get_file_name(".png"));
  if (p.rendering == true) loop();
}

/*
  DEVUELVE NOMBRE DE ARCHIVO
*/
static final String get_file_name(final String ext) {
  return "../exports/" + year() + nf(month(), 2) + nf(day(), 2) +
    nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ext;
}
