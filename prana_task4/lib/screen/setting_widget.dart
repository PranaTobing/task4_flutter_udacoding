import 'package:flutter/material.dart';
import 'package:prana_task4/screen/login_page.dart';

class SettingWidget extends StatefulWidget {
  final String userName;
  final String firstName;
  final String lastName;

  SettingWidget({Key key, this.userName, this.firstName, this.lastName}) : super(key: key);

  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.green[400],
              Colors.green[300],
              Colors.green[100],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Setting Page", style: TextStyle(color: Colors.white, fontSize: 35.0),),
                  SizedBox(height: 5.0,),
                  Text("Hi, ${widget.firstName} ${widget.lastName}", style: TextStyle(color: Colors.white, fontSize: 14.0),),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                ),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 110),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.green[400],
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/batman-icon.png'),
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          height: 50,
                          width: 250,
                          child: RaisedButton(
                            color: Colors.green[400],
                            splashColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            padding: EdgeInsets.symmetric(vertical:15.0, horizontal:50.0),
                            textColor: Colors.white,
                            child: Text(
                              "LOG OUT",
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
                            ),
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                          ),
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
    );
  }
}