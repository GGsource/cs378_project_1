import 'package:flutter/material.dart';

class RouteBulls extends StatelessWidget {
  const RouteBulls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inside Bulls Route")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: "Bulls",
                child: Image.asset("images/bulls.png"),
              ),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
