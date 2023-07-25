import 'package:flutter/material.dart';

abstract final class AppColors{
  static const Color outerBallColor = Color.fromARGB(255, 21, 184, 191);
  static const Color mediumLayerBallColor = Color.fromARGB(255, 6, 21, 166);
  static const Color innerBallColor = Color.fromARGB(255, 118, 35, 120);
  static const Color mainColor = Color.fromARGB(255, 255, 255, 255);
  static const List<Color> starColors = [
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.tealAccent,
    Colors.orange,
    Colors.white,
  ];
  static const Gradient backgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromARGB(255, 25, 12, 50), Colors.black]
  );
}