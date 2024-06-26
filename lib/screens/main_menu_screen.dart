import 'package:copter_game/game/assets.dart';
import 'package:copter_game/game/copter_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final CopterGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({Key? key, required this.game}): super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.ff_tap),
              fit: BoxFit.cover
            )
          ),
          //child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
