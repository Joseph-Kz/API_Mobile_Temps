import 'package:flutter/material.dart';

import 'meteo.dart';

class MeteoDetail extends StatelessWidget {
  const MeteoDetail(this.maMeteo, {Key? key}) : super(key: key);
  
  final Meteo maMeteo;

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.air, color: Colors.white,),
                  SizedBox(height: 2,),
                  Text("10 Km/H",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                  ),
                  ),
                  SizedBox(height: 2,),
                  Text("Vent",
                  style: TextStyle(
                    color: Colors.black54, 
                    fontSize: 15
                  ),),
                ],
              ),

              Column(
                children: [
                  Icon(Icons.air, color: Colors.white,),
                  SizedBox(height: 2,),
                  Text("10 %",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                  ),
                  ),
                  SizedBox(height: 2,),
                  Text("Humidité",
                  style: TextStyle(
                    color: Colors.black54, 
                    fontSize: 15
                  ),),
                ],
              ),
            ],
          );
  }
}