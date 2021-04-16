import 'package:blockderwahrheit/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPlayerNames extends StatelessWidget {
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
            Text(game.players.toString()),
            // todo Enter player names
          ],
        ),
      ),
    );
  }
}
