import 'package:flutter/material.dart';

class RouteFire extends StatelessWidget {
  const RouteFire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inside Fire Route")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: "Fire",
                child: Image.asset("images/fire.png"),
              ),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
