import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prana_task4/screen/signup_page.dart';
import 'package:http/http.dart' as http;
import 'package:prana_task4/screen/splash_login.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  TextEditingController unameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String uname, pass;

  GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future login(uname,pass) async {
    var api = "https://pranatobing.000webhostapp.com/api_task4/login.php";
    var response = await http.post(api, body: {
      "username": uname,
      "password": pass
    });
    var data = json.decode(response.body);
    var status = data['status'];
    var message = data['message'];
    if(status == 'success'){
      var uName = data['username'];
      var fName = data['firstname'];
      var lName = data['lastname'];

      _formKey.currentState.showSnackBar(SnackBar(
        content: Text('Login Success!'),
        action: SnackBarAction(label: 'Close', onPressed: (){}),
        )
      );
      print(uName);
      print(fName);
      print(lName);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>SplashLogin(userName: uName, firstName: fName, lastName: lName)));
    } else {
      _formKey.currentState.showSnackBar(SnackBar(
        content: Text("$message"),
        action: SnackBarAction(label: 'Close', onPressed: (){}),
        )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 160.0),
                  child: Center(
                    child: Container(
                      child: Image.asset('images/farm-app.png',height: 150.0,)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: 0),
                  child: TextFormField(
                    controller: unameController,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      hintStyle: TextStyle(color: Colors.brown),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.brown,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.brown,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.brown,
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.brown,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    controller: passController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.brown),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.brown,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.brown,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.brown,
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock,color: Colors.brown,),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.brown,), 
                        onPressed: _toggle
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                    color: Colors.purple[900],
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),
                    padding: EdgeInsets.symmetric(vertical:15.0, horizontal:50.0),
                    textColor: Colors.white,
                    child: Text(
                      "LOG IN",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
                    ),
                    onPressed: (){
                      uname= unameController.text;
                      pass= passController.text;
                      if(uname == ''){
                        _formKey.currentState.showSnackBar(SnackBar(
                          content: Text('User Name is mandatory!'),
                          action: SnackBarAction(label: 'Close', onPressed: (){}),
                          )
                        );
                      } else if(pass == ''){
                        _formKey.currentState.showSnackBar(SnackBar(
                          content: Text('Password is mandatory!'),
                          action: SnackBarAction(label: 'Close', onPressed: (){}),
                          )
                        );
                      } else {
                        /* _formKey.currentState.showSnackBar(SnackBar(
                          content: Text('Login Success!'),
                          action: SnackBarAction(label: 'Close', onPressed: (){}),
                          )
                        ); */
                        setState(() {
                          login(uname,pass);
                        });
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 50,
                  width: 250,
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(fontSize: 15.0, color:Colors.brown),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(decoration: TextDecoration.underline, color: Colors.purple[900]),
                          recognizer: new TapGestureRecognizer()..onTap = (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupPage()));
                          }
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}