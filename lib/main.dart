import 'package:cs378_project_1/routes_places.dart';
import 'package:cs378_project_1/routes_events.dart';
import 'package:cs378_project_1/routes_sports.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  static const MaterialColor primary = Colors.amber;
  static const MaterialColor secondary = Colors.green;
  static const MaterialColor tertiary = Colors.cyan;
  static const MaterialColor quadrinary = Colors.purple;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        brightness: Brightness.dark,
        indicatorColor: AppColors.primary,
      ),
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
            bottom: PreferredSize(
                preferredSize: homePageTabs.preferredSize,
                child: ColoredBox(
                  color: Color.fromARGB(173, 0, 0, 0),
                  child: homePageTabs,
                )),
            //FIXME: Label color not very visible. Also change indicator color
          ),
          body: TabBarView(children: [
            Column(
              // Neighborhoods
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  runSpacing: 10,
                  children: [
                    //Cicero - Al Capone's Home
                    rowPiece(
                        displayText: "Cicero",
                        imageName: "place_capone.jpg",
                        swatch: AppColors.secondary),
                    //Kenwood - Obama's Home
                    rowPiece(
                        displayText: "Kenwood",
                        imageName: "place_obama.jpg",
                        swatch: AppColors.secondary),
                    //Hermosa - Walt Disney's Home
                    rowPiece(
                        displayText: "Hermosa",
                        imageName: "place_disney.jpg",
                        swatch: AppColors.secondary),
                  ],
                )
              ],
            ),
            Column(
              // Events
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Halsted Halloween Night Parade
                //Chicago River Architecture Cruise
                //A Century of Black Writers on Justice
                Wrap(
                  runSpacing: 10,
                  children: [
                    rowPiece(
                        displayText: "Halsted Halloween Night Parade",
                        imageName: "event_spooky.jpg",
                        fontSize: 25,
                        swatch: AppColors.tertiary),
                    rowPiece(
                        displayText: "A Century of Black Writers on Justice",
                        imageName: "event_justice.jpg",
                        fontSize: 25,
                        swatch: AppColors.tertiary),
                    rowPiece(
                        displayText: "Chicago River Architecture Cruise",
                        imageName: "event_cruise.jpg",
                        fontSize: 25,
                        swatch: AppColors.tertiary),
                  ],
                )
              ],
            ),
            Column(
              // Sports
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  runSpacing: 10,
                  children: [
                    rowPiece(
                        displayText: "Bulls",
                        imageName: "bulls.png",
                        swatch: AppColors.quadrinary),
                    rowPiece(
                        displayText: "White Sox",
                        imageName: "sox.png",
                        swatch: AppColors.quadrinary),
                    rowPiece(
                        displayText: "Fire",
                        imageName: "fire.png",
                        swatch: AppColors.quadrinary),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}

Widget rowPiece(
    {required String displayText,
    required String imageName,
    double fontSize = 35,
    Color swatch = AppColors.primary}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          //TODO: Make image clicakable & not the text
          //TODO: Hero into new screen with image larger
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/$imageName"), fit: BoxFit.cover),
              shape: BoxShape.circle,
              border: Border.all(color: swatch, width: 5),
              boxShadow: [BoxShadow(color: swatch, blurRadius: 10)]),
        ),
        SizedBox(
            width: 150,
            child: Text(
              displayText,
              style: TextStyle(
                  fontSize: fontSize,
                  color: swatch,
                  shadows: [Shadow(color: swatch, blurRadius: 10)]),
            )),
      ]);
}

// Separated the tab bar creation into its own function in order to wrap it inside
// of a colorbox widget and give the background of the tab its own color
TabBar get homePageTabs => TabBar(
      tabs: const [
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
      labelColor: AppColors.primary,
      overlayColor: MaterialStateProperty.all(AppColors.primary),
      labelStyle: const TextStyle(fontSize: 15),
      // indicatorSize: ,
    );
