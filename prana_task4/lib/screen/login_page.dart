import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController unameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String uname, pass;

  GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: Colors.white,
      body: Container(
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
                  child: Image.asset('assets/farm-app.png',height: 150.0,)
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
                obscureText: true,
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
                  } else if(uname != 'udacodingid'){
                    _formKey.currentState.showSnackBar(SnackBar(
                      content: Text('User Name is not Registered!'),
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
                  } else if(pass != 'udacodingJaya2021'){
                    _formKey.currentState.showSnackBar(SnackBar(
                      content: Text('Wrong Password!'),
                      action: SnackBarAction(label: 'Close', onPressed: (){}),
                      )
                    );
                  } else {
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
                  text: "Don't have an account? ",
                  style: TextStyle(fontSize: 15.0, color:Colors.brown),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(decoration: TextDecoration.underline, color: Colors.purple[900]),
                      recognizer: new TapGestureRecognizer()..onTap = (){
                        print("halaman signup");
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
    );
  }
}