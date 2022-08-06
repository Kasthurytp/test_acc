import 'package:flutter_application_1/page/page5.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onboarding4 extends StatefulWidget {
  onboarding4({Key? key}) : super(key: key);

  @override
  _onboarding4State createState() => _onboarding4State();
}

class _onboarding4State extends State<onboarding4> {
  @override
  Widget build(BuildContext context) {
    //let's start button
    final startButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: Color(0xFFAF0B2C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
          height: 40,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text(
            "Register With Us",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins'),
          )),
    );

    //Let's start button end

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("Register.png"), fit: BoxFit.cover),
      ),
       child: Container(
         child: Padding(
            padding: EdgeInsets.all(20),
            child: Column( 
              children: <Widget>[   
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Lets do our fantasy...",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Moments  Offering wedding planning, styling",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("and catering all under one roof.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ],
                  ),
                SizedBox(
                  height: 550,
                ),
                startButton,
                 SizedBox(
                  height: 10,
                ),
                Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Already have an account?", 
                              style: TextStyle(
                                      fontSize: 18, color: Colors.black),),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
                                },
                                child: Text(
                                  " Log in",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFAF0B2C)),
                                ),
                              )
                            ],
                          ),
                        )
              ],
            ),
          ),
       ),
    );
  }
}
