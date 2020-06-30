import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataStoreAndShowPage(),
    );
  }
}

class DataStoreAndShowPage extends StatefulWidget {
  @override
  _DataStoreAndShowPageState createState() => _DataStoreAndShowPageState();
}

class _DataStoreAndShowPageState extends State<DataStoreAndShowPage> {
  final _controller_key = TextEditingController();
  final _controller_data = TextEditingController();

  String text_to_show = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Shared Preferences Flutter'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/sharedpreferences.png'),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _controller_key,
                decoration: InputDecoration(hintText: 'enter your key'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _controller_data,
                decoration: InputDecoration(hintText: 'enter your data'),
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.blueAccent,
                color: Colors.blue,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    saveData(_controller_key.text, _controller_data.text);
                  },
                  child: Center(
                    child: Text(
                      'Store Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.orangeAccent,
                color: Colors.orange,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    readData(_controller_key.text);
                  },
                  child: Center(
                    child: Text(
                      'Retrive Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              color: Colors.grey,
              height: 100.0,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      '$text_to_show',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveData(String key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
    Fluttertoast.showToast(
      msg: "Data Saved Successfully",
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16.0,
    );
  }

  void readData(String text) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      text_to_show = sharedPreferences.getString(text);
    });
  }
}
