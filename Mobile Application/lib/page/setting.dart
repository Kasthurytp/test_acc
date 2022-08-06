import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/colorTheme.dart';
import 'package:flutter_application_1/page/home.dart';
import 'package:flutter_application_1/page/login.dart';
import 'package:flutter_application_1/page/notification.dart';
import 'package:flutter_application_1/page/signup.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    final loginButton = Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.blue, width: 0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(3)),
      color: Colors.blue,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 300,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text(
            "Log in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
    );

    //create an account biutton
    final signupButton = Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.blue, width: 0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(3)),
      color: Colors.blue,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          minWidth: 300,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignupScreen()));
          },
          child: Text(
            "Create an account",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => home()))),
      ),
      body: Container(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              //if else start here
              (false)
                  ? Container(
                      color: Colors.blue[50],
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 18, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Log in to access to more services',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                                Text(
                                  'Tailored to you,  ',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                                SizedBox(height: 30),
                                loginButton,
                                SizedBox(height: 20),
                                signupButton,
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.blue[100],
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 0,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(18, 50, 18, 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Welcome, ',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 16),
                                  ),
                                ),
                                Text(
                                  '${UserPreferences.getUserName()}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              //if else end here
              SizedBox(height: 40),
              //perference
              Container(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text('  PREFERENCES',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 2),

              //notifications
              InkWell(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        new Image.asset(
                          'assets/notification.png',
                          width: 22.0,
                          height: 20.0,
                          fit: BoxFit.cover,
                        ),
                        Text('    Notifications',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => notificatio_preference()),
                  );
                },
              ),

              SizedBox(height: 2),

              //color theme
              InkWell(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        new Image.asset(
                          'assets/theme.png',
                          width: 22.0,
                          height: 20.0,
                          fit: BoxFit.cover,
                        ),
                        Text('     Color theme',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => color_theme()),
                  );
                },
              ),

              SizedBox(height: 20),

              //information
              Container(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text('INFORMATION', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 2),

              //terms and conditions
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      new Image.asset(
                        'assets/termsAndcondition.png',
                        width: 22.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      Text('     Terms and Conditions',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                child: Text(
                  "Log out",
                  style: TextStyle(
                      fontSize: 20, height: 1.5, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFCE1717),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    minimumSize: Size(280, 35)),
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));

                  //createCheckOut(name: name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
