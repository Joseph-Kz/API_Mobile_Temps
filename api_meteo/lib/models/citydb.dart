class CityModel {
  final int id;
  final String city;

  CityModel({required this.id, required this.city});

  factory CityModel.fromMap(Map<String, dynamic> json) =>
      CityModel(id: json["id"], city: json["city"]);

  Map<String, dynamic> toMap() {
    return {'id': id, 'city': city};
  }
}
