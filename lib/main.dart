import 'package:blockderwahrheit/screens/setPlayernames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
          darkTheme: ThemeData(
              primaryColor: Colors.blueAccent,
              primaryColorLight: Colors.blueAccent,
              primaryColorDark: Colors.blueAccent,
              indicatorColor: Colors.blueAccent,
              canvasColor: Colors.grey,
              // next line is important!
              appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)),
          initialRoute: '/',
          routes: {
            '/': (context) => Overview(),
            '/setNumberOfPlayers': (context) => SetNumberOfPlayers(),
            '/setPlayerNames': (context) => SetPlayerNames(),
            '/gameboard': (context) => Gameboard(),
          },
        ));
  }
}
