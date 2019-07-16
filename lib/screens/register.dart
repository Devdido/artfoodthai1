import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // explicit
  final formkey = GlobalKey<FormState>();
  String name, user, password;

  // method

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
        helperStyle: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
        helperText: 'Type Display Name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name In Blank';
        }
      },
      onSaved: (String value) {
        name = value;
      },
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
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Username';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

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
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Type Password';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Click Upload');
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          print('name = $name, user = $user,password = $password');
          registerToserver();
        }
      },
    );
  }

  Future<void> registerToserver() async {
    String urlString =
        'https://www.androidthai.in.th/ooo/addDataArt.php?isAdd=true&Name=$name&User=$user&Password=$password';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result = $result');
    if ((result.toString()) == 'true') {
     Navigator.of(context).pop(); 
    }
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
        child: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              nameText(),
              userText(),
              passText(),
            ],
          ),
        ),
      ),
    );
  }
}
