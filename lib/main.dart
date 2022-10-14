import 'package:cs378_project_1/option_info.dart';
import 'package:cs378_project_1/route_option.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  static const MaterialColor primary = Colors.amber;
  static const MaterialColor secondary = Colors.green;
  static const MaterialColor tertiary = Colors.teal;
  static const MaterialColor quaternary = Colors.red;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS378 Project 1',
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
            borderRadius: BorderRadius.circular(60),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/bean.jpg"),
                      fit: BoxFit.fitWidth),
                  shape: BoxShape.rectangle),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          toolbarHeight: 80,
          bottom: PreferredSize(
            preferredSize: homePageTabs.preferredSize,
            child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(60),
                ),
                child: ColoredBox(
                  color: const Color.fromARGB(142, 0, 0, 0),
                  child: homePageTabs,
                )),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  // Neighborhoods
                  runSpacing: 10,
                  children: [
                    //Cicero - Al Capone's Home
                    rowPiece(context, info: getInfo("place_capone.jpg")),
                    //Kenwood - Obama's Home
                    rowPiece(context, info: getInfo("place_obama.jpg")),
                    //Hermosa - Walt Disney's Home
                    rowPiece(context, info: getInfo("place_disney.jpg")),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  // Events
                  runSpacing: 10,
                  children: [
                    //Halsted Halloween Night Parade
                    rowPiece(context,
                        info: getInfo("event_spooky.jpg"), fontSize: 25),
                    //Black Writers on Justice
                    rowPiece(context,
                        info: getInfo("event_justice.jpg"), fontSize: 25),
                    //Chicago River Architecture Cruise
                    rowPiece(context,
                        info: getInfo("event_cruise.jpg"), fontSize: 25),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  // Sports
                  runSpacing: 10,
                  children: [
                    // Bulls
                    rowPiece(context, info: getInfo("sport_bulls.png")),
                    // White Sox
                    rowPiece(context, info: getInfo("sport_sox.png")),
                    // Fire
                    rowPiece(context, info: getInfo("sport_fire.png")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowPiece(
  BuildContext ctx, {
  required OptionInfo info,
  double fontSize = 35,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      GestureDetector(
        child: Hero(
          tag: info.imageTitle,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/${info.fileName}"),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
              border: Border.all(color: info.swatch, width: 5),
              boxShadow: [
                BoxShadow(color: info.swatch, blurRadius: 10),
              ],
            ),
          ),
        ),
        onTap: () => Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (ctx) {
              return RouteOption(
                oInfo: info,
              );
            },
          ),
        ),
      ),
      SizedBox(
        width: 150,
        child: Text(
          info.imageTitle,
          style: TextStyle(
              fontSize: fontSize,
              color: info.swatch,
              shadows: [Shadow(color: info.swatch, blurRadius: 10)]),
        ),
      ),
    ],
  );
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
      indicatorWeight: 10,
    );

// getInfo - holds all the descriptions, file names, & titles for
// each option. They are bundeled and returned as one object.
OptionInfo getInfo(String fileName) {
  switch (fileName) {
    // TODO: Fill out Descriptions
    // TODO: Add Alt Image Files
    // TODO: Add Alt Image descriptions
    case "place_capone.jpg":
      return OptionInfo(
          imageTitle: "Cicero",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.secondary);
    case "place_obama.jpg":
      return OptionInfo(
          imageTitle: "Kenwood",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.secondary);
    case "place_disney.jpg":
      return OptionInfo(
          imageTitle: "Hermosa",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.secondary);
    case "event_spooky.jpg":
      return OptionInfo(
          imageTitle: "Halsted Halloween Night Parade",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.tertiary);
    case "event_justice.jpg":
      return OptionInfo(
          imageTitle: "Black Writers on Justice",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.tertiary);
    case "event_cruise.jpg":
      return OptionInfo(
          imageTitle: "Chicago River Architecture Cruise",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.tertiary);
    case "sport_bulls.png":
      return OptionInfo(
          imageTitle: "Bulls",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.quaternary);
    case "sport_sox.png":
      return OptionInfo(
          imageTitle: "White Sox",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.quaternary);
    case "sport_fire.png":
      return OptionInfo(
          imageTitle: "Fire",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "PLACEHOLDER_ALT_FILE.PNG",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.quaternary);
    default:
      throw Exception("Image '$fileName' does not exist.");
  }
}
