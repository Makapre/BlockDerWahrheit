import 'package:blockderwahrheit/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gameboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<Game>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Game on', style: Theme.of(context).textTheme.subtitle1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(game.players.toString()),
            Text(game.numberOfPlayers.toString())
          ],
        ),
      ),
    );
  }
}
