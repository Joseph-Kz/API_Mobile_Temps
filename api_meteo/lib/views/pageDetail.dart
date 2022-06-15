// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import '../models/meteo.dart';
import '../models/meteoDetail.dart';


class PageDetail extends StatelessWidget {
  const PageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(children: [
        MeteoProchain(),
        CinqJours()
      ],),
    );
  }
}

class CinqJours extends StatelessWidget {
  const CinqJours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 10),
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Lun",
              style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 135,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("assets/rainy_2d.png"), width: 40,
                    ),
                    SizedBox(width: 15,),
                    Text("Rainy",
                      style: TextStyle(fontSize: 20)
                    ,)
                  ],
                ),
              ),
              Row(
                children: [
                  Text("+ 29 \u00B0", 
                  style: TextStyle(fontSize: 20)
                  ,),
                  SizedBox(
                    width: 5,
                  ),
                  Text("+ 18 \u00B0", 
                  style: TextStyle(fontSize: 20, color: Colors.grey)
                  )
                ],
              )
            ],)
        
        );
      })
    );
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
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60)
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                ),),
              Row(children: [
                Icon(Icons.calendar_month_outlined, color: Colors.white,),
                Text("5 jours",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ,)
              ],),
              Icon(Icons.more_vert, color: Colors.white,)
            ],
          ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/thunder.png")
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Demain",
                    style: TextStyle(fontSize: 23, height: 0.1),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            "36",
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("/ 29 \u00B0",
                          style: TextStyle(
                            color: Colors.black54.withOpacity(0.4),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("sunny",
                    style: TextStyle(
                      fontSize: 15
                    )
                    ,)
                  ],
                ),
              ],
            ),
            ),
            Padding(padding: EdgeInsets.only(
              bottom: 20, right: 40, left: 40
            ),
            child: Column(children: [
              Divider(color: Colors.white,),
              SizedBox(height: 2,),
              MeteoDetail(meteoJour[0]),
            ],
            ),
            )
        ],
      ),
    );
  }
}