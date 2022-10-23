import 'package:cs378_project_1/option_info.dart';
import 'package:cs378_project_1/route_option.dart';

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
    case "place_cicero.png":
      return OptionInfo(
          //DONE: FIll in Cicero
          imageTitle: "Cicero",
          fileName: fileName,
          imageDescription:
              "Cicero is a suburb of Chicago and an incorporated town in Cook County, Illinois, United States. Per the 2020 census, the population was 85,268. making it the 11th largest municipality in Illinois. The town of Cicero is named after Marcus Tullius Cicero, a Roman statesman and orator.",
          imageAddress: "Cicero, IL - 60632",
          altFileName: "place_capone.jpg",
          altDescription:
              "Cicero also happens to be a place the infamous Al Capone called home. Al Capone was a known mobster who found his fame at the height of the 'Roaring Twenties', participating in everything from gambling and bootlegging all the way to racketeering and straight up murder. Pictured above is one of his residences during his life in Illinois, which by contrast seems quite calm and cozy, unlike the life he lead outside of it. ",
          altImageAddress: "1600 S Austin Blvd, Cicero IL",
          swatch: AppColors.secondary);
    case "place_kenwood.png":
      return OptionInfo(
          //DONE: Fill in Kenwood
          imageTitle: "Kenwood",
          fileName: fileName,
          imageDescription:
              "If any place screams weatlh, it has to be Kenwood. Settled in the 1850s by rich Chicagoans who wanted to escape the crowded city, Kenwood is populated by extravagant residences and neighborhoods tailored perfectly down to the last leaf on a tree. If there's any fair criticism of Kenwood, it's certainly not its beauty.",
          imageAddress: "Kenwood, IL - 60615",
          altFileName: "place_obama.jpg",
          altDescription:
              "Kenwood is also contains the home of the 44th President of the United States: Barack Obama. The Obama Family Home is a fancy red-brick house boasting 6 bedrooms within its 15k square feet area and certainly says 'presidential wealth'. Unfortunately for the Obama family though, fame comes with its downsides and so the family home has become an unintentional tourist spot where strangers openly gawk.",
          altImageAddress: "5046 S. Greenwood Ave, Kenwood, IL",
          swatch: AppColors.secondary);
    case "place_hermosa.png":
      return OptionInfo(
          imageTitle: "Hermosa",
          fileName: fileName,
          imageDescription:
              "Located on the Northwest side of Chicago, Hermosa is a small community, but one of Chicago's most densely populated. It's a popular choice due to its proximity to downtown combined with a healthy public transportation system. The region demographics are upwards of 90.5% hispanic.",
          imageAddress: "Hermosa, IL - 60639",
          altFileName: "place_disney.jpg",
          altDescription:
              "Hermosa was also home to none other than Walt Disney himself. Picture above is his childhood home, which has now become a tourist spot, turning his childhood home into something of a museum. Disney is responsible for founding an international super-corporation that has brought people many memorable movies and cartoons, but he also had a darker history. Plenty of unverifiable rumors regarding his racial prejudices have floated around in the decades since his rise to fame, but one thing that is not rumor and just plain fact is that Walt decided to welcome Nazi director Leni Riefenstahl to his studios a month after Kristallnacht. This kind of stain on one's reputation is not so easily clensed.",
          altImageAddress: "",
          swatch: AppColors.secondary);
    case "event_spooky.jpg":
      return OptionInfo(
          imageTitle: "Halsted Halloween Parade",
          fileName: fileName,
          imageDescription:
              "With the upcoming holiday just a week away, no other event could possibly more relevant than the Halsted Halloween Night Parade. On Halloween night the chicago residents don their costumes ranging from the simple and sweet to the eloquent and extravagant. They then make their way down Halsted, displaying their attire for all to see and perhaps get a bit of a fright out of. Its certainly one of the spookiest events available in the city of Chicago.",
          imageAddress: "3210 N Halsted St, Chicago, IL 60657",
          altFileName: "event_spooky_alt.png",
          altDescription:
              "Spookier than this event however, is this man pictured above. Known to some as Pogo the clown, and to others as Patches the clown, he was not quite as friendly as his attire may imply. Using the guise of a friendly clown, John Wayne Gacy murdered and tortured at least 33 young men from 1967 to 1978, burying their remains in the crawl space beneath his home or disposing of their remains in the Des Plaines River. He was tried in Cook County and later executed in 1994",
          altImageAddress: "",
          swatch: AppColors.tertiary);
    case "event_justice.jpg":
      return OptionInfo(
          imageTitle: "Black Writers on Justice",
          fileName: fileName,
          imageDescription:
              "Explore racial injustice in America by examining the work of Black American writers from the end of the Civil War through the Civil Rights Movement. Featuring original artwork, augmented reality and other interactive elements to enliven and enrich the experience, Dark Testament brings the work of writers past and present to life in new and exciting ways.",
          imageAddress:
              "American Writers Museum 180 N. Michigan Ave. Chicago,IL60601",
          altFileName: "event_justice_alt.png",
          altDescription:
              "Something not many know is that Kanye West, one of the most prominent black artists in the modern day, was raised in Chicago. At the age of nineteen he received his first official production credits by producing eight tracks on Chicago rapper Grav's debut album titled 'Down to Earth'. Recently however his focus seems to have turned to a political one, even attempting to run in the 2020 election, though generally failing due to lack of proper planning and getting involved too late. He still however hints at running for 2024, though conversely is also an avid Trump fan, which leaves things uncertain as to what will happen in the next two years.",
          altImageAddress: "",
          swatch: AppColors.tertiary);
    case "event_cruise.jpg":
      return OptionInfo(
          imageTitle: "Chicago River Cruise",
          fileName: fileName,
          imageDescription:
              "One of the greatest tourist attractions Chicago has to offer is undoubtedly its great river that cuts through the city, leaving a beautiful river. Atop this river of course has formed a natural boat transportation, which also happens to serve as an excellent way of giving visitors a tour of the nearby area. For this purpose, Chicago has many such River Cruise events that take people from landmark to landmark while they gently coast along on a cruise ship.",
          imageAddress: "306-370 W Wacker Dr, Chicago, IL 60654",
          altFileName: "event_cruise_alt.png",
          altDescription:
              "In this same location the cruise takes place, there's another famous event that happens once a year: The Chicago St. Patrick's Day Green river dying. For 60 years the city has had a tradition of dying the chicago rive a deep green color in celebration of the Irish holiday. The city uses a 'secret' powder dye that is ironically orange before touching water. This secrecy however has lead to environmental concern groups being worried about what exactly is used in dying the river and what its potential harm to wildlife could be. Originally the mayor planned to dye a portion of Lake Michigan, so at least dying just the river was a more manageable job.",
          altImageAddress: "",
          swatch: AppColors.tertiary);
    case "sport_bulls.png":
      return OptionInfo(
          imageTitle: "Bulls",
          fileName: fileName,
          imageDescription:
              "The Chicago Bulls are an American professional basketball team based in Chicago. Founded on January 16th of 1966, The bulls are the only NBA team ever to win multiple championships while never losing an NBA Finals series in their history. The bulls are known for their 1991-1998 streak of winning six championships in two groups of 3 at a time.",
          imageAddress:
              "United Center Arena - 1901 W Madison St, Chicago, IL 60612",
          altFileName: "sport_bulls_alt.png",
          altDescription:
              "Undoubtedly what the Chicago Bulls are known for the most is being the team that housed Michael Jordan, the legendary hall of fame player who rocketed the team into international fame, and is the face of the Jordans shoe brand. Even to this day Jordan is still considered by many to be the best basketball player the NBA has ever seen.",
          altImageAddress: "",
          swatch: AppColors.quaternary);
    case "sport_sox.png":
      return OptionInfo(
          imageTitle: "White Sox",
          fileName: fileName,
          imageDescription:
              "The White Sox are a professional American baseball team based in Chicago. They compete in Major League Baseball and are part of the American League Central division",
          imageAddress:
              "Guaranteed Rate Field Stadium 333 W 35th St, Chicago, IL 60616",
          altFileName: "sport_sox_alt.png",
          altDescription:
              "Despite what the name 'Chicago Black Sox' may imply, there is in fact not a rival team wearing inverted colors to the white sox. Black sox refers to the 1919 scandal where eight of members of the white sox were accused of throwing the 1919 World Series against the Cincinati Reds, letting them win in exchange for money. This money was alledged to come from gambling syndicate leader Arndold Rothstein. This resulted in these eight players being permanently banned from professional baseball. ",
          altImageAddress: "",
          swatch: AppColors.quaternary);
    case "sport_fire.png":
      return OptionInfo(
          imageTitle: "Fire",
          fileName: fileName,
          imageDescription:
              "Chicago Fire, as the name suggests, is a Chicago based Soccer team, named after the infamous fire of 1871 which killed approximately 300 people and destroyed over 17,000 structures and made over 100,000 chicagoans homeless. The soccer team however, has not made anyone homeless as far as I am aware, and has won the US Open Cup in the years 2000, 2003, and 2006.",
          imageAddress: "1410 Special Olympics Dr, Chicago, IL 60605",
          altFileName: "sport_fire_alt.png",
          altDescription:
              "The Chicago Fire's home stadium has been something of a delicate topic, and it hasn't always been the Soldier Field Stadium shown above. The team's dissatisfaction stemmed from the fact that the things get a bit cramped at home. That is to say, the soccer team also shares the stadium with the Chicago Bears, the well known Chicago football team. Football being more popular in the US, the Bears tend to hold greater leverage with the stadium owners, which manifests as preferential treatment when it comes to how the stadium is laid out. Eventually the Fire team was fed up and moved to the Toyota Stadium in the suburbs near Chicago, but was similarly unhappy with the unsatisfying placement, plus you can't have chicago in your name if you don't even play there. This culminated in their recent return to Soldier Field, though luckily, it appears the Bears are considering moving, which would leave the Fire team as the new main tenant.",
          altImageAddress: "",
          swatch: AppColors.quaternary);
    default:
      throw Exception("Image '$fileName' does not exist.");
  }
}
