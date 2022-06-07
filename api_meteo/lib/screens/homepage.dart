import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';
import '../services/day_API.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<City>(
          future: getInfoData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text("Chargement en cours..."));
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListTile(
                title: Text(snapshot.data!.name.toString()),
              );
            } else {
              return const Text("Une error est survenue. ");
            }
          }),
    );
  }
}
