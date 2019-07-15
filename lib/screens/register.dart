import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // explicit

  // method

  Widget passText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.lightBlue,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.lightGreen),
          helperStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
          helperText: 'Type Password'),
    );
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.lightBlue,
          ),
          labelText: 'Name :',
          labelStyle: TextStyle(color: Colors.lightGreen),
          helperStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
          helperText: 'Type Display Name'),
    );
  }

  Widget userText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.account_box,
            size: 36.0,
            color: Colors.lightBlue,
          ),
          labelText: 'User :',
          labelStyle: TextStyle(color: Colors.lightGreen),
          helperStyle:
              TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
          helperText: 'Type UserName'),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('Register'),
        actions: <Widget>[
          uploadButton(),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
        child: ListView(
          children: <Widget>[
            nameText(),
            userText(),
            passText(),
          ],
        ),
      ),
    );
  }
}
