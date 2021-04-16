import 'package:flutter_test/flutter_test.dart';

import 'package:blockderwahrheit/game.dart';

void main() {
  test('basic setup', () {
    final game = Game();
    final _numberOfPlayers = 3;
    final _players = ["Player 1", "Player 2", "Player 3"];
    final _rounds = 20;
    final _actualRound = 1;

    expect(game.numberOfPlayers, equals(_numberOfPlayers));
    expect(game.players, equals(_players));
    expect(game.rounds, equals(_rounds));
    expect(game.actualRound, equals(_actualRound));
  });

  test('nextRound', () {
    final game = Game();
    final _actualRound = 2;

    game.nextRound();
    expect(game.actualRound, equals(_actualRound));
  });
}
