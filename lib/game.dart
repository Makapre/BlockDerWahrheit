import 'package:flutter/foundation.dart';

class Game extends ChangeNotifier {
  int _numberOfPlayers = 3;
  List<String> _players = [];
  int _rounds = 20;
  int _actualRound = 1;

  int get numberOfPlayers => _numberOfPlayers;
  List<String> get players => _players;
  int get rounds => _rounds;
  int get actualRound => _actualRound;

  void reset() {
    _numberOfPlayers = 3;
    _players = [];
    _rounds = 20;
    _actualRound = 1;
  }

  void setNumberOfPlayers(amount) {
    _numberOfPlayers = amount;
    switch (_numberOfPlayers) {
      case 3:
        _rounds = 20;
        break;
      case 4:
        _rounds = 15;
        break;
      case 5:
        _rounds = 12;
        break;
      case 6:
        _rounds = 10;
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
