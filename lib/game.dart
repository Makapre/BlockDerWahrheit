import 'package:flutter/foundation.dart';

class Game extends ChangeNotifier {
  int _numberOfPlayers = 3;
  List<String> _players = [];
  int _rounds = 20;
  int _actualRound = 1;
  List<int> _scoreboard = [0, 0, 0];
  List<int> _predictions = [0, 0, 0];
  List<int> _results = [0, 0, 0];

  int get numberOfPlayers => _numberOfPlayers;
  List<String> get players => _players;
  int get rounds => _rounds;
  int get actualRound => _actualRound;
  List<int> get scoreboard => _scoreboard;
  List<int> get prediction => _predictions;

  String winner() {
    return _players.first;
  }

  void calculatePoints() {
    for (int i = 0; i < _numberOfPlayers; i++) {
      int prediction = _predictions[i];
      int result = _results[i];
      int points = _scoreboard[i];

      if (prediction > result) {
        int difference = prediction - result;
        _scoreboard[i] = points - 10 * difference;
      } else if (prediction < result) {
        int difference = result - prediction;
        _scoreboard[i] = points - 10 * difference;
      } else {
        _scoreboard[i] = points + 20 + 10 * result;
      }
    }
    notifyListeners();
  }

  void reset() {
    _numberOfPlayers = 3;
    _players = [];
    _rounds = 20;
    _actualRound = 1;
    _scoreboard = [0, 0, 0];
    _results = [0, 0, 0];
    notifyListeners();
  }

  void savePrediction(int value, int index) {
    _predictions[index] = value;
    notifyListeners();
  }

  void saveResult(int value, int index) {
    _results[index] = value;
    notifyListeners();
  }

  void setNumberOfPlayers(amount) {
    _numberOfPlayers = amount;
    switch (_numberOfPlayers) {
      case 3:
        _rounds = 20;
        break;
      case 4:
        _rounds = 15;
        _scoreboard.add(0);
        _predictions.add(0);
        _results.add(0);
        break;
      case 5:
        _rounds = 12;
        _scoreboard.add(0);
        _scoreboard.add(0);
        _predictions.add(0);
        _predictions.add(0);
        _results.add(0);
        _results.add(0);
        break;
      case 6:
        _rounds = 10;
        _scoreboard.add(0);
        _scoreboard.add(0);
        _scoreboard.add(0);
        _predictions.add(0);
        _predictions.add(0);
        _predictions.add(0);
        _results.add(0);
        _results.add(0);
        _results.add(0);
        break;
    }
    notifyListeners();
  }

  void setPlayer(player) {
    _players.add(player);
    notifyListeners();
  }

  void nextRound() {
    _actualRound++;
    notifyListeners();
  }
}
