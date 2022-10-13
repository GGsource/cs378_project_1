import 'package:cs378_project_1/option_info.dart';
import 'package:flutter/material.dart';

class RouteOption extends StatelessWidget {
  const RouteOption({super.key, required this.oInfo});

  final OptionInfo oInfo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "P1",
      home: OptionPage(
        oInfo: oInfo,
      ),
    );
  }
}

//DELETEME: This makes an entirely new app. Incorrect solution.
class OptionPage extends StatefulWidget {
  const OptionPage({super.key, required this.oInfo});

  final OptionInfo oInfo;

  @override
  State<OptionPage> createState() => _OptionPage();
}

class _OptionPage extends State<OptionPage> {
  String currentFileName = "";
  String currentDescription = "";
  @override
  void initState() {
    currentFileName = widget.oInfo.fileName;
    currentDescription = widget.oInfo.imageDescription;
  }

  void _toggleState() {
    setState(() {
      currentFileName = widget.oInfo.altFileName;
      currentDescription = widget.oInfo.altDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      appBar: AppBar(title: Text(widget.oInfo.imageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: widget.oInfo.imageTitle,
                child: Image.asset("images/$currentFileName"),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Text(widget.oInfo.imageTitle),
            Text(currentDescription)
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => _toggleState()),
    );
  }
}
