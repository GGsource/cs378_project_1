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
  late String _currentAddress = widget.oInfo.imageAddress;
  IconData _currentIcon = Icons.toggle_off_outlined;

  void _toggleState() {
    setState(() {
      if (!widget.oInfo.isAltMode) {
        _currentFileName = widget.oInfo.altFileName;
        _currentDescription = widget.oInfo.altDescription;
        _currentAddress = widget.oInfo.altImageAddress;
        _currentIcon = Icons.toggle_on_outlined;
      } else {
        _currentFileName = widget.oInfo.fileName;
        _currentDescription = widget.oInfo.imageDescription;
        _currentAddress = widget.oInfo.imageAddress;
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
        title:
            Text(widget.oInfo.imageTitle, style: getTitleStyle(fontSize: 30)),
        centerTitle: true,
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
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 80),
        child: RawScrollbar(
          thumbColor: widget.oInfo.swatch,
          trackVisibility: true,
          trackColor: widget.oInfo.swatch.shade200.withOpacity(0.5),
          thickness: 10,
          radius: const Radius.circular(100),
          thumbVisibility: true,
          child: GlowingOverscrollIndicator(
            //Sets the glow when you scroll too far up or down
            color: widget.oInfo.swatch,
            axisDirection: AxisDirection.down,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 40,
                      runSpacing: 20,
                      children: [
                        // IMAGE
                        GestureDetector(
                          child: Hero(
                            tag: widget.oInfo.imageTitle,
                            child: Image.asset("images/$_currentFileName"),
                          ),
                        ),
                        // TITLE
                        Text(
                          widget.oInfo.imageTitle,
                          textAlign: TextAlign.center,
                          style: getTitleStyle(),
                        ),
                        // DESCRIPTION
                        Text(
                          _currentDescription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          _currentAddress,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, color: widget.oInfo.swatch),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
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
