import 'package:flutter_application_1/page/page4.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onboarding3 extends StatefulWidget {
  onboarding3({Key? key}) : super(key: key);

  @override
  _onboarding3State createState() => _onboarding3State();
}

class _onboarding3State extends State<onboarding3> {
  @override
  Widget build(BuildContext context) {
    //let's start button
    final startButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
          height: 40,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => onboarding4()));
          },
          child: Text(
            "Done",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Color(0xFFAF0B2C), fontFamily: 'Poppins'),
          )),
    );

    //Let's start button end

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("OnboardingScreen3.png"), fit: BoxFit.cover),
      ),
       child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "The best things in the life are not",
                style: TextStyle(color: Colors.white, fontFamily: 'Arial', fontSize: 20),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "things, they are moments",
                style: TextStyle(color: Colors.white, fontFamily: 'Arial' ,fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              startButton,
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
    );
  }
}
