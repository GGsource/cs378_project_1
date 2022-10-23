import 'package:flutter/material.dart';

// OptionInfo -
// This is the object that gets passed from the main screen to the routes for
// each specific option.
class OptionInfo {
  String imageTitle;
  String fileName;
  String imageDescription;
  String imageAddress;
  String altFileName;
  String altDescription;
  String altImageAddress;
  bool isAltMode = false;
  MaterialColor swatch;

  OptionInfo(
      {required this.imageTitle,
      required this.fileName,
      required this.imageDescription,
      required this.imageAddress,
      required this.altFileName,
      required this.altDescription,
      required this.altImageAddress,
      required this.swatch});
}

// getTitleStyle -
//Returns a consistent TextStyle to apply to titles across different locations
TextStyle getTitleStyle({double fontSize = 45}) {
  return TextStyle(
    color: Colors.white, //Title color
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
