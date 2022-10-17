import 'package:cs378_project_1/option_info.dart';
import 'package:cs378_project_1/route_option.dart';
import 'package:cs378_project_1/title_style.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Consistent set of colors that the app will use
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
        brightness: Brightness.dark, //Sets backgrounds to dark grey
        primarySwatch: AppColors.primary, //Sets primary app color
        indicatorColor: AppColors.primary, //Sets indicator color for tabs
      ),
      home: const MyHomePage(title: 'Welcome to Chicago'), //Appbar title
      debugShowCheckedModeBanner: false, //Removes debug banner
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
      length: 3, //Number of tabs to display in appbar
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: getTitleStyle()),
          centerTitle: true, //Centers the title horizontally
          flexibleSpace: ClipRRect(
            //Wrap Appbar image in order to clip it round
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
                    rowPiece(context, info: getInfo("place_cicero.png")),
                    //Kenwood - Obama's Home
                    rowPiece(context, info: getInfo("place_kenwood.png")),
                    //Hermosa - Walt Disney's Home
                    rowPiece(context, info: getInfo("place_hermosa.png")),
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
                    //Halsted Halloween Parade
                    rowPiece(context,
                        info: getInfo("event_spooky.jpg"), fontSize: 30),
                    //Black Writers on Justice
                    rowPiece(context,
                        info: getInfo("event_justice.jpg"), fontSize: 30),
                    //Chicago Cruise
                    rowPiece(context,
                        info: getInfo("event_cruise.jpg"), fontSize: 30),
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
  double fontSize = 50,
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
              fontFamily: "QuickKiss",
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
      indicatorWeight: 5,
    );

// getInfo - holds all the descriptions, file names, & titles for
// each option. They are bundeled and returned as one object.
OptionInfo getInfo(String fileName) {
  switch (fileName) {
    // TODO: Fill out Descriptions
    //TODO: Add addresses to all descriptions
    // TODO: Add Alt Image Files
    // TODO: Add Alt Image descriptions
    case "place_cicero.png":
      return OptionInfo(
          imageTitle: "Cicero",
          fileName: fileName,
          imageDescription:
              "Cicero is a suburb of Chicago and an incorporated town in Cook County, Illinois, United States. Per the 2020 census, the population was 85,268. making it the 11th largest municipality in Illinois. The town of Cicero is named after Marcus Tullius Cicero, a Roman statesman and orator.",
          altFileName: "place_capone.jpg",
          altDescription:
              "PLACEHOLDER_ALT_DESCRIPTION Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff Lorem latin stuff ",
          swatch: AppColors.secondary);
    case "place_kenwood.png":
      return OptionInfo(
          imageTitle: "Kenwood",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "place_obama.jpg",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.secondary);
    case "place_hermosa.png":
      return OptionInfo(
          imageTitle: "Hermosa",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "place_disney.jpg",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.secondary);
    case "event_spooky.jpg":
      return OptionInfo(
          imageTitle: "Halsted Halloween Parade",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "event_spooky_alt.png",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.tertiary);
    case "event_justice.jpg":
      return OptionInfo(
          imageTitle: "Black Writers on Justice",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "event_justice_alt.png",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.tertiary);
    case "event_cruise.jpg":
      return OptionInfo(
          imageTitle: "Chicago River Cruise",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "event_cruise_alt.png",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.tertiary);
    case "sport_bulls.png":
      return OptionInfo(
          imageTitle: "Bulls",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "sport_bulls_alt.png",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.quaternary);
    case "sport_sox.png":
      return OptionInfo(
          imageTitle: "White Sox",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "sport_sox_alt.png",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.quaternary);
    case "sport_fire.png":
      return OptionInfo(
          imageTitle: "Fire",
          fileName: fileName,
          imageDescription: "PLACEHOLDER_DESCRIPTION",
          altFileName: "sport_fire_alt.png",
          altDescription: "PLACEHOLDER_ALT_DESCRIPTION",
          swatch: AppColors.quaternary);
    default:
      throw Exception("Image '$fileName' does not exist.");
  }
}
