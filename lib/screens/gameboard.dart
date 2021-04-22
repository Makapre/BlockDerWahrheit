import 'package:blockderwahrheit/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Gameboard extends StatelessWidget {
  final _formKeyPrediction = GlobalKey<FormState>();
  final _formKeyResult = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var game = context.watch<Game>();
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
    const paddingVertical = EdgeInsets.symmetric(vertical: 16.0);

    bool isFinished() {
      // ! for testing
      // return game.actualRound > 1;
      return game.actualRound > game.rounds;
    }

    void _showApplyRoundDialog() {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              title:
                  Text('Ergebnisse Runde ${game.actualRound}/${game.rounds}'),
              children: <Widget>[
                Form(
                  key: _formKeyResult,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < game.numberOfPlayers; i++)
                        Padding(
                            padding: paddingHorizontal,
                            child: Column(children: [
                              Text(
                                "${game.players[i]} - ${game.prediction[i]}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Ergebnis",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Ergebnis eintragen';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                onSaved: (value) =>
                                    game.saveResult(int.parse(value!), i),
                              )
                            ])),
                      Padding(
                          padding: paddingVertical,
                          child: FloatingActionButton.extended(
                              onPressed: () {
                                final form = _formKeyResult.currentState!;
                                if (form.validate()) {
                                  form.save();
                                  game.calculatePoints();
                                  game.nextRound();
                                  Navigator.of(context).pop();
                                  _formKeyResult.currentState!.reset();
                                }
                              },
                              tooltip: 'Gib das Ergebnis der Runde ein',
                              label: Text("Ergebnisse eintragen",
                                  style: Theme.of(context).textTheme.button)))
                    ],
                  ),
                ),
              ],
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ));
        },
      );
    }

    Widget inGame() {
      return Scaffold(
          appBar: AppBar(
            title:
                Text('Game on', style: Theme.of(context).textTheme.subtitle1),
            leading: GestureDetector(
              onTap: () {
                game.reset();
                Navigator.popAndPushNamed(context, '/');
              },
              child: Icon(
                Icons.autorenew, // add custom icons also
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
              Text(
                "Aktuelle Runde: ${game.actualRound}/${game.rounds}",
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  key: _formKeyPrediction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < game.numberOfPlayers; i++)
                        Padding(
                            padding: paddingHorizontal,
                            child: Column(children: [
                              Row(
                                children: [
                                  Text(
                                    game.players[i],
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Spacer(),
                                  Text(
                                    game.scoreboard[i].toString() + ' Punkte',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Vorhersage",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Vorhersage eintragen';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                onSaved: (value) =>
                                    game.savePrediction(int.parse(value!), i),
                              ),
                            ])),
                      Padding(
                          padding: paddingVertical,
                          child: FloatingActionButton.extended(
                              onPressed: () {
                                final form = _formKeyPrediction.currentState!;
                                if (form.validate()) {
                                  form.save();
                                  _showApplyRoundDialog();
                                  _formKeyPrediction.currentState!.reset();
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                }
                              },
                              tooltip: 'Runde gespielt',
                              label: Text("Runde gespielt",
                                  style: Theme.of(context).textTheme.button))),
                    ],
                  ),
                ),
              ),
            ])),
          ));
    }

    Widget gameFinished() {
      return Scaffold(
        appBar: AppBar(
          title: Text('Spiel ist Ende',
              style: Theme.of(context).textTheme.subtitle1),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Endstand",
                style: Theme.of(context).textTheme.headline2,
              ),
              for (var i = 0; i < game.numberOfPlayers; i++)
                Column(children: [
                  Text(game.players[i],
                      style: Theme.of(context).textTheme.headline3),
                  Text(game.scoreboard[i].toString()),
                ]),
              FloatingActionButton.extended(
                onPressed: () {
                  game.reset();
                  Navigator.popAndPushNamed(context, '/');
                },
                tooltip: 'neues Spiel',
                label: Text("neues Spiel",
                    style: Theme.of(context).textTheme.button),
              )
            ],
          ),
        ),
      );
    }

    return isFinished() ? gameFinished() : inGame();
  }
}
