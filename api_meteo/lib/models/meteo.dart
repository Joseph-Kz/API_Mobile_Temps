class Meteo{

  final String nom, temps;
  final double kelvin;

  Meteo(this.nom, this.temps, this.kelvin);
}

List<Meteo> meteoJour = [
  Meteo("Paris", "Clear", 297.15),
  Meteo("Lyon", "Clear", 297.15),
  Meteo("London", "Sun", 297.15),
  Meteo("Miami", "Clouds", 297.15)
];