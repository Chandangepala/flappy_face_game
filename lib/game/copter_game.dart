import 'dart:async';

import 'package:copter_game/components/background.dart';
import 'package:copter_game/components/bird.dart';
import 'package:copter_game/components/pipe_group.dart';
import 'package:copter_game/game/configuration.dart';
import 'package:copter_game/screens/choose_charactor_screen.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import '../components/ground.dart';

class CopterGame extends FlameGame with TapDetector, HasCollisionDetection {
  CopterGame();
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

     interval.onTick = () => add(PipeGroup());
    }

  TextComponent buildScore(){
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x /2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game'
        )
      )
    );
  }

    @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = 'Score: ${bird.score}';
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }
}

