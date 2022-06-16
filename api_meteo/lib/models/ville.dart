class Ville {
  final String? name;

  Ville( 
      {this.name});
}

class Meteo{
  int id;
  String main;

  Meteo(this.id, this.main);

}

class Main{
  int pressure, humidity;
  double temp;

  Main(this.humidity, this.pressure, this.temp);
}