import 'package:blockderwahrheit/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetNumberOfPlayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<Game>();
    const paddingVertical = EdgeInsets.symmetric(vertical: 30.0);
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 30.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Wie viele Teilnehmer werden spielen?',
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: paddingVertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: paddingHorizontal,
                        child: Transform.scale(
                            scale: 2.0,
                            child: FloatingActionButton.extended(
                              heroTag: 1,
                              hoverColor: Colors.red,
                              onPressed: () => Navigator.popAndPushNamed(
                                  context, '/setPlayerNames'),
                              tooltip: '3 Spieler',
                              label: Text("3",
                                  style: Theme.of(context).textTheme.labelLarge),
                            ))),
                    Padding(
                        padding: paddingHorizontal,
                        child: Transform.scale(
                            scale: 2.0,
                            child: FloatingActionButton.extended(
                              heroTag: 2,
                              hoverColor: Colors.red,
                              onPressed: () => {
                                game.setNumberOfPlayers(4),
                                Navigator.popAndPushNamed(
                                    context, '/setPlayerNames')
                              },
                              tooltip: '4 Spieler',
                              label: Text("4",
                                  style: Theme.of(context).textTheme.labelLarge),
                            ))),
                  ],
                )),
            Padding(
                padding: paddingVertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: paddingHorizontal,
                        child: Transform.scale(
                            scale: 2.0,
                            child: FloatingActionButton.extended(
                              heroTag: 3,
                              hoverColor: Colors.red,
                              onPressed: () => {
                                game.setNumberOfPlayers(5),
                                Navigator.popAndPushNamed(
                                    context, '/setPlayerNames')
                              },
                              tooltip: '5 Spieler',
                              label: Text(
                                "5",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ))),
                    Padding(
                        padding: paddingHorizontal,
                        child: Transform.scale(
                            scale: 2.0,
                            child: FloatingActionButton.extended(
                              heroTag: 4,
                              hoverColor: Colors.red,
                              onPressed: () => {
                                game.setNumberOfPlayers(6),
                                Navigator.popAndPushNamed(
                                    context, '/setPlayerNames')
                              },
                              tooltip: '6 Spieler',
                              label: Text("6",
                                  style: Theme.of(context).textTheme.labelLarge),
                            ))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
