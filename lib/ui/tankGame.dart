import 'package:beginning/ui/bullet.dart';
import 'package:beginning/ui/tank.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class TankGame extends FlameGame {

  Size? screenSize;
  List<Bullet>? bullets;
  Tank? tank;
  double? targetBodyAngle;
  double? targetTurretAngle;
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if(screenSize == null){
      return;
    }

    canvas.drawRect(Rect.fromLTWH(0, 0, screenSize!.width, screenSize!.height), Paint()..color = const Color(0x00000000));

    tank?.render(canvas);

    bullets?.forEach((element) {element.render(canvas);});
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    screenSize = canvasSize.toSize();

    tank ??= Tank(this, Offset(screenSize!.width / 2, screenSize!.height / 2));

    bullets ??= [];
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(screenSize==null){
      return;
    }

    tank?.update(dt);

    bullets?.forEach((element) {element.update(dt);});

    bullets?.removeWhere((element) => element.isOffscreen);

  }

  void onLeftJoypadChange(Offset offset) {
    if (offset == Offset.zero) {
      tank!.targetBodyAngle = null;
    } else {
      tank!.targetBodyAngle = offset.direction;
    }
  }

  void onRightJoypadChange(Offset offset) {
    if (offset == Offset.zero) {
      tank!.targetTurretAngle = null;
    } else {
      tank!.targetTurretAngle = offset.direction;
    }
  }

  // 开火键
  void onButtonTap() {
    bullets?.add(Bullet(this, tank!.getBulletOffset(), tank!.getBulletAngle()));
  }
}
