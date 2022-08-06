import 'dart:ui' show ImageFilter;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:intl/intl.dart';

import 'package:flutter_application_1/page/detailEntryCheck_out.dart';

class detail_entry_continue extends StatefulWidget {
  final String qrCode;

  const detail_entry_continue({Key? key, required this.qrCode})
      : super(key: key);

  @override
  _detail_entry_continueState createState() => _detail_entry_continueState();
}

class _detail_entry_continueState extends State<detail_entry_continue> {
  final nameEditingController = TextEditingController();
  final nicEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();

  var checkIn;
  var docIDofSubColl;
  bool _checkbox = false;
  bool _checkboxListTile = false;

  var name;
  Future<void> userNameFetch() async {
    await FirebaseFirestore.instance
        .collection('companies')
        .doc(widget.qrCode)
        .get()
        .then(
          (DocumentSnapshot) =>
              name = (DocumentSnapshot.data()!['name'].toString()),
        );
  }

  Future<void> createEntryDetails() async {
    await userNameFetch();
    CollectionReference users =
        await FirebaseFirestore.instance.collection('users');

    Timestamp currentTime = Timestamp.fromDate(DateTime.now());
    DateTime tempDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse("1998-10-03 03:00:00");
    Timestamp defaultCheckOutTime = Timestamp.fromDate(tempDate);
    // users.add({
    //   'name': nameEditingController.text, // John Doe
    //   'nic': nicEditingController.text, // Stokes and Sons
    //   'phoneNumber': phoneNumberEditingController.text, // 42
    //   // 'check-in': currentTime,
    //   // 'check-out': defaultCheckOutTime
    //   // 'qrCode':widget.qrCode  // 42
    // })

// .then((value) => print("User Added"))
    // .catchError((error) => print("Failed to add user: $error"));

    var docId;
    await FirebaseFirestore.instance
        .collection('users')
        .where("nic", isEqualTo: UserPreferences.getNIC())
        .get()
        .then(
          (QuerySnapshot snapshot) => {
            snapshot.docs.forEach((f) {
              docId = (f.reference.id);
            }),
          },
        );

    final docEntry =
        await FirebaseFirestore.instance.collection("users").doc(docId);

    //get place name using recordID (recordID is doc ID in companies collection)

    await docEntry.collection('EntryDetails').add({
      'check-in': currentTime,
      'check-out': defaultCheckOutTime,
      'qrCode': widget.qrCode,
      'placeName': name
    });

    //geting auto id of subcollection Entry Details
    await FirebaseFirestore.instance
        .collection('users')
        .doc(docId)
        .collection('EntryDetails')
        .where("check-in", isEqualTo: currentTime)
        .get()
        .then(
          (QuerySnapshot snapshot) => {
            snapshot.docs.forEach((f) {
              docIDofSubColl = (f.reference.id);
            }),
          },
        );
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

//------------------validate whole fields----------------------
  bool validate() {
    if (formkey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
//-------------------validate whole field end--------------------

//----------------Nic validation function----------------------
  String? validateNIC(value) {
    String pattern = r'^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid NIC';
    }
    return null;
  }
//------------------Nic validation function end----------------------

//-----------------Name validation function start-------------------
  String? validateName(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }
//--------------Name validation function end---------------------------

//-------------Phone number validation function start------------------
  String? validatePhoneNumber(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid phone number.';
    }
    return null;
  }
//------------Phone number validation function end----------------------

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    final nameField = TextFormField(
      scrollPadding: EdgeInsets.only(bottom: 100),
      autofocus: false,
      enabled: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: validateName,
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: UserPreferences.getUserName(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );

    final nicField = TextFormField(
      scrollPadding: EdgeInsets.only(bottom: 100),
      autofocus: false,
      enabled: false,
      controller: nicEditingController,
      keyboardType: TextInputType.name,
      validator: validateNIC,
      onSaved: (value) {
        nicEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: UserPreferences.getNIC(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );

    final phoneNumberField = TextFormField(
      scrollPadding: EdgeInsets.only(bottom: 100),
      autofocus: false,
      enabled: false,
      controller: phoneNumberEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: validatePhoneNumber,
      onSaved: (value) {
        phoneNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: UserPreferences.getPhoneNumber(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );

    final continueButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(3),
      color: Colors.red[900],
      child: MaterialButton(
        child: Text(
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          //add check in time to dB
          await createEntryDetails();

          showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: '',
            barrierColor: Colors.black38,
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (ctx, anim1, anim2) => AlertDialog(
              title: Text(
                'Sucessfully checked-in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              content: Text('When leaving the venue, tap Leave',
                  textAlign: TextAlign.center),
              elevation: 2,
              actions: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/icons8-check-circle-96.png",
                        height: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[800],
                      fixedSize: Size.fromWidth(300),
                      padding: EdgeInsets.all(15)),
                  child: Text('OK'),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detail_entry_leave(
                              //name: nameEditingController.text,
                              //nic: nicEditingController.text,
                              //phone: phoneNumberEditingController.text,
                              checkBoxVal: _checkbox,
                              docIDofSubColl: docIDofSubColl))),
                ),
              ],
            ),
            transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
              child: FadeTransition(
                child: child,
                opacity: anim1,
              ),
            ),
            context: context,
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID Safe Check-in',
        ),
        actions: (null),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_outlined)),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Your Contact Details",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[600],
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 7,
              ),
              // Text(
              //   "All fields are required",
              //   style: TextStyle(
              //     color: Colors.grey[800],
              //     fontSize: 16,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    SizedBox(height: 15),
                    nameField,
                    SizedBox(
                      height: 15,
                    ),
                    Text("NIC"),
                    SizedBox(
                      height: 15,
                    ),
                    nicField,
                    SizedBox(
                      height: 15,
                    ),
                    Text("Phone Number"),
                    SizedBox(
                      height: 15,
                    ),
                    phoneNumberField,
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We respect your policy",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        'No personal information is shared with the venue. Your contacts details are stored securely with Be Safe 19 and will only be used to contact tracing.'),
                    SizedBox(
                      height: 30,
                    ),
                    continueButton,
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
