import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/checkOut_time.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import '../model/entry.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  // final String id;
  var name;
  // final String checkIn;
  // final String checkOut;

  // const HistoryPage(
  //     {Key? key,
  //     required this.id,
  //     required this.name,
  //     required this.checkIn,
  //     required this.checkOut})
  //     : super(key: key);

  //final controller = TextEditingController();
  Future<void> userNameFetch(recordId) async {
    //String name = '';
    await FirebaseFirestore.instance
        .collection('companies')
        .doc(recordId)
        .get()
        .then(
          (DocumentSnapshot) =>
              name = (DocumentSnapshot.data()!['name'].toString()),
        );
    // return (name);
  }

  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<List<Entry>>(
        stream: readEntries(),
        builder: (context, snapshot) {
          if (snapshot.data?.isEmpty == false) {
            final users = snapshot.data!;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                userNameFetch(users[index].qrID);

                if (users[index].checkOut.toString() ==
                    "1998-10-03 03:00:00.000") {
                  return buildEntryNotCheckedOut(
                      user: users[index], context: context);
                } else {
                  return buildEntry(users[index]);
                }
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Container(
                      color: Color(0xFFBCE0FD),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Icon(
                            Icons.info,
                            color: Color(0xFF2699FB),
                            size: 50,
                          ),
                          Text(
                            'You have no previous history, to\n make your first scan press the button\n below',
                            style: TextStyle(fontSize: 15, height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  const SizedBox(height: 18),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                      primary: Color(0xFF2699FB),
                      side: BorderSide(color: Color(0xFF2699FB)),
                    ),
                    label: Text('Scan Now'),
                    icon: Icon(Icons.qr_code_scanner, size: 32),
                    onPressed: () =>
                        DefaultTabController.of(context)!.animateTo(0),
                  )
                ],
              ),
            );
          }
        },
      ));

  Stream<List<Entry>> readEntries() => FirebaseFirestore.instance
      .collection('users')
      .doc(UserPreferences.getUserID())
      .collection('EntryDetails')
      .orderBy('check-in', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());
  //time stamp format to our desire format
  String timeFormatter(DateTime dt) {
    final f = new DateFormat('dd MMM yyyy - hh:mma');

    return f.format(dt);
  }

  Widget buildEntry(Entry user) =>
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 8),
        Container(
            padding: EdgeInsets.only(top: 0),
            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xFF20991B),
                  size: 150,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    (user.placeName),
                    style: TextStyle(
                        color: Color(0xFF2689FB),
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        color: Color(0xFF20991B),
                        size: 15,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Checked In",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: Text(
                                  timeFormatter(user.checkIn),
                                  textAlign: TextAlign.start,
                                  // maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(children: [
                    Transform.rotate(
                      angle: 90 * math.pi / 180, //set the angel
                      child: Icon(
                        Icons.horizontal_rule,
                        color: Color(0xFF707070),
                        size: 15,
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * math.pi / 180, //set the angel
                      child: Icon(
                        Icons.horizontal_rule,
                        color: Color(0xFF707070),
                        size: 15,
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * math.pi / 180, //set the angel
                      child: Icon(
                        Icons.horizontal_rule,
                        color: Color(0xFF707070),
                        size: 15,
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        color: Color(0xFF20991B),
                        size: 15,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Checked Out",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: Text(
                                  timeFormatter(user.checkOut),
                                  textAlign: TextAlign.start,
                                  // maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF686868),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  )
                ]),
              ],
            )),
        Divider(thickness: 5)
      ]);

  Widget buildEntryNotCheckedOut(
          {required Entry user, required BuildContext context}) =>
      InkWell(
        child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 8),
          Container(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  Icon(
                    Icons.report,
                    color: Color(0xFFFBC326),
                    size: 150,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (user.placeName),
                          style: TextStyle(
                              color: Color(0xFF2689FB),
                              fontSize: 20,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              color: Color(0xFF20991B),
                              size: 15,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 200,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Checked In",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        timeFormatter(user.checkIn),
                                        textAlign: TextAlign.start,
                                        // maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF686868),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(children: [
                          Transform.rotate(
                            angle: 90 * math.pi / 180, //set the angel
                            child: Icon(
                              Icons.horizontal_rule,
                              color: Color(0xFF707070),
                              size: 15,
                            ),
                          ),
                          Transform.rotate(
                            angle: 90 * math.pi / 180, //set the angel
                            child: Icon(
                              Icons.horizontal_rule,
                              color: Color(0xFF707070),
                              size: 15,
                            ),
                          ),
                          Transform.rotate(
                            angle: 90 * math.pi / 180, //set the angel
                            child: Icon(
                              Icons.horizontal_rule,
                              color: Color(0xFF707070),
                              size: 15,
                            ),
                          ),
                        ]),
                        Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record_outlined,
                              color: Color(0xFF707070),
                              size: 15,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 200,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Checked Out",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        ("Pending"),
                                        textAlign: TextAlign.start,
                                        // maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF686868),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        )
                      ]),
                ],
              )),
          Divider(thickness: 5)
        ])),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => checkOut_time(
                      id: user.qrID.toString(),
                      checkIn: timeFormatter(user.checkIn),
                      checkInTimestamp: user.checkInTimestamp,
                      name: user.placeName.toString(),
                      checkOut: timeFormatter(user.checkOut),
                    )),
          );
        },
      );
}
