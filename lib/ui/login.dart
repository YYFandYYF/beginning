import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/PreferenceUtil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberPassword = false;
  bool autoLogin = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        //stack组件类似于framelayout，允许子组件可以重叠显示
        children: [
          Container(
            child: Image(
              width: MediaQuery.of(context)
                  .size
                  .width, //MediaQuery.of(context)获取设备信息
              image: const AssetImage("image/login_banner.png"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 175,
              width: MediaQuery.of(context).size.width,
              bottom: 40,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: Color(0x12000000),
                        blurRadius: 6)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Divider(
                        height: 1,
                        color: Color(0xFFE0E8F2),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 40),
                      //约束输入框的最大高度
                      child: TextField(
                        controller: _accountController,
                        cursorColor: Colors.grey, //光标颜色
                        decoration: InputDecoration(
                            suffixIconConstraints:
                                const BoxConstraints.tightFor(width: 23),
                            icon: Image.asset(
                              "image/account.png",
                              width: 26,
                            ),
                            suffixIcon: GestureDetector(
                              child: Image.asset(
                                "image/clear.png",
                                width: 23,
                              ),
                              onTap: clearAccount,
                            ),
                            hintText: "请输入您的账号",
                            border: InputBorder.none,
                            isDense: true,
                            //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
                            hintStyle: const TextStyle(
                                color: Color(0xFF999999), fontSize: 14)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Divider(
                        height: 1,
                        color: Color(0xFF999999),
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      cursorColor: Colors.grey, //光标颜色
                      decoration: InputDecoration(
                          suffixIconConstraints:
                              const BoxConstraints.tightFor(width: 23),
                          icon: Image.asset(
                            "image/password.png",
                            width: 26,
                          ),
                          suffixIcon: GestureDetector(
                            child: Image.asset(
                              "image/clear.png",
                              width: 23,
                            ),
                            onTap: clearPassword,
                          ),
                          hintText: "请输入密码",
                          border: InputBorder.none,
                          isDense: true,
                          //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
                          hintStyle: const TextStyle(
                              color: Color(0xFF999999), fontSize: 14)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Divider(
                        height: 1,
                        color: Color(0xFF999999),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Image(
                            width: 20,
                            height: 20,
                            image: rememberPassword
                                ? const AssetImage(
                                    'image/checkbox_selected.png')
                                : const AssetImage(
                                    'image/checkbox_unselected.png'),
                          ),
                          onTap: () => {
                            rememberPassword = !rememberPassword,
                            setState(() {
                              if (!rememberPassword) {
                                autoLogin = false;
                                PreferenceUtil.setRememberPassword(false);
                                PreferenceUtil.setAutoLogin(false);
                              }
                            })
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "记住密码",
                            style: TextStyle(
                                color: Color(0xFF4C6BBA), fontSize: 14),
                          ),
                        ),
                        Expanded(child: Container()), //此组件会填满row在主轴方向的剩余空间
                        GestureDetector(
                          child: Image(
                            width: 20,
                            height: 20,
                            image: autoLogin
                                ? const AssetImage(
                                    'image/checkbox_selected.png')
                                : const AssetImage(
                                    'image/checkbox_unselected.png'),
                          ),
                          onTap: () => {
                            autoLogin = !autoLogin,
                            setState(() {
                              if (!autoLogin) {
                                PreferenceUtil.setAutoLogin(false);
                              } else {
                                rememberPassword = true;
                              }
                            })
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "自动登录",
                            style: TextStyle(
                                color: Color(0xFF4C6BBA), fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        height: 46,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFF2579F7), Color(0xFF1249B2)]),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: Text(
                            "登  录",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () => onLogin(context),
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 40,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 25,
              decoration: const BoxDecoration(
                  color: Color(0xFFF7FAFD),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "平台版本: 1.0",
                    style: TextStyle(fontSize: 12, color: Color(0xFF869AB3)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void clearAccount() {
    setState(() {
      _accountController.text = '';
    });
  }

  void clearPassword() {
    setState(() {
      _passwordController.text = '';
    });
  }

  void onLogin(BuildContext context) {}
}
