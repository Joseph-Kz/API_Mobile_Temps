// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:jiffy/jiffy.dart';

import '../models/city4H.dart';
import '../models/meteoDetail.dart';
import '../services/day_API.dart';
import '../utiles/Descriptionmeteo.dart';

class PageDetail extends StatelessWidget {
  const PageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [MeteoProchain(), CinqJours()],
      ),
    );
  }
}

class CinqJours extends StatelessWidget {
  CinqJours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 39,
            itemBuilder: (BuildContext context, i) {
              return FutureBuilder<City4H>(
                  future: get4HInfo("Lyon"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: Text("Chargement en cours..."));
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 15, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Jiffy(snapshot.data!.list![i].dtTxt)
                                    .format('E    HH:mm')
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Container(
                                width: 135,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: AssetImage(weatherStatus(snapshot
                                          .data!.list![i].weather![0].main)),
                                      width: 40,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      snapshot.data!.list![i].weather![0].main
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    snapshot.data!.list![i].main!.tempMax!
                                            .toInt()
                                            .toString() +
                                        "\u00B0",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      snapshot.data!.list![i].main!.tempMin!
                                              .toInt()
                                              .toString() +
                                          "\u00B0",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey))
                                ],
                              )
                            ],
                          ));
                    } else {
                      return const Text("Une error est survenue.");
                    }
                  });
            }));
  }
}

class MeteoProchain extends StatelessWidget {
  const MeteoProchain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      color: Colors.green,
      glowColor: Colors.green,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      child: FutureBuilder<City4H>(
          future: get4HInfo("Lyon"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: Text(
                "Chargement en cours...",
                style: TextStyle(color: Colors.white),
              ));
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30, right: 20, left: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "Détail",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(weatherStatus(
                                    snapshot.data!.list![8].weather![0].main))),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Demain",
                              style: TextStyle(
                                  fontSize: 23,
                                  height: 0.1,
                                  color: Colors.white),
                            ),
                            Container(
                              height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GlowText(
                                    snapshot.data!.list![8].main!.tempMax!
                                        .toInt()
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "/ " +
                                        snapshot.data!.list![12].main!.tempMin!
                                            .toInt()
                                            .toString() +
                                        "\u00B0",
                                    style: TextStyle(
                                        color: Colors.black54.withOpacity(0.4),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data!.list![12].weather![0].description
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, right: 40, left: 40),
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MeteoDetail4H(),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Text(
                "Une error est survenue.",
                style: TextStyle(color: Colors.white),
              );
            }
          }),
    );
  }
}
