import 'package:flutter/material.dart';

class OptionInfo {
  String imageTitle;
  String fileName;
  String imageDescription;
  String altFileName;
  String altDescription;
  bool isAltMode = false;
  MaterialColor swatch;

  OptionInfo(
      {required this.imageTitle,
      required this.fileName,
      required this.imageDescription,
      required this.altFileName,
      required this.altDescription,
      required this.swatch});
}

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
