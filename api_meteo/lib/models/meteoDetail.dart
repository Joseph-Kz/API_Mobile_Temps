import 'package:flutter/material.dart';

import '../services/day_API.dart';
import 'city.dart';
import 'meteo.dart';

class MeteoDetail extends StatelessWidget {
  const MeteoDetail(this.maMeteo, {Key? key}) : super(key: key);

  final Meteo maMeteo;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<City>(
            future: getInfoData("Lyon"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text("Chargement en cours..."));
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.air,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          (snapshot.data!.wind!.speed).toString() + "Km/H",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Vent",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.air,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "10 %",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Humidité",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Text("Une error est survenue. ");
              }
            }));
  }
}
