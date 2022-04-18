// ignore_for_file: slash_for_doc_comments

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/**
 * @author[eda]
 * @version[创建日期，2022/4/18 10:41]
 * @function[功能简介 ]
 **/
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final birdWidth = 31.45; //629
  final birdHeight = 22.2; //444
  double birdX = 10;
  double birdShiftY = 0;
  double t = 0;
  double startPipeX = 100;
  late Timer timer;
  List<Widget> pipes = [];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 32), (timer) {
      setState(() {
        t += 0.032;
        startPipeX -= 5;
        birdShiftY = 5 * t * t;
        if (birdShiftY > 200) {
          t = 0;
        }

        //pipes.add(buildPipe("down", startPipeX + 50*num, screenHeight / 4, screenHeight / 2*Random().nextDouble()));
      });
    });

  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // for(int num =0;num<50;num++){
    //   pipes.add(buildPipe("down", startPipeX + 50*num, screenHeight / 4, screenHeight / 2*Random().nextDouble()));
    // }
    return Scaffold(
        body: InkWell(
      onTap: () {
        setState(() {
          t -= 1;
          if (t < 0) {
            t = 0;
          }
        });
      },
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: screenHeight * 3 / 4,
            width: screenWidth,
            child: const Image(
              image: AssetImage("image/floor.png"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: screenHeight / 4,
            top: 0,
            width: screenWidth,
            child: const Image(
              image: AssetImage("image/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: screenHeight / 2 - birdHeight / 2 - birdShiftY,
            left: birdX,
            width: birdWidth,
            height: birdHeight,
            child: const Image(
              image: AssetImage("image/flappy_bird_yellow.png"),
              fit: BoxFit.cover,
            ),
          ),
          Stack(
            children: pipes,
          )
        ]
      ),
    )
        );
  }

  buildPipe(String type, double left, double bottom, double top) {
    return Positioned(
      left: left,
      top: top,
      bottom: bottom,
      width: 50,
      child: Image(
        image: type == "down"
            ? const AssetImage("image/pipe_down.png")
            : const AssetImage("image/pipe_up.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}
