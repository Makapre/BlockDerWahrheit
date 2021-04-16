import 'package:blockderwahrheit/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetRounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<Game>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Wie viele Teilnehmer werden spielen?',
            style: Theme.of(context).textTheme.subtitle1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(game.actualRound.toString()),
            FloatingActionButton.extended(
              onPressed: () =>
                  {game.reset(), Navigator.popAndPushNamed(context, '/')},
              tooltip: 'Zum Startbidlschirm',
              label: Text("Startbidlschirm",
                  style: Theme.of(context).textTheme.button),
            ),
          ],
        ),
      ),
    );
  }
}
