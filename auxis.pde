/*

  Archivo de funciones auxiliares

*/

/*
  GUARDAR IMAGEN EN PNG
*/
void save_png() {
  if (rendering == true) noLoop();
  saveFrame(get_file_name(".png"));
  if (rendering == true) loop();
}

/*
  DEVUELVE NOMBRE DE ARCHIVO
*/
static final String get_file_name(final String ext) {
  return "../exports/" + year() + nf(month(), 2) + nf(day(), 2) +
    nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ext;
}
