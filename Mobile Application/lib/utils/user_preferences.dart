import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUserID = 'id';
  static const _keyUserName = 'username';
  static const _keyUserNIC = 'nic';
  static const _keyUserPhoneNumber = 'phone';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserID(String value) async =>
      await _preferences.setString(_keyUserID, value);

  static Future setUserName(String value) async =>
      await _preferences.setString(_keyUserName, value);

  static Future setNIC(String value) async =>
      await _preferences.setString(_keyUserNIC, value);

  static Future setPhoneNumber(String value) async =>
      await _preferences.setString(_keyUserPhoneNumber, value);

  static  String? getUserID() => _preferences.getString(_keyUserID);
  static  String? getUserName() => _preferences.getString(_keyUserName);
  static  String? getNIC() => _preferences.getString(_keyUserNIC);
  static  String? getPhoneNumber() => _preferences.getString(_keyUserPhoneNumber);
}
  // static const myUser=User(
  //   name:,
  //   nic:,
  //   phone:,

  //   isDarkMode:false,
  // );


