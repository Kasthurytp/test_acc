import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/colorTheme.dart';
import 'package:flutter_application_1/page/page4.dart';
import 'package:flutter_application_1/page/page7.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class chooseRole extends StatefulWidget {
  const chooseRole({Key? key}) : super(key: key);

  @override
  _chooseRoleState createState() => _chooseRoleState();
}

const primaryColor = Color(0xFFAF0B2C);

class _chooseRoleState extends State<chooseRole> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => onboarding4()))),
      ),
      body: Container(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
                  SizedBox(height: 30,),
                  Container(
                      child: Text(
                        'Choose Your Role',
                        style: TextStyle(
                            color: Color(0xFFAF0B2C), fontSize: 26),
                      ),
                    ),

                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(150, 100, 150, 150),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFAF0B2C),
                              style: BorderStyle.solid,
                              width: 0,
                            ),
                            color: Color(0xFFAF0B2C),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(1, 40, 1, 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new Image.asset(
                                  'assets/theme.png',
                                  width: 22.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                                Text('     Vendors',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                  ),
                    

                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(150, 10, 150, 150),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFAF0B2C),
                            style: BorderStyle.solid,
                            width: 0,
                          ),
                          color: Color(0xFFAF0B2C),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(1, 40, 1, 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              new Image.asset(
                                'assets/theme.png',
                                width: 22.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                              Text('     Users',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                ),
                    


            ],
          ),
        ),
      ),
    );
  }
}
