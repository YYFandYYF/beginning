import 'package:beginning/ui/tankGame.dart';
import 'package:flutter/material.dart';

///子弹
class Bullet {
  Offset position;
  double angle = 0;
  bool isOffscreen = false; //飞出屏幕
  final double speed = 300; // 飞行速度
  final TankGame tankGame;

  Bullet(this.tankGame, this.position, this.angle);

  void render(Canvas canvas) {
    canvas.save();
    canvas.translate(position.dx, position.dy);

    canvas.rotate(angle); // 旋转角度

    canvas.drawRect(const Rect.fromLTWH(-1, -3, 16, 6),
        Paint()..color = const Color(0xffff0000));

    canvas.restore();
  }

  void update(double t) {
    if (isOffscreen) {
      return;
    }

    position = position + Offset.fromDirection(angle, speed * t);
    if (position.dx < -50 ||
        position.dx > tankGame.screenSize!.width + 50 ||
        position.dy < -50 ||
        position.dy > tankGame.screenSize!.height + 50) {
      isOffscreen = true;
    }
  }
}
