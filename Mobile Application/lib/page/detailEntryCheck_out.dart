import 'dart:ui' show ImageFilter;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:flutter_application_1/page/home.dart';
import 'package:flutter_application_1/page/setting.dart';

class detail_entry_leave extends StatefulWidget {
  final bool checkBoxVal;
  final String docIDofSubColl;

  const detail_entry_leave({
    Key? key,
    required this.checkBoxVal,
    required this.docIDofSubColl,
  }) : super(key: key);

  @override
  _detail_entry_leaveState createState() => _detail_entry_leaveState();
}

class _detail_entry_leaveState extends State<detail_entry_leave> {
  var name = UserPreferences.getUserName();
  var nic = UserPreferences.getNIC();
  var phone = UserPreferences.getPhoneNumber();

  final firstNameEditingController = TextEditingController();
  final familyNameEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();

  var docId;
  final controller = TextEditingController();

  Future<void> addCheckOut() async {
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
    //final value = DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateTime);

    final docEntry =
        await FirebaseFirestore.instance.collection("users").doc(docId);

    //DateTime tempDate = new DateFormat("dd-MMM-yyyy HH:mm").parse(value);
    Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());

    await docEntry
        .collection("EntryDetails")
        .doc(widget.docIDofSubColl)
        .update({'check-out': myTimeStamp});
  }

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      enabled: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
    final familyNameField = TextFormField(
      enabled: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: nic,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
    final phoneNumberField = TextFormField(
      enabled: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: phone,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );

    final leaveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(3),
      color: Colors.red[900],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //Are you sure dialog box...................
            showGeneralDialog(
              barrierDismissible: true,
              barrierLabel: '',
              barrierColor: Colors.black38,
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (ctx, anim1, anim2) => AlertDialog(
                title: Text(
                  'Are you sure?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[600],
                  ),
                ),
                elevation: 2,
                actions: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/icons8-computer-error-alert-notification-with-alertness-warning-48.png",
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        fixedSize: Size.fromWidth(300),
                        padding: EdgeInsets.all(15)),
                    child: Text('CONFIRM'),
                    onPressed: () async {
                      //adding checkout time to dB
                      await addCheckOut();
                      //Sucessfully Check out dialog box................
                      showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: '',
                        barrierColor: Colors.black38,
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (ctx, anim1, anim2) => AlertDialog(
                          title: Text(
                            'Sucessfully checked-out',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green[800],
                            ),
                          ),
                          content: Text('Have a good day, Stay safe.',
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
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => home()));
                              },
                            ),
                          ],
                        ),
                        transitionBuilder: (ctx, anim1, anim2, child) =>
                            BackdropFilter(
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
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[600],
                        fixedSize: Size.fromWidth(300),
                        padding: EdgeInsets.all(15)),
                    child: Text('NOT NOW'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
          child: Text(
            "Leave",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID Safe Check-in',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => setting()));
            },
          )
        ],
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => home())),
            icon: Icon(Icons.arrow_back_ios_outlined)),
      ),
      body: Container(
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
                  Text("First Name"),
                  SizedBox(height: 15),
                  firstNameField,
                  SizedBox(
                    height: 15,
                  ),
                  Text("Family Name"),
                  SizedBox(
                    height: 15,
                  ),
                  familyNameField,
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'No personal information is shared with the venue. Your contacts details are stored securely with Be Safe 19 and will only be used to contact tracing.'),
                  SizedBox(
                    height: 30,
                  ),
                  leaveButton,
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
