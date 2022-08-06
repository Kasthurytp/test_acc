import 'package:flutter_application_1/page/signup.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onBoadingPage extends StatefulWidget {
  onBoadingPage({Key? key}) : super(key: key);

  @override
  _onBoadingPageState createState() => _onBoadingPageState();
}

class _onBoadingPageState extends State<onBoadingPage> {
  @override
  Widget build(BuildContext context) {
    //let's start button
    final startButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(3),
      color: Colors.blue[600],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => onBoadingPage()));
          },
          child: Text(
            "LET'S START",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.white),
          )),
    );
    //Let's start button end

    return Scaffold(
      //App bar
      appBar: AppBar(
        title: Text("Be Safe 19"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),

      body: Center(
        //Introduction screen start
        child: IntroductionScreen(
          pages: [
            //intro - loading - 2
            PageViewModel(
              body: '',
              title: 'You can safe your family and your friends',
              image: Image.asset('assets/undraw_suburbs_8b83.png'),
              decoration: getPageDecoration(),
            ),
            //intro - loading - 3
            PageViewModel(
              body: '',
              title:
                  'You can be a responsible citizen to your country, you can help to your government to get back the country to peaceful state again.',
              image: Image.asset('assets/undraw_amusement_park_17oe.png'),
              decoration: getPageDecoration(),
            ),
            //intro - loading - 4
            PageViewModel(
              body: "",
              title: "",
              image: Image.asset('assets/Group 1909.png'),
              decoration: getPageDecoration(),
              footer: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold)),
                child: const Text("DONE"),
              ),
            ),
          ],
          done: Text('DONE'),
          onDone: () => goToSignup(context),
          showNextButton: true,
          next: Text('NEXT'),
          showSkipButton: true,
          skip: Text('SKIP'),
          onSkip: () => goToSignup(context),
          dotsDecorator: getDotDecorator(),
          freeze: true,
          animationDuration: 500,
          skipFlex: 0,
          nextFlex: 0,
        ),
        //Introduction screen end
      ),
    );
  }

  void goToSignup(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignupScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecorator() => DotsDecorator(
        color: Color(0xFFBBDEFB),
        size: Size(10, 10),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        bodyTextStyle: TextStyle(
          fontSize: 13,
          fontFamily: 'Georgia',
          fontWeight: FontWeight.w500,
          color: Colors.blue[600],
        ),
        titleTextStyle:
            TextStyle(fontSize: 15, color: Colors.blue[600], height: 1.5),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
        bodyFlex: 0,
      );
}
