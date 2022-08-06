import 'package:flutter_application_1/page/onBoading.dart';
import 'package:flutter/material.dart';

class intro extends StatefulWidget {
  intro({Key? key}) : super(key: key);

  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
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

    return Scaffold(
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
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Be Safe 19",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[600],
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Be Safe from Covid pandamic out there, Protect",
                style: TextStyle(color: Colors.blue[600], fontFamily: 'Arial', fontSize: 16),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Yourself",
                style: TextStyle(color: Colors.blue[600], fontFamily: 'Arial' ,fontSize: 16),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 180,
                child: Image.asset("assets/undraw_welcome_cats_thqn.png",
                    fit: BoxFit.contain),
              ),
              SizedBox(height: 95),
              startButton,
            ],
          ),
        ),
      ),
    );
  }
}
