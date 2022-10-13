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
