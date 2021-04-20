import 'package:blockderwahrheit/screens/setPlayernames.dart';
import 'package:flutter/material.dart';
import 'screens/overview.dart';
import 'screens/setNumberOfPlayers.dart';
import 'game.dart';
import 'package:provider/provider.dart';
import 'screens/gameboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Game>(
            create: (context) => Game(),
          )
        ],
        child: MaterialApp(
          title: 'Block Der Wahrheit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            primarySwatch: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // darkTheme: ThemeData(
          //   brightness: Brightness.dark,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          // ),
          darkTheme: ThemeData(
              primaryColor: Colors.blueAccent,
              primaryColorBrightness: Brightness.light,
              primaryColorLight: Colors.blueAccent,
              primaryColorDark: Colors.blueAccent,
              indicatorColor: Colors.blueAccent,
              canvasColor: Colors.white,
              // next line is important!
              appBarTheme: AppBarTheme(brightness: Brightness.dark)),
          initialRoute: '/',
          routes: {
            '/': (context) => Overview(title: 'Block der Wahrheit'),
            '/setNumberOfPlayers': (context) => SetNumberOfPlayers(),
            '/setPlayerNames': (context) => SetPlayerNames(),
            '/gameboard': (context) => Gameboard(),
          },
        ));
  }
}
