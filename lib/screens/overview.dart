import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Block der Wahrheit',
            style: Theme.of(context).textTheme.subtitle1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/wizard_wallpaper.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              // fit: BoxFit.cover,
            ),
            Spacer(),
            FloatingActionButton.extended(
                onPressed: () =>
                    Navigator.popAndPushNamed(context, '/setNumberOfPlayers'),
                tooltip: 'Neues Spiel starten',
                label: Text("Neues Spiel",
                    style: Theme.of(context).textTheme.button)),
            Spacer()
          ],
        ),
      ),
    );
  }
}
