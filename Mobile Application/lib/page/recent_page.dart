import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/feedback.dart';

import 'package:flutter_application_1/page/qr_scan_page.dart';
import 'dart:math' as math;
import 'package:flutter_application_1/model/entry.dart';
import 'package:intl/intl.dart';

import 'checkOut_time.dart';

class RecentPage extends StatefulWidget {
  final String id;
  final String name;
  final String checkIn;
  final Timestamp checkInTimestamp;
  final String checkOut;

  const RecentPage({
    Key? key,
    required this.id,
    required this.name,
    required this.checkIn,
    required this.checkInTimestamp,
    required this.checkOut,
  }) : super(key: key);
  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  Widget build(BuildContext context) {
    if (widget.name != '') {
      if (widget.checkOut == "03 Oct 1998 - 03:00AM") {
        return buildEntryNotCheckedOut(
            context, widget.name, widget.checkIn, widget.checkInTimestamp);
      } else {
        return buildEntry(
            context, widget.name, widget.checkIn, widget.checkOut);
      }
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
                      'Make your first scan press the button\n below',
                      style: TextStyle(fontSize: 15, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            const SizedBox(height: 18),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                primary: Color(0xFF2699FB),
                side: BorderSide(color: Color(0xFF2699FB)),
              ),
              label: Text('Scan Now'),
              icon: Icon(Icons.qr_code_scanner, size: 32),
              onPressed: () {
                DefaultTabController.of(context)!.animateTo(0);
              },
            )
          ],
        ),
      );
    }
    // });
  }

  Widget buildEntry(
      BuildContext context, String name, String checkIn, String checkOut) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(height: 8),
      Container(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xFF20991B),
                size: 50,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Color(0xFF2689FB),
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Color(0xFFE8E8E8),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(children: [
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
                                  checkIn,
                                  textAlign: TextAlign.start,
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
                  Row(children: [
                    Transform.rotate(
                      angle: 90 * math.pi / 180, //set the angel
                      child: Icon(
                        Icons.horizontal_rule,
                        color: Color(0xFF707070),
                        size: 15,
                      ),
                    ),
                  ]),
                  Row(children: [
                    Transform.rotate(
                      angle: 90 * math.pi / 180, //set the angel
                      child: Icon(
                        Icons.horizontal_rule,
                        color: Color(0xFF707070),
                        size: 15,
                      ),
                    ),
                  ]),
                  Row(children: [
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
                                  checkOut,
                                  textAlign: TextAlign.start,
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
              ),
              SizedBox(height: 18),
              feedBack(context)
            ],
          )),
    ]));
  }

  Widget buildEntryNotCheckedOut(BuildContext context, String name,
      String checkIn, Timestamp checkInTimestamp) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(height: 8),
      Container(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xFF20991B),
                size: 50,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Color(0xFF2689FB),
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Color(0xFFE8E8E8),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
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
                                    checkIn,
                                    textAlign: TextAlign.start,
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
                    Row(children: [
                      Transform.rotate(
                        angle: 90 * math.pi / 180, //set the angel
                        child: Icon(
                          Icons.horizontal_rule,
                          color: Color(0xFF707070),
                          size: 15,
                        ),
                      ),
                    ]),
                    Row(children: [
                      Transform.rotate(
                        angle: 90 * math.pi / 180, //set the angel
                        child: Icon(
                          Icons.horizontal_rule,
                          color: Color(0xFF707070),
                          size: 15,
                        ),
                      ),
                    ]),
                    Row(children: [
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
                    SizedBox(
                      height: 25,
                    ),
                    Column(children: [
                      ElevatedButton(
                        child: Text(
                          "Check out",
                          style: TextStyle(
                              fontSize: 20,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFCE1717),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 8),
                            minimumSize: Size(280, 35)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => checkOut_time(
                                      id: widget.id,
                                      name: name,
                                      checkIn: checkIn,
                                      checkInTimestamp: checkInTimestamp,
                                      checkOut: widget.checkOut,
                                    )),
                          );
                        },
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 18),
              feedBack(context)
            ],
          )),
    ]));
  }

  Widget feedBack(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "How was your check-in experience?",
            style: TextStyle(
                color: Color(0xFF2689FB),
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            //children: [TextButton(child: Text("Good")),],
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    primary: Color(0xFF2699FB),
                    side: BorderSide(color: Color(0xFF2699FB), width: 2),
                  ),
                  label: Text(
                    'Good',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(Icons.check_circle,
                      color: Color(0xFF2699FB), size: 45),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => feedback(fbState: true)),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    primary: Color(0xFF2699FB),
                    side: BorderSide(color: Color(0xFF2699FB), width: 2),
                  ),
                  label: Text('Not so good',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  icon: Icon(Icons.cancel, color: Color(0xFFB4B4B4), size: 45),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => feedback(fbState: false)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
