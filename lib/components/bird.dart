import 'dart:async';

import 'package:copter_game/game/assets.dart';
import 'package:copter_game/game/bird_movement.dart';
import 'package:copter_game/game/configuration.dart';
import 'package:copter_game/game/copter_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<CopterGame>, CollisionCallbacks {
  Bird();

  int score = 0;

  @override
  FutureOr<void> onLoad() async{

    var birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    var birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    var birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap
    };

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if(position.y < 1){
      gameOver();
    }
  }

  void fly(){
    add(
      MoveByEffect(Vector2(0, Config.gravity),
          EffectController(duration: 0.4, curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.down,
      ),
    );
    current = BirdMovement.up;
    FlameAudio.play(Assets.flying);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    debugPrint('Collision Detected');
    gameOver();
  }

  void gameOver(){
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    game.isHit = true;
    FlameAudio.play(Assets.collision);
  }

  void reset(){
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    score = 0;
  }

  void updateCharacter(character) async{
    if(character == 'bird'){
      var birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
      var birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
      var birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

      sprites = {
        BirdMovement.middle: birdMidFlap,
        BirdMovement.up: birdUpFlap,
        BirdMovement.down: birdDownFlap
      };
    }else if(character == 'modi'){
      sprites = {
        BirdMovement.middle: await gameRef.loadSprite(Assets.modiG),
        BirdMovement.up: await gameRef.loadSprite(Assets.modiG),
        BirdMovement.down: await gameRef.loadSprite(Assets.modiG),
      };
    }else if(character == 'pickachu'){
      //print("custom: $selectedCharacterPath");
      sprites = {
        BirdMovement.middle : await gameRef.loadSprite(Assets.pickachuG),
        BirdMovement.up: await gameRef.loadSprite(Assets.pickachuG),
        BirdMovement.down: await gameRef.loadSprite(Assets.pickachuG),
      };
    }else if(character == 'shinchan'){
      sprites = {
        BirdMovement.middle : await gameRef.loadSprite(Assets.shinChanG),
        BirdMovement.up: await gameRef.loadSprite(Assets.shinChanG),
        BirdMovement.down: await gameRef.loadSprite(Assets.shinChanG),
      };
    }else{
      sprites = {
        BirdMovement.middle : await gameRef.loadSprite(Assets.pappuG),
        BirdMovement.up: await gameRef.loadSprite(Assets.pappuG),
        BirdMovement.down: await gameRef.loadSprite(Assets.pappuG),
      };
    };
  }
}