import 'package:flutter_application_1/page/page8.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
   
    //let's start button
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xFFAF0B2C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
          height: 40,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => home()));
          },
          child: Text(
            "Log in",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
          )),
    );
    //Let's start button end


    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("SignupScreen.png"), fit: BoxFit.cover),
      ),
        child: Container(
         child: Padding(
            padding: EdgeInsets.all(20),
            child: Column( 
              children: <Widget>[   
                signupButton,
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account? ",
                          style: TextStyle(
                              fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignupScreen()));
                        },
                        child: Text(
                          "Create your account",
                          style: TextStyle(
                              fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
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
