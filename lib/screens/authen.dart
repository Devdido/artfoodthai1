import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit

  // method

  Widget signInButtom() {
    return RaisedButton(
      color: Colors.lightBlue,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButtom() {
    return OutlineButton(
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget showButtom() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButtom(),
          ),
          mySizebox(),
          Expanded(
            child: signUpButtom(),
          ),
        ],
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'User :',
          hintText: 'Not Blank',
          labelStyle: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget passText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'Not Blank',
          labelStyle: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget mySizebox() {
    return SizedBox(
      height: 10.0,
      width: 8.0,
    );
  }

  Widget showLogo() {
    return Container(
      width: 170.0,
      height: 170.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppname() {
    return Text(
      'Artz Foodthai',
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: Colors.red[600],
        fontFamily: 'MetalMania',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan[100],
              Colors.cyan[700],
              Colors.cyan[300],
              Colors.white,
              Colors.purple[300]
            ],
            begin: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            mySizebox(),
            showAppname(),
            userText(),
            passText(),
            mySizebox(),
            showButtom(),
          ],
        ),
      ),
    );
  }
}
