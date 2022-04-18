import 'package:beginning/ui/flappyBird/game.dart';
import 'package:beginning/ui/user_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
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
        title: "伟大的开始",
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
