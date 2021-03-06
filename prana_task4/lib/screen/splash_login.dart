import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prana_task4/screen/home_page.dart';

class SplashLogin extends StatefulWidget {
  final String userName;
  final String firstName;
  final String lastName;

  SplashLogin({Key key, @required this.userName, @required this.firstName, @required this.lastName}) : super(key:  key);
  @override
  _SplashLoginState createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/farm-app.png', height: 100.0,),
          SizedBox(height: 30.0,),
          // Text('Welcome - ${widget.userName}'),
          SpinKitFadingCube(color: Colors.purple[400],)
        ],
      ),
    );
  }

  Future<Timer> startTime() async {
    return Timer(Duration(seconds: 3), onDone);
  }

  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(userName: widget.userName, firstName: widget.firstName, lastName: widget.lastName)));
  }
}

