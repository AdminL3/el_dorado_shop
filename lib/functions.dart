import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Functions {

  static int getidbycard(String card) {
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
      'Reisetagebuch'
    ];
    return namen.indexOf(card);
  }
  static String getcardbyid(int id) {
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
      'Reisetagebuch'
    ];
    return namen[id];
  }
  static String getImagePathById(int id) {
    List<String> imageNames = [
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
    ];

    if (id >= 0 && id < imageNames.length) {
      return 'assets/images/${imageNames[id]}.png';
    } else {
      debugPrint('Couldnt load Image');
      return 'assets/images/X.png';
    }
  }
}
