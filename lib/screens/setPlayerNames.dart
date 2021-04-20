import 'package:blockderwahrheit/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPlayerNames extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var game = context.watch<Game>();
    const paddingVertical = EdgeInsets.symmetric(vertical: 16.0);
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Spielernamen eintragen',
            style: Theme.of(context).textTheme.subtitle1),
        leading: GestureDetector(
          onTap: () => Navigator.popAndPushNamed(context, '/'),
          child: Icon(
            Icons.autorenew, // add custom icons also
          ),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < game.numberOfPlayers; i++)
                Padding(
                    padding: paddingHorizontal,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Spielername',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bitte einen Spielernamen eintragen';
                        }
                        return null;
                      },
                      onSaved: (value) => game.setPlayer(value),
                      onEditingComplete: () => node.nextFocus(),
                    )),
              Padding(
                padding: paddingVertical,
                child: ElevatedButton(
                  onPressed: () {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      form.save();
                      Navigator.popAndPushNamed(context, '/gameboard');
                    }
                  },
                  child: Text("Los geht's"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
