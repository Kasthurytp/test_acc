import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/page/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final nicEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First name can not be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name(Min.3 Character");
        }
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
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
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );

    final nicField = TextFormField(
      autofocus: false,
      controller: nicEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        String pattern = r'^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$';
        RegExp regExp = RegExp(pattern);
        if (value!.length == 0) {
          return 'Required';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter valid NIC';
        }
        return null;
      },
      onSaved: (value) {
        nicEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "NIC",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );

    //address field
    final addressField = TextFormField(
      autofocus: false,
      controller: addressEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Address can not be empty");
        }
      },
      onSaved: (value) {
        addressEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Address",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );

    //phone  number field
    final phoneNumberField = TextFormField(
      autofocus: false,
      controller: phoneNumberEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
        if (value!.isEmpty) {
          return ("Phone number is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid phone number");
        }
      },
      onSaved: (value) {
        phoneNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Phone Number",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid password(Min. 6 Character");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blue[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        //errorBorder: Is activated when there is some error (i.e. a failed validate)
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );

    //sign up button
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(3),
      color: Colors.blue[600],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signup(
                nameEditingController.text,
                emailEditingController.text,
                nicEditingController.text,
                addressEditingController.text,
                phoneNumberEditingController.text);
          },
          child: Text(
            "Create account",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
    );

    //log in button
    final loginButton = Material(
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
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text(
            "Log in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.blue),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
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
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Create an account ",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                        SizedBox(height: 20),
                        nameField,
                        SizedBox(height: 10),
                        emailField,
                        SizedBox(height: 10),
                        nicField,
                        SizedBox(height: 10),
                        addressField,
                        SizedBox(height: 10),
                        phoneNumberField,
                        SizedBox(height: 10),
                        passwordField,
                        SizedBox(height: 10),
                        confirmPasswordField,
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "By creating an account you agree to our",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Terms of Service and Privacy Policy.",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        signupButton,
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "OR",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        loginButton,
                        SizedBox(height: 10),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup(String firstName, String email, String nic, String address,
      String phoneNumber) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(
              email: email, password: passwordEditingController.text)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //Writing all the values
    userModel.name = nameEditingController.text;
    userModel.nic = nicEditingController.text;
    userModel.email = user!.email;
    userModel.address = addressEditingController.text;
    userModel.phoneNumber = phoneNumberEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.tomap());

    Fluttertoast.showToast(msg: "Account Created Sucessfully.");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
