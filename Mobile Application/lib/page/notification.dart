import 'package:flutter/material.dart';

//---------------------SwitchListTile for push notification class start here---------------------
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Push notifications',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          )),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
    );
  }
}
//------------------------SwitchList class for push notification end here-----------------

//---------------------SwitchListTile for checkout reminders class start here---------------------
class MyStatefulWidget1 extends StatefulWidget {
  const MyStatefulWidget1({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget1> createState() => _MyStatefulWidget1State();
}

class _MyStatefulWidget1State extends State<MyStatefulWidget1> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Check out reminders',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          )),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
    );
  }
}
//------------------------SwitchList class for checkout reminders end here-----------------

//---------------------SwitchListTile for COVID-19 updates class start here---------------------
class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget2> createState() => _MyStatefulWidget2State();
}

class _MyStatefulWidget2State extends State<MyStatefulWidget2> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('COVID-19 updates',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          )),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
    );
  }
}
//------------------------SwitchList class for COVID-19 updates end here-----------------

class notificatio_preference extends StatefulWidget {
  const notificatio_preference({Key? key}) : super(key: key);

  @override
  _notificatio_preferenceState createState() => _notificatio_preferenceState();
}

class _notificatio_preferenceState extends State<notificatio_preference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------App bar------------------------
      appBar: AppBar(
        title: Text(
          'Notification Preferences',
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.pop(context)),
      ),

      //----------------------body section-----------
      body: Container(
        child: Container(
          color: Colors.blue[100],
          //----------Box 1 start-----------------------
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue[100],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 0,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            children: [
                              //----------------call SwitchListTile class method------------
                              Column(
                                children: [
                                  MyStatefulWidget(),
                                ],
                              ),
                              //---------------End SwitchListTile class method----------------
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Get importatant alerts about the app,",
                                      style: TextStyle(
                                          color: Colors.blue[600],
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "including new features.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue[600]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //-------------------------Box 1 End-----------------------------
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                child: Column(
                  children: [
                    Text("TOPICS",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.blue[600],
                          fontSize: 16,
                        ))
                  ],
                ),
              ),

              //------------Horizontal line start-----------
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),
              //------------Horizontal line end here----------------

              //------------------Box 2 start------------------------------
              Column(
                children: [
                  Container(
                    color: Colors.blue[100],
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 0,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      MyStatefulWidget1(),
                                    ],
                                  ),
                                  //---------------End SwitchListTile class method----------------
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Get reminders to check out of a",
                                          style: TextStyle(
                                              color: Colors.blue[600],
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 0, 10, 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "venue after two hours.",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue[600]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //--------------------Box 2 End here----------------
                  //----------------Box 3 Start here---------------------
                  Column(
                    children: [
                      //next....................
                      Container(
                        color: Colors.blue[100],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 6, 3, 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'After 2 hours',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: 170,
                                          ),
                                          Image.asset(
                                              'assets/icons8-forward-48.png'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //------------------Box 3 End here----------------------------------
                      //------------Horizontal line start-----------
                      const Divider(
                        height: 20,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.white,
                      ),
                      //------------Horizontal line end here-----------
                      //---------------------Box 4 Start here-------------------------------
                      Column(
                        children: [
                          Container(
                            color: Colors.blue[100],
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 0,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              MyStatefulWidget2(),
                                            ],
                                          ),
                                          //---------------End SwitchListTile class method----------------
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 0, 10, 0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Get the latest information from Health",
                                                  style: TextStyle(
                                                      color: Colors.blue[600],
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 0, 10, 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Department.",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blue[600]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //-------------------Box 4 end here--------------------
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
