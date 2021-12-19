// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Globals {
  static const base_url = 'https://www.bitstamp.net/api';
  static const token = '08a5e3222b8be11a8bdcbaa455cb0f7ab1e7f608';
  static const basicTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static Color? textFieldColor = Colors.grey[200];
  static Color? themeColor = const Color.fromARGB(255, 59, 143, 185);
  static Color? customIcoColor = const Color.fromARGB(255, 39, 180, 173);
  static const smallTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w100,
  );
}

double? getHeight(BuildContext context, double percent) =>
    MediaQuery.of(context).size.height * percent / 100;
double? getWidth(BuildContext context, double percent) =>
    MediaQuery.of(context).size.width * percent / 100;
