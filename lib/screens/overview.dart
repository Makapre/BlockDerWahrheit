import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  Overview({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.title!, style: Theme.of(context).textTheme.subtitle1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton.extended(
                onPressed: () =>
                    Navigator.popAndPushNamed(context, '/setRounds'),
                tooltip: 'Starte das Spiel',
                label: Text("Start", style: Theme.of(context).textTheme.button))
          ],
        ),
      ),
    );
  }
}
