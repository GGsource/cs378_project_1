import 'package:flutter/material.dart';

TextStyle getTitleStyle({double fontSize = 45}) {
  return TextStyle(
    color: Colors.white, //Title color
    height: 3, //Title height
    fontSize: fontSize, //Title size
    shadows: const [
      Shadow(
          //Title Shadow
          color: Colors.black,
          offset: Offset(5, 5),
          blurRadius: 10)
    ],
    fontFamily: "QuickKiss",
  );
}
