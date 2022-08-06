import 'package:flutter_application_1/page/page6.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
   
    //let's start button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xFFAF0B2C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
          height: 40,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text(
            "Log in",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
          )),
    );
    //Let's start button end

     final facebookButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xFFF1F5F9),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
          height: 40,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text(
            "Facebook",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Poppins'),
          )),
    );

     final googleButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xFFF1F5F9),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
          height: 40,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text(
            "Google",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Poppins'),
          )),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("LoginScreen.png"), fit: BoxFit.cover),
      ),
        child: Container(
         child: Padding(
            padding: EdgeInsets.all(20),
            child: Column( 
              children: <Widget>[   
               
      
                loginButton,
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Forget Password?", 
                        style: TextStyle(
                                fontSize: 18, color: Colors.black),),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Or continue with",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(98, 36, 36, 35),
                        )),
                  ],
                  ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    facebookButton,
                    SizedBox(
                      width: 10,
                    ),
                    googleButton,
                  ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account? ",
                          style: TextStyle(
                              fontSize: 16, color: Color.fromARGB(98, 36, 36, 35)),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      chooseRole()));
                        },
                        child: Text(
                          "Create now",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xFFAF0B2C)),
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
