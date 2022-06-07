import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'screens/homepage.dart';
=======
import 'models/homePage.dart';
>>>>>>> d48d95ff7ceb83d4a58afbe8858409fa0ac9e7d7

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
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.green
        )
      ),
      home: const HomePage(),
    );
  }
}

