import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prana_task4/screen/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureTextPass = true; 
  bool _obscureTextPass2 = true; 

  TextEditingController unameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passController2 = TextEditingController();

  String fname, lname, uname, pass, pass2;

  GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();

  void _toggle() {
    setState(() {
      _obscureTextPass = !_obscureTextPass;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureTextPass2 = !_obscureTextPass2;
    });
  }

  Future signup(fname,lname,uname,pass) async{
    var api = "https://pranatobing.000webhostapp.com/api_task4/register.php";
    var response = await http.post(api, body: {
      "firstname": fname,
      "lastname": lname,
      "username": uname,
      "password": pass
    });
    var data = json.decode(response.body);
    var status = data['status'];
    var message = data['message'];
    if(status == 'success'){
      _formKey.currentState.showSnackBar(SnackBar(
        content: Text('$message'),
        action: SnackBarAction(label: 'Close', onPressed: (){}),
        )
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      _formKey.currentState.showSnackBar(SnackBar(
        content: Text('$message'),
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
                  padding: EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      child: Image.asset('images/farm-app.png',height: 130.0,)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: 0),
                  child: TextFormField(
                    controller: unameController,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      labelText: 'User Name',
                      labelStyle: TextStyle(color: Colors.brown),
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
                      // prefixIcon: Icon(Icons.person, color: Colors.brown,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: 0),
                  child: TextFormField(
                    controller: fnameController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.brown),
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
                      // prefixIcon: Icon(Icons.person, color: Colors.brown,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: 0),
                  child: TextFormField(
                    controller: lnameController,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.brown),
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
                      // prefixIcon: Icon(Icons.person, color: Colors.brown,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
                  child: TextFormField(
                    obscureText: _obscureTextPass,
                    controller: passController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.brown),
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
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
                  child: TextFormField(
                    obscureText: _obscureTextPass2,
                    controller: passController2,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.brown),
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
                        onPressed: _toggle2
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
                      "Sign Up",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
                    ),
                    onPressed: (){
                      fname = fnameController.text;
                      lname = lnameController.text;
                      uname= unameController.text;
                      pass= passController.text;
                      pass2 = passController2.text;

                      if(fname == ''){
                        _formKey.currentState.showSnackBar(SnackBar(
                          content: Text('First Name is mandatory!'),
                          action: SnackBarAction(label: 'Close', onPressed: (){}),
                          )
                        );
                      } else if(lname == ''){
                        _formKey.currentState.showSnackBar(SnackBar(
                          content: Text('Last Name is mandatory!'),
                          action: SnackBarAction(label: 'Close', onPressed: (){}),
                          )
                        );
                      } else if(uname == ''){
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
                      } else if(pass.length < 6){
                        _formKey.currentState.showSnackBar(SnackBar(
                          content: Text('Password should be minimum 6 characters!'),
                          action: SnackBarAction(label: 'Close', onPressed: (){}),
                          )
                        );
                      } else if(pass != pass2){
                        _formKey.currentState.showSnackBar(SnackBar(
                          content: Text('Confirm Password should be same!'),
                          action: SnackBarAction(label: 'Close', onPressed: (){}),
                          )
                        );
                      } else {
                        setState(() {
                          signup(fname,lname,uname,pass);
                        });
                        /*Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              nama: uname,
                              password: pass,
                            ),
                          )
                        ); */
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
                      text: "Already have an account? ",
                      style: TextStyle(fontSize: 15.0, color:Colors.brown),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(decoration: TextDecoration.underline, color: Colors.purple[900]),
                          recognizer: new TapGestureRecognizer()..onTap = (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
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