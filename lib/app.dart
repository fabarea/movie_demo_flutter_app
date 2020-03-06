import 'package:flutter/material.dart';
import 'package:myapp/src/mock/movies.dart';
import 'package:myapp/src/api/api.dart' as rest_api;
import 'package:myapp/src/views/home.dart';

import 'movie.dart';

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
        primarySwatch: Colors.green,
      ),
      home: HomeView(title: 'Flutter Demo Learn Flutter'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  // Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    // Chargement du mock de movies
    _loadMovies();
  }

//  _loadMovies(){
//    movies = getMockMovies();
//  }

  _loadMovies() async {
    MoviesResponse movieResponse = await rest_api.topRatedMovies();
    setState(() {
      movies = movieResponse.movies;
    });
  }

//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }

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
        // Here we take the value from the HomeView object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            height: 50,
//            // color: Colors.amber[colorCodes[index]],
//            child: Center(child: Text('${movies[index].originalTitle} - ${movies[index].releaseDate}')),
//          );
          return MovieWidget(movies[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
