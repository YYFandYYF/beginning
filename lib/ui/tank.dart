import 'dart:math';

import 'package:beginning/ui/tankGame.dart';
import 'package:flutter/material.dart';

///坦克
class Tank{
  final TankGame tankGame;
  Offset position = Offset.zero;
  double bodyAngle = 0;
  double turretAngle = 0;
  double? targetBodyAngle;
  double? targetTurretAngle;

  Tank(this.tankGame, this.position);

  void render(Canvas canvas){
    //准备paint对象
    Paint lightPaint = Paint()..color = const Color(0xffdddddd);
    Paint darkPaint = Paint()..color = const Color(0xff777777);

    //将canvas的原点设置在坦克的坐标上
    canvas.save();
    canvas.translate(position.dx, position.dy);

    //旋转整个坦克
    canvas.rotate(bodyAngle);

    // 绘制坦克
    canvas.drawRect(const Rect.fromLTWH(-20, -15, 40, 30), lightPaint);
    // 绘制轮子
    canvas.drawRect(const Rect.fromLTWH(-24, -23, 48, 8), darkPaint);
    canvas.drawRect(const Rect.fromLTWH(-24, 15, 48, 8), darkPaint);

    canvas.rotate(turretAngle); // 旋转炮台
    // 绘制炮台
    canvas.drawRect(const Rect.fromLTWH(-10, -12, 25, 24), darkPaint);
    canvas.drawRect(const Rect.fromLTWH(0, -3, 36, 6), darkPaint);
    canvas.drawRect(const Rect.fromLTWH(36, -5, 6, 10), darkPaint);

    canvas.restore();
  }

  void update(double t){
    final double rotationRate = pi * t;

    if (targetBodyAngle != null) {

      if (bodyAngle == targetBodyAngle) {
        position = position + Offset.fromDirection(bodyAngle, 100 * t);
      } else {
        position = position + Offset.fromDirection(bodyAngle, 50 * t);
      }

      if (bodyAngle < targetBodyAngle!) {
        if ((targetBodyAngle! - bodyAngle).abs() > pi) {
          bodyAngle = bodyAngle - rotationRate;
          if (bodyAngle < -pi) {
            bodyAngle += pi * 2;
          }
        } else {
          bodyAngle = bodyAngle + rotationRate;
          if (bodyAngle > targetBodyAngle!) {
            bodyAngle = targetBodyAngle!;
          }
        }
      }
      if (bodyAngle > targetBodyAngle!) {
        if ((targetBodyAngle! - bodyAngle).abs() > pi) {
          bodyAngle = bodyAngle + rotationRate;
          if (bodyAngle > pi) {
            bodyAngle -= pi * 2;
          }
        } else {
          bodyAngle = bodyAngle - rotationRate;
          if (bodyAngle < targetBodyAngle!) {
            bodyAngle = targetBodyAngle!;
          }
        }
      }
    }

    if (targetTurretAngle != null) {
      double localTargetTurretAngle = targetTurretAngle! - bodyAngle;
      if (turretAngle < localTargetTurretAngle) {
        if ((localTargetTurretAngle - turretAngle).abs() > pi) {
          turretAngle = turretAngle - rotationRate;
          if (turretAngle < -pi) {
            turretAngle += pi * 2;
          }
        } else {
          turretAngle = turretAngle + rotationRate;
          if (turretAngle > localTargetTurretAngle) {
            turretAngle = localTargetTurretAngle;
          }
        }
      }
      if (turretAngle > localTargetTurretAngle) {
        if ((localTargetTurretAngle - turretAngle).abs() > pi) {
          turretAngle = turretAngle + rotationRate;
          if (turretAngle > pi) {
            turretAngle -= pi * 2;
          }
        } else {
          turretAngle = turretAngle - rotationRate;
          if (turretAngle < localTargetTurretAngle) {
            turretAngle = localTargetTurretAngle;
          }
        }
      }
    }
  }

  Offset getBulletOffset() {
    return position + Offset.fromDirection(getBulletAngle(),36);
  }

  double getBulletAngle(){
    double bulletAngle = bodyAngle + turretAngle;
    while (bulletAngle > pi) {
      bulletAngle -= pi * 2;
    }
    while (bulletAngle < -pi) {
      bulletAngle += pi * 2;
    }
    return bulletAngle;
  }

}
