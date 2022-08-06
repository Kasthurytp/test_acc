import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/colorTheme.dart';
import 'package:flutter_application_1/page/page4.dart';
import 'package:flutter_application_1/page/page7.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class venueSelected extends StatefulWidget {
  const venueSelected({Key? key}) : super(key: key);

  @override
  _venueSelectedState createState() => _venueSelectedState();
}

const primaryColor = Color(0xFFAF0B2C);

class _venueSelectedState extends State<venueSelected> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Moments',
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => onboarding4()))),
                actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Future.delayed(Duration.zero, () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => onboarding4()));
              });
            }
            // do something
            ,
          )
        ],
      ),
      body: Container(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
                  SizedBox(
                    height: 50,
                  ),
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         InkWell(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 25, 10),
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
                            padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
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
                        MaterialPageRoute(builder: (context) => venueSelected()),
                      );
                    },
                  ),
                  ],
                  ),
                ],
              ),

                SizedBox(
                height: 20,
              ),
         

                   Padding(
                padding: EdgeInsets.fromLTRB(30, 1, 1, 1),
                child: Row(
                    children: <Widget>[
                      Text("Jaffna",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ],
                    ),
              ),
                   Padding(
                     padding: EdgeInsets.fromLTRB(30, 1, 1, 1),
                     child: Row(
                      children: <Widget>[
                        Text("No: 1229,",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            )),
                      ],
                  ),
                   ),
                   Padding(
                     padding: EdgeInsets.fromLTRB(30, 1, 1, 1),
                     child: Row(
                      children: <Widget>[
                        Text("Poonari Maraththady,",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            )),
                      ],
                  ),
                   ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 1, 1, 1),
                    child: Row(
                      children: <Widget>[
                        Text(" AB16,",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 1, 1, 1),
                    child: Row(
                      children: <Widget>[
                        Text("Jaffna 40000",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 1, 1, 1),
                    child: Row(
                      children: <Widget>[
                        Text("6.Quickly ordered your tasty wedding cake",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
