import 'package:cs378_project_1/option_info.dart';
import 'package:flutter/material.dart';

class RouteOption extends StatefulWidget {
  const RouteOption({super.key, required this.oInfo});

  final OptionInfo oInfo;

  @override
  State<RouteOption> createState() => _RouteOption();
}

class _RouteOption extends State<RouteOption> {
  late String _currentFileName = widget.oInfo.fileName;
  late String _currentDescription = widget.oInfo.imageDescription;
  IconData _currentIcon = Icons.toggle_off_outlined;

  void _toggleState() {
    setState(() {
      if (!widget.oInfo.isAltMode) {
        _currentFileName = widget.oInfo.altFileName;
        _currentDescription = widget.oInfo.altDescription;
        _currentIcon = Icons.toggle_on_outlined;
      } else {
        _currentFileName = widget.oInfo.fileName;
        _currentDescription = widget.oInfo.imageDescription;
        _currentIcon = Icons.toggle_off_outlined;
      }
      widget.oInfo.isAltMode = !widget.oInfo.isAltMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String tag = getTag(optionName);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          shadows: [
            Shadow(color: widget.oInfo.swatch.shade700, blurRadius: 30),
          ],
        ),
        title: Text(
          widget.oInfo.imageTitle,
          style: const TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(5, 5), blurRadius: 10)
            ],
          ),
        ),
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bean.jpg"), fit: BoxFit.fitWidth),
                shape: BoxShape.rectangle),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: widget.oInfo.imageTitle,
                child: Image.asset("images/$_currentFileName"),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Text(widget.oInfo.imageTitle),
            Text(_currentDescription)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(
          _currentIcon,
          size: 50,
          color: widget.oInfo.swatch.shade200,
        ),
        backgroundColor: widget.oInfo.swatch,
        tooltip: "Click me for cool trivia!",
        onPressed: () => _toggleState(),
      ),
    );
  }
}
