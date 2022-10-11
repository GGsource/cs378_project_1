import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Welcome to Chicago'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: const TextStyle(
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
                        image: AssetImage("images/bulls_banner.jpg"),
                        fit: BoxFit.fitWidth),
                    shape: BoxShape.rectangle),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            toolbarHeight: 100,
            bottom: const TabBar(tabs: [
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
            ]),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ));
  }
}
