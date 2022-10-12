import 'package:flutter/material.dart';

class RouteSox extends StatelessWidget {
  const RouteSox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inside Sox Route")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: "Sox",
                child: Image.asset("images/sox.png"),
              ),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
