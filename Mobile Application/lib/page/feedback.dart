import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class feedback extends StatefulWidget {
  final fbState;

  const feedback({Key? key, required this.fbState}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final controllerText = TextEditingController();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2689FB),
        title: Center(
          child: Text('Give Feedback'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [], //3dot button
      ),
      body: SingleChildScrollView(
        //physics: ClampingScrollPhysics(),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            // SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'How did you go with your COVID \nSafe Check-in?',
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [widget.fbState ? good() : notSoGood()],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tell us why (optional)',
                        style: TextStyle(
                            color: Color(0xFF2689FB),
                            fontSize: 20,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  TextField(
                    controller: controllerText,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Enter your suggestions here",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(height: 10),
                  Column(children: [
                    ElevatedButton(
                        child: Text(
                          "Submit feedback",
                          style: TextStyle(
                              fontSize: 20,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2699FB),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 8),
                            minimumSize: Size(280, 35)),
                        onPressed: () {
                          final feed = controllerText.text;
                          createFeed(feed: feed);
                          Navigator.pop(context);
                        }),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget good() => Container(
        //width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          children: <Widget>[
            Icon(Icons.check_circle, color: Color(0xFF2699FB), size: 100),
            Text(
              'Good',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF2699FB)),
            ),
          ],
        ),
      );
  Widget notSoGood() => Container(
        child: Column(
          children: <Widget>[
            Icon(Icons.cancel, color: Color(0xFFB4B4B4), size: 100),
            Text(
              'Not so good',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF2699FB)),
            ),
          ],
        ),
      );
  int id = 0;
  Future createFeed({required String feed}) async {
    final docFeed = FirebaseFirestore.instance.collection('feedbacks').doc();
    id++;

    final json = {'feed': widget.fbState, 'opinion': feed};

    await docFeed.set(json);
  }
}
