import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text(
            'Light',
            style: TextStyle(color: Colors.blue),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Dark',
            style: TextStyle(color: Colors.blue),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

//next.....................................

class color_theme extends StatefulWidget {
  const color_theme({Key? key}) : super(key: key);

  @override
  _color_themeState createState() => _color_themeState();
}

class _color_themeState extends State<color_theme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Colour theme',
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        child: Container(
          color: Colors.blue[100],
          child: Column(
            children: [
              Container(
                color: Colors.blue[100],
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 0,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 10, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Colour theme,',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Set the display theme of your app",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.blue[600]),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  MyStatefulWidget(),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
