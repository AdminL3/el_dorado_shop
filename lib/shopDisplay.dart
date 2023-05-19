import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'customwidget.dart';
import 'dart:async';

// ignore: camel_case_types
class shopDisplay extends StatefulWidget {
  const shopDisplay({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirebaseDataPageState createState() => _FirebaseDataPageState();
}

class _FirebaseDataPageState extends State<shopDisplay> {
  bool isLoading = true;
  List<int> allekarten = [];
  List<String> allekartenstring = [];
  List<String> anzahlOrderedID = [];
  List<String> namen = [
    'Kundschafter',
    'Entdecker',
    'Tausendsassa',
    'Schatztruhe',
    'Fernsprechgerät',
    'Fotografin',
    'Pionier',
    'Mächtige Machete',
    'Abenteurerin',
    'Propellerflugzeug',
    'Journalistin',
    'Millionärin',
    'Kapitän',
    'Ureinwohner',
    'Kartograph',
    'Wissenschaftlerin',
    'Kompass',
    'Reisetagebuch',
    ''
  ];
  List<String> level = [
    '2',
    '3',
    '1',
    '4',
    ' ',
    '2',
    '5',
    '6',
    '2',
    '4',
    '3',
    '4',
    '3',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ''
  ];
  List<String> kosten = [
    '1',
    '3',
    '2',
    '3',
    '4',
    '2',
    '5',
    '3',
    '4',
    '4',
    '3',
    '5',
    '2',
    '5',
    '4',
    '4',
    '2',
    '3',
    ''
  ];
  List<Color> colors = [
    Colors.greenAccent.shade700,
    Colors.greenAccent.shade700,
    Colors.white,
    Colors.yellowAccent,
    Colors.purple,
    Colors.yellowAccent,
    Colors.greenAccent.shade700,
    Colors.greenAccent.shade700,
    Colors.white,
    Colors.white,
    Colors.yellowAccent,
    Colors.yellowAccent,
    Colors.cyan.shade400,
    Colors.purple,
    Colors.purple,
    Colors.purple,
    Colors.purple,
    Colors.purple,
    Colors.black,
  ];
  List<Color> iconcolors = [
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.black,
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchData();
    });
    setState(() {
      isLoading = false;
    });
  }

  Future<void> fetchData() async {
    allekarten.clear();
    allekartenstring.clear();
    anzahlOrderedID.clear();

    List<int> kartenvorne = [];
    List<int> kartenhinten = [];

    //get list with ids
    for (int i = 0; i < 18; i++) {
      String cardasString = i.toString();
      var firebaseShop = await FirebaseFirestore.instance
          .collection('Shop')
          .doc(cardasString)
          .get();
      var dataShop = firebaseShop.data();
      if (dataShop?['Karte ist vorne']) {
        kartenvorne.add(i);
      } else {
        kartenhinten.add(i);
      }
    }
    allekarten.addAll(kartenvorne);
    allekarten.addAll(kartenhinten);
    allekartenstring = allekarten.map((int value) => value.toString()).toList();
    int x;
    String y;
    for (int i = 0; i < allekarten.length; i++) {
      String cardasString = i.toString();
      var firebaseShop = await FirebaseFirestore.instance
          .collection('Shop')
          .doc(cardasString)
          .get();
      var dataShop = firebaseShop.data();
      x = dataShop?['Anzahl'];
      y = x.toString();
      anzahlOrderedID.add(y);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 6; i < 12; i++)
                        CustomWidget(
                          id: allekartenstring[i],
                          anzahl: anzahlOrderedID[allekarten[i]],
                          money: kosten[allekarten[i]],
                          name: namen[allekarten[i]],
                          level: level[allekarten[i]],
                          backgroundColor: colors[allekarten[i]],
                          iconcolor: iconcolors[allekarten[i]],
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 12; i < 18; i++)
                        CustomWidget(
                          id: allekartenstring[i],
                          anzahl: anzahlOrderedID[allekarten[i]],
                          money: kosten[allekarten[i]],
                          name: namen[allekarten[i]],
                          level: level[allekarten[i]],
                          backgroundColor: colors[allekarten[i]],
                          iconcolor: iconcolors[allekarten[i]],
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 6; i++)
                        CustomWidget(
                          id: allekartenstring[i],
                          anzahl: anzahlOrderedID[allekarten[i]],
                          money: kosten[allekarten[i]],
                          name: namen[allekarten[i]],
                          level: level[allekarten[i]],
                          backgroundColor: colors[allekarten[i]],
                          iconcolor: iconcolors[allekarten[i]],
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
