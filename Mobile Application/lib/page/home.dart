import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/tabs.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
}

Future<void> userDetailFetchSharedPreference() async {
  var name;
  var nic;
  var phone;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(UserPreferences.getUserID())
      .get()
      .then(
    (DocumentSnapshot) {
      name = (DocumentSnapshot.data()!['name'].toString());
      nic = (DocumentSnapshot.data()!['nic'].toString());
      phone = (DocumentSnapshot.data()!['phoneNumber'].toString());
      //return name = (DocumentSnapshot.data()!['name'].toString());
    },
  );
  await UserPreferences.setUserName(name);
  await UserPreferences.setNIC(nic);
  await UserPreferences.setPhoneNumber(phone);
  // return (name);
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Widget build(BuildContext context) {
    userDetailFetchSharedPreference();
    
    final checkinButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(3),
      color: Colors.grey[50],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          height: 230,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TabPage()),
            );
          },
          child: Text(
            "COVID Safe Check-in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21, color: Colors.blue[600]),
          )),
    );
    //Let's start button end

    return Scaffold(
      //App bar
      appBar: AppBar(
        title: Text("Be Safe 19"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Future.delayed(Duration.zero, () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => setting()));
              });
            }
            // do something
            ,
          )
        ],
      ),

      body: Container(
        color: Colors.blue[50],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  checkinButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //});
  }
}
