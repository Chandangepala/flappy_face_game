import 'package:copter_game/game/assets.dart';
import 'package:copter_game/game/copter_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final CopterGame game;
  static const String id = 'gameOver';

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game'
              ),
            ),
            SizedBox(height: 20,),
            Image.asset(Assets.gameOver),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  onRestart();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Game'),
                )),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {
                  toMenu();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  '  Menu  ',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Game'),
                ))
          ],
        ),
      ),
    );
  }

  void onRestart(){
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }

  void toMenu(){
    game.bird.reset();
    game.overlays.add('chooseCharacter');
    game.overlays.remove('gameOver');
  }
}
