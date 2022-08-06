import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/login.dart';
import 'package:flutter_application_1/page/setting.dart';
import 'package:flutter_application_1/model/entry.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/page/history_page.dart';
import 'package:flutter_application_1/page/qr_scan_page.dart';
import 'package:flutter_application_1/page/recent_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabPage extends StatefulWidget {
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  String id = '';
  String name = '';
  String checkIn = '';
  Timestamp checkInTimestamp = Timestamp.fromMicrosecondsSinceEpoch(0);
  String checkOut = '';
  bool badgeState = false;

  Stream<List<Entry>> readEntries() => FirebaseFirestore.instance
      .collection('users')
      .doc(UserPreferences.getUserID())
      .collection('EntryDetails')
      .orderBy('check-in', descending: false)
      .limitToLast(1)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());

  String timeFormatter(DateTime dt) {
    final f = new DateFormat('dd MMM yyyy - hh:mma');

    return f.format(dt);
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Entry>>(
      initialData: [],
      stream: readEntries(),
      builder: (context, snapshot) {
        if (snapshot.data?.isEmpty == false) {
          final users = snapshot.data!;
          id = users[0].qrID;
          name = users[0].placeName;
          checkIn = timeFormatter(users[0].checkIn);
          checkInTimestamp = users[0].checkInTimestamp;
          checkOut = timeFormatter(users[0].checkOut);
          badgeState = checkOut == "03 Oct 1998 - 03:00AM" ? true : false;
          return body();
        } else {
          return body();
        }
      });

  Widget body() => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF2689FB),
            title: Center(
              child: Text('COVID Safe Check-in'),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: () => {Navigator.pop(context)},
            ),
            actions: [
              // PopupMenuButton<int>(
              //   onSelected: (item) => onSelected(context, item),
              //   itemBuilder: (context) => [
              //     PopupMenuItem<int>(value: 0, child: Text('Settings')),
              //     PopupMenuItem<int>(value: 1, child: Text('Logout'))
              //   ],
              // )
            ],
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                color: Color(0xFFFFFFFF),
                child: _tabBar,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              QRScanPage(),
              RecentPage(
                id: id,
                name: name,
                checkIn: checkIn,
                checkOut: checkOut,
                checkInTimestamp: checkInTimestamp,
              ),
              HistoryPage(),
            ],
          ),
        ),
      );

  TabBar get _tabBar => TabBar(
        labelColor: Color(0xFF2689FB),
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(text: 'Scan'),
          //check-out data from firestore condition
          if (badgeState)
            buildCustomBadge(child: Tab(text: ('   Recent   ')))
          else
            Tab(text: 'Recent'),
          Tab(text: 'History'),
        ],
      );
}

Widget buildPage(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );

buildCustomBadge({required Tab child}) {
  return Stack(
    children: [
      child,
      Positioned(
          top: 12,
          right: 2,
          child: CircleAvatar(
            backgroundColor: Color(0xFFCE1717),
            radius: 4,
          )),
    ],
  );
}

// Future<void> onSelected(BuildContext context, int item) async {
//   switch (item) {
//     case 0:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => setting()),
//       );
//       break;
//     case 1:
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.clear();
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       break;
//   }
// }
