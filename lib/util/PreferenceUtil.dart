import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {

  static const RememberPasswordKey = 'remember_password';

  static const AutoLogin = 'autoLogin';

  static Future<void> setRememberPassword(bool rememberPassword) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(RememberPasswordKey, rememberPassword);
  }

  static Future<void> setAutoLogin(bool autoLogin) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(AutoLogin, autoLogin);
  }
}