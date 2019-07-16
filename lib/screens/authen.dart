import 'package:art_foodthai/models/user_model.dart';
import 'package:art_foodthai/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  final formkey = GlobalKey<FormState>();
  String user, password;

  // method

  Widget signInButtom() {
    return RaisedButton(
      color: Colors.lightBlue,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          authentication();
        }
      },
    );
  }

  Future<void> authentication() async {
    String urlstring =
        'https://www.androidthai.in.th/ooo/getUser.php?isAdd=true&User=$user';
    var response = await get(urlstring);
    var result = json.decode(response.body);

    if ((result.toString()) == 'null') {
      print('user false');
      myAlertDialog('User False', 'No User: [ $user ] in System');
    } else {
      print('user true result = $result');
      for (var myParseJson in result) {
        UserModel userModel = UserModel.parseJson(myParseJson);
        String truePassword = userModel.Password;
        if (password == truePassword) {
          // Password true

        } else {
          // Password false
          myAlertDialog('Password False', 'Please Try Agains');
        }
      }
    }
  }

  void myAlertDialog(String titleString, String msgString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleString,
            style: TextStyle(color: Colors.red),
          ),
          content: Text(msgString),
          actions: <Widget>[alertButtom(), tXButtom()],
        );
      },
    );
  }

  Widget alertButtom() {
    return FlatButton(
      child: Text('Okay'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget tXButtom() {
    return FlatButton(
      child: Text('test'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget signUpButtom() {
    return OutlineButton(
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('U click sign up');

        var regisRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(regisRoute);
      },
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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Type User';
          }
        },
        onSaved: (String value) {
          user = value;
        },
      ),
    );
  }

  Widget passText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'Not Blank',
          labelStyle: TextStyle(color: Colors.red),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Tpye Password';
          }
        },
        onSaved: (String value) {
          password = value;
        },
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
          child: Form(
            key: formkey,
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
        ));
  }
}
