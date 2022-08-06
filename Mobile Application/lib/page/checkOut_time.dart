import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:intl/intl.dart';

class checkOut_time extends StatefulWidget {
  final String id;
  final String name;
  final String checkIn;
  final Timestamp checkInTimestamp;
  final String checkOut;

  const checkOut_time(
      {Key? key,
      required this.id,
      required this.name,
      required this.checkIn,
      required this.checkInTimestamp,
      required this.checkOut})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _checkOut_timeState();
}

class _checkOut_timeState extends State<checkOut_time> {
  var docId;
  DateTime dateTime = DateTime.now();
  final controller = TextEditingController();

  Future<void> loadDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(UserPreferences.getUserID())
        .collection('EntryDetails')
        //check in unique in a entry because qrID can be same for one place
        .where("check-in", isEqualTo: widget.checkInTimestamp)
        .get()
        .then(
          (QuerySnapshot snapshot) => {
            snapshot.docs.forEach((f) {
              docId = (f.reference.id);
            }),
          },
        );
    final value = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime);

    final docEntry = await FirebaseFirestore.instance
        .collection('users')
        .doc(UserPreferences.getUserID())
        .collection('EntryDetails')
        .doc(docId);

    DateTime tempDate = new DateFormat("dd-MMM-yyyy HH:mm").parse(value);
    Timestamp myTimeStamp = Timestamp.fromDate(tempDate);

    await docEntry.update({'check-out': myTimeStamp});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2689FB),
          title: Center(
            child: Text('COVID Safe Check-in'),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [], //3dot button
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              // SizedBox(height: 8),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Enter check out time',
                            style: TextStyle(
                                color: Color(0xFF2689FB),
                                fontSize: 20,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              // Here is the explicit parent TextStyle
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF686868),
                                fontFamily: 'Montserrat',
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: 'You checked in at '),
                                new TextSpan(
                                    text: widget.checkIn,
                                    //text: (timeFormatter(widget.checkIn)),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                new TextSpan(
                                    text: '\nEnter the time you checked out.')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 18),
              buildDatePicker(),
              SizedBox(height: 18),

              ElevatedButton(
                child: Text(
                  "Check out",
                  style: TextStyle(
                      fontSize: 20, height: 1.5, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFCE1717),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    minimumSize: Size(280, 35)),
                onPressed: () async {
                  await loadDocId();
                  Navigator.pop(context);

                  //createCheckOut(name: name);
                },
              ),
            ],
          ),
        ));
  }

  Widget buildDatePicker() => SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        initialDateTime: dateTime,
        //minimum date should be 30 days before from current time
        minimumDate: DateTime(DateTime.now().year, 1, 1),
        maximumDate: DateTime.now(),
        mode: CupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (dateTime) =>
            setState(() => this.dateTime = dateTime),
      ));
}
