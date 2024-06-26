import 'dart:async';
import 'dart:math';

import 'package:copter_game/components/pipe.dart';
import 'package:copter_game/game/assets.dart';
import 'package:copter_game/game/configuration.dart';
import 'package:copter_game/game/copter_game.dart';
import 'package:copter_game/game/pipe_position.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

class PipeGroup extends PositionComponent with HasGameRef<CopterGame>{
  PipeGroup();

  final _random = Random();

  @override
  FutureOr<void> onLoad() async{
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom,
          height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed*dt;

    if(position.x < -10){
      removeFromParent();
      debugPrint('Removed');
      updateScore();
    }

    if(gameRef.isHit){
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore(){
    gameRef.bird.score += 5;
    FlameAudio.play(Assets.point);
  }
}