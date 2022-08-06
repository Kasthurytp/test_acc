import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/page/detailEntryCheck_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/page/home.dart';
import 'package:flutter_application_1/page/introScreen.dart';
import 'package:flutter_application_1/page/page1.dart';
import 'package:flutter_application_1/page/login.dart';
import 'package:flutter_application_1/page/onBoading.dart';
import 'package:flutter_application_1/page/setting.dart';
import 'package:flutter_application_1/page/signup.dart';
import 'package:flutter_application_1/page/history_page.dart';
import 'package:flutter_application_1/page/qr_new.dart';
import 'package:flutter_application_1/page/tabs.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

late int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');

  //SharedPreferences.setMockInitialValues({});
  await UserPreferences.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.lightBlue),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'onboard': (context) => onboarding1(),
        'home': (UserPreferences.getUserID() == null)
            ? (context) => LoginScreen()
            : (context) => home(),
      },
      //home: onBoadingPage(),
    );
  }
}
