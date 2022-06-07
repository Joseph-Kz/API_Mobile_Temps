// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

// import '../models/city.dart';
// import '../models/citydb.dart';
// import '../services/day_API.dart';
// import '../db/sqflite_service.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   TextEditingController cityController = TextEditingController();
//   List<CityModel> datas = [];
//   bool fetching = true;

//   late SqliteService db;
//   @override
//   void initState() {
//     super.initState();
//     db = SqliteService();
//     getData2();
//   }

//   void getData2() async {
//     datas = await db.getData();
//     setState(() {
//       fetching = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               showDialogue();
//             }),
//         body: fetching
//             ? CircularProgressIndicator()
//             : Center(child: Text(datas[0].city))
        // drawer: Drawer(
        //   child: ListView(
        //     children: const <Widget>[
        //       DrawerHeader(
        //           // decoration: BoxDecoration(
        //           //     // color: Color.fromARGB(255, 255, 255, 255),
        //           //     ),
        //           child: Center(
        //         child: Text(
        //           'My Cities',
        //           style: TextStyle(
        //             color: Color.fromARGB(255, 0, 0, 0),
        //             fontSize: 30,
        //           ),
        //         ),
        //         // ElevatedButton())
        //       )),
        //       ListTile(title: Text('City 1'), trailing: Icon(Icons.delete)),
        //     ],
        //   ),
        // ),
        // body: FutureBuilder<City>(
        //     future: getInfoData(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(child: Text("Chargement en cours..."));
        //       } else if (snapshot.connectionState == ConnectionState.done) {
        //         return ListTile(
        //           title: Text(snapshot.data!.name.toString()),
        //         );
        //       } else {
        //         return const Text("Une error est survenue. ");
        //       }
        //     }),
        // );
//   }

//   void showDialogue() async {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//               content: Container(
//                   height: 150,
//                   child: Column(children: [
//                     TextFormField(
//                       controller: cityController,
//                       decoration: InputDecoration(labelText: 'City'),
//                     )
//                   ])),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     db.inertData(CityModel(city: cityController.text));
//                     Navigator.pop(context);
//                   },
//                   child: Text("Save"),
//                 )
//               ]);
//         });
//   }
// }

import 'package:api_meteo/models/citydb.dart';
import 'package:flutter/material.dart';


import '../db/sqflite_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityController = TextEditingController();
  TextEditingController subcityController = TextEditingController();
  List<CityModel> datas = [];
  bool fetching = true;
  int currentIndex = 0;

  late SqliteService db;
  @override
  void initState() {
    super.initState();
    db = SqliteService();
    getData2();
  }

  void getData2() async {
    datas = await db.getData();
    setState(() {
      fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sqflite Tutorial"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMyDilogue();
        },
        child: Icon(Icons.add),
      ),
      body: fetching
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) => DataCard(
                data: datas[index],
                edit: edit,
                index: index,
                delete: delete,
              ),
            ),
    );
  }

  void showMyDilogue() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(14),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(labelText: "title"),
                  ),
                  
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  CityModel dataLocal = CityModel(
                      city: cityController.text,
                      
                  db.inertData(dataLocal);
                  dataLocal.id = datas[datas.length - 1].id! + 1;
                  setState(() {
                    datas.add(dataLocal);
                  });
                  cityController.clear();
                  subcityController.clear();
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ],
          );
        });
  }

  void showMyDilogueUpdate() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(14),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(labelText: "title"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: subcityController,
                    decoration: InputDecoration(labelText: "Subtitle"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  CityModel newData = datas[currentIndex];
                  newData.city = cityController.text;
                  db.update(newData, newData.id!);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Text("Update"),
              ),
            ],
          );
        });
  }

  void edit(index) {
    currentIndex = index;
    cityController.text = datas[index].city;
    showMyDilogueUpdate();
  }

  void delete(int index) {
    db.delete(datas[index].id!);
    setState(() {
      datas.removeAt(index);
    });
  }
}