import 'package:flutter_application_1/page/home.dart';
import 'package:flutter_application_1/page/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var uid;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //form key

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your Email");
        }

        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),

        //enabledBorder: Is activated when enabled is set to true (by default enabled property of TextField is true)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),

        hintText: "Email",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid password(Min. 6 Character");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),

        //enabledBorder: Is activated when enabled is set to true (by default enabled property of TextField is true)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),

        hintText: "Password",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
      ),
    );

    //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(3),
      color: Colors.blue[600],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
    );

    //create button
    final signupButton = Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.blue, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(3)),
      color: Colors.white,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignupScreen()));
          },
          child: Text(
            "Create account",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.blue),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.blue[50],

      //App bar
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        automaticallyImplyLeading: false,
      ),

      //body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Log in ",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                        SizedBox(height: 25),
                        emailField,
                        SizedBox(height: 25),
                        passwordField,
                        SizedBox(height: 25),
                        loginButton,
                        SizedBox(height: 10),
                        signupButton,
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Forget Password ? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Sucessful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => home())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
      //getting UID from current user
      final User? user = _auth.currentUser;
      uid = user!.uid;

      await UserPreferences.setUserID(uid);
    }
  }
}
