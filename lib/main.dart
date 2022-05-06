import 'package:beginning/ui/button.dart';
import 'package:beginning/ui/flappyBird/game.dart';
import 'package:beginning/ui/joypad.dart';
import 'package:beginning/ui/tankGame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  //确保flutter启动成功
  WidgetsFlutterBinding.ensureInitialized();
  // 强制竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // 设置全屏
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  final TankGame tankGame = TankGame();
  runApp(
    Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [

            GameWidget(game: tankGame),
            //tankGame.widget
            Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const SizedBox(width: 48),
                    Button(onTap: tankGame.onButtonTap),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const SizedBox(width: 30,),
                    JoyPad(onChange: tankGame.onLeftJoypadChange),
                    const Spacer(),
                    JoyPad(onChange: tankGame.onRightJoypadChange),
                    const SizedBox(width: 30,),
                  ],
                ),
                const SizedBox(height: 30,),
              ],
            )

          ],
        ))
  );
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 715),
      builder: () => MaterialApp(
        navigatorKey: GlobalKey(),
        //在构建导航器时使用的键
        title: "gb",
        routes: {},
        //应用的顶级路由表
        theme: ThemeData(
            primarySwatch: Colors.blue,
            buttonBarTheme:
                const ButtonBarThemeData(mainAxisSize: MainAxisSize.max)),
        home: GamePage(),
      ),
    );
  }
}
