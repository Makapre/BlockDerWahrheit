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
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
          ),
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
