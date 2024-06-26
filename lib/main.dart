import 'package:copter_game/game/copter_game.dart';
import 'package:copter_game/screens/choose_charactor_screen.dart';
import 'package:copter_game/screens/game_over_screen.dart';
import 'package:copter_game/screens/main_menu_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  final game = CopterGame();
  runApp(
      GameWidget(
        game: game,
        initialActiveOverlays: const [ MainMenuScreen.id, ChooseCharacterScreen.id,]/*[MainMenuScreen.id]*/,
        overlayBuilderMap: {
            'mainMenu': (context, _) => MainMenuScreen(game: game),
            'gameOver': (context, _) => GameOverScreen(game: game),
            'chooseCharacter': (context, _) => ChooseCharacterScreen(game: game),
        },
      )
  );
}
