import 'package:blockderwahrheit/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetNumberOfPlayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<Game>();
    // game.reset();

    return Scaffold(
      appBar: AppBar(
        title: Text('Wie viele Teilnehmer werden spielen?',
            style: Theme.of(context).textTheme.subtitle1),
        leading: GestureDetector(
          onTap: () => Navigator.popAndPushNamed(context, '/'),
          child: Icon(
            Icons.autorenew, // add custom icons also
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              heroTag: 1,
              onPressed: () =>
                  Navigator.popAndPushNamed(context, '/setPlayerNames'),
              tooltip: '3 Spieler',
              label: Text("3", style: Theme.of(context).textTheme.button),
            ),
            FloatingActionButton.extended(
              heroTag: 2,
              onPressed: () => {
                game.setNumberOfPlayers(4),
                Navigator.popAndPushNamed(context, '/setPlayerNames')
              },
              tooltip: '4 Spieler',
              label: Text("4", style: Theme.of(context).textTheme.button),
            ),
            FloatingActionButton.extended(
              heroTag: 3,
              onPressed: () => {
                game.setNumberOfPlayers(5),
                Navigator.popAndPushNamed(context, '/setPlayerNames')
              },
              tooltip: '5 Spieler',
              label: Text("5", style: Theme.of(context).textTheme.button),
            ),
            FloatingActionButton.extended(
              heroTag: 4,
              onPressed: () => {
                game.setNumberOfPlayers(6),
                Navigator.popAndPushNamed(context, '/setPlayerNames')
              },
              tooltip: '6 Spieler',
              label: Text("6", style: Theme.of(context).textTheme.button),
            ),
          ],
        ),
      ),
    );
  }
}
