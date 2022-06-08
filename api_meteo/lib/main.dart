import 'package:flutter/material.dart';

import 'models/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meteo Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.black, displayColor: Colors.green)),
      home: const HomePage(),
    );
  }
}
