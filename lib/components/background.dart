import 'package:copter_game/game/assets.dart';
import 'package:copter_game/game/copter_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent with HasGameRef<CopterGame>{
  Background();

  @override
  Future<void> onLoad() async{
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}