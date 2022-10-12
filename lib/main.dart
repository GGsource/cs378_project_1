import 'package:cs378_project_1/route_fire.dart';
import 'package:cs378_project_1/route_sox.dart';
import 'package:flutter/material.dart';
import 'route_bulls.dart';

void main() {
  runApp(const MyApp());
}

MaterialColor appColor = Colors.amber;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: appColor,
          brightness: Brightness.dark,
          indicatorColor: Colors.amber),
      home: const MyHomePage(title: 'Welcome to Chicago'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                height: 3,
                fontSize: 40,
                shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset(5, 5), blurRadius: 10)
                ],
                // TODO: Use custom font for whole app
              ),
            ),
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/bean.jpg"),
                        fit: BoxFit.fitWidth),
                    shape: BoxShape.rectangle),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            toolbarHeight: 100,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.house_rounded),
                  text: "Neighborhoods",
                ),
                Tab(
                  icon: Icon(Icons.event),
                  text: "Events",
                ),
                Tab(
                  icon: Icon(Icons.sports_basketball_rounded),
                  text: "Sports",
                ),
              ],
              labelColor: Colors.red,
            ),
            //FIXME: Label color not very visible. Also change indicator color
          ),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  runSpacing: 5,
                  children: [
                    rowPiece(displayText: "Bulls", imageName: "bulls.png"),
                    rowPiece(displayText: "White Sox", imageName: "sox.png"),
                    rowPiece(displayText: "Fire", imageName: "fire.png"),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ]),
        ));
  }
}

Widget rowPiece({required String displayText, required String imageName}) {
  Color sportsColor = Colors.red;
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/$imageName"),
              ),
              shape: BoxShape.circle,
              border: Border.all(color: sportsColor, width: 5)),
        ),
        SizedBox(
            width: 150,
            child: Text(
              displayText,
              style: TextStyle(fontSize: 50, color: sportsColor),
            )),
      ]);
}
