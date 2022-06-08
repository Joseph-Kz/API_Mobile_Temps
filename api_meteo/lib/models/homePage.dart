import 'package:api_meteo/models/city.dart';
import 'package:api_meteo/services/day_API.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import '../db/sqflite_service.dart';
import '../views/pageDetail.dart';
import 'citydb.dart';
import 'meteo.dart';
import 'meteoDetail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          MeteoActu(),
          MeteoJour(),
        ],
      ),
    );
  }
}

class MeteoActu extends StatelessWidget {
  const MeteoActu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 230,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 5, left: 30, right: 30),
      glowColor: Colors.green.withOpacity(0.5),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      color: Colors.green,
      spreadRadius: 5,
      child: FutureBuilder<City>(
          future: getInfoData("Lyon"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text("Chargement en cours..."));
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.reorder_rounded,
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          Text(
                            snapshot.data!.name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Actualiser",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 330,
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage("assets/sunny.png"),
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Center(
                            child: Column(
                              children: [
                                GlowText(
                                  (snapshot.data!.main!.temp!)
                                          .toInt()
                                          .toString() +
                                      "\u00B0",
                                  style: TextStyle(
                                      height: 0.1,
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  (snapshot.data!.weather![0].description)
                                      .toString(),
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  "Jour 1",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white),
                  SizedBox(
                    height: 5,
                  ),
                  MeteoDetail(meteoJour[0]),
                ],
              );
            } else {
              return const Text("Une error est survenue. ");
            }
          }),
    );
  }
}

class MeteoJour extends StatelessWidget {
  const MeteoJour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Aujourd'hui",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return PageDetail();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "5 jours",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MeteoWidget(meteoJour[0]),
                  MeteoWidget(meteoJour[0]),
                  MeteoWidget(meteoJour[0]),
                  MeteoWidget(meteoJour[0]),
                ]),
          ),
        ],
      ),
    );
  }
}

class MeteoWidget extends StatelessWidget {
  final Meteo meteo;
  MeteoWidget(this.meteo);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text((meteo.kelvin - 273.15).toString() + "\u00B0",
              style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 2,
          ),
          Image(
            image: AssetImage("assets/rainy_2d.png"),
            width: 40,
            height: 40,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "12:00",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
