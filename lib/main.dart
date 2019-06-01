import 'package:delve/textstyles.dart';
import 'package:flutter/material.dart';
import 'postwidgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ForumCard(
                forum: Forum(
                    title: "sdfsdf",
                    imagePath: "sdf",
                    rank: "1",
                    threads: "sdf",
                    subs: "Sdfsdf")),
            ForumCard(
                forum: Forum(
                    title: "sdfsdf",
                    imagePath: "sdf",
                    rank: "2",
                    threads: "sdf",
                    subs: "Sdfsdf")),
            ForumCard(
                forum: Forum(
                    title: "sdfsdf",
                    imagePath: "sdf",
                    rank: "3",
                    threads: "sdf",
                    subs: "Sdfsdf")),
            ForumCard(
                forum: Forum(
                    title: "sdfsdf",
                    imagePath: "sdf",
                    rank: "4",
                    threads: "sdf",
                    subs: "Sdfsdf")),
          ],
        ),
      ),
    );
  }
}



class Forum {
  final String title;
  final String imagePath;
  final String rank;

  final String threads;
  final String subs;

  Forum({this.title, this.imagePath, this.rank, this.threads, this.subs});
}

final fortniteForum = Forum(
  title: "Fortnite",
  imagePath: "assets/images/fortnite.jpg",
  rank: "31",
  threads: "88",
  subs: "500+",
);

final pubgForum = Forum(
  title: "PUBG",
  imagePath: "assets/images/pubg.png",
  rank: "25",
  threads: "120",
  subs: "1000+",
);

final forums = [fortniteForum, pubgForum];


