import 'package:art_foodthai/models/food_model.dart';
import 'package:art_foodthai/models/user_model.dart';
import 'package:art_foodthai/screens/detail_food.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class MyService extends StatefulWidget {
  final UserModel userModel;
  MyService({Key key, this.userModel}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//  explicit
  UserModel userModel;
  List<FoodModel> foodModels = [];

  // method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    // print('Name = ${userModel.Name}');
    readAlldata();
  }

  Future<void> readAlldata() async {
    String url = 'https://www.androidthai.in.th/ooo/getAllFood.php';
    var response = await get(url);
    var result = json.decode(response.body);
    print('$result');

    for (var parseJson in result) {
      FoodModel foodModel = FoodModel.formJson(parseJson);
      setState(() {
        foodModels.add(foodModel);
      });
    }
  }

  Widget titleAppbar() {
    return Column(
      children: <Widget>[showTitle(), showUser()],
    );
  }

  Widget showTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        'My Service',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget showUser() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        'Login By ${userModel.Name}',
        style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget showPic(int index) {
    return Container(
      width: 180.0,
      height: 150.0,
      margin: EdgeInsets.all(6.0),
      child: Image.network(
        foodModels[index].ImagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget nameFood(int index) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      alignment: Alignment.topCenter,
      child: Text(
        foodModels[index].NameFood,
        style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
      ),
    );
  }

  String detailShort(String detailString) {
    String result = detailString;
    if (detailString.length >= 50) {
      result = detailString.substring(0, 50);
      result = '$result ...';
    }
    return result;
  }

  Widget showDetail(int index) {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      alignment: Alignment.topLeft,
      child: Text(
        detailShort(foodModels[index].Detail),
        style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget showPrice(int index) {
    return Container(
      alignment: Alignment.topCenter,
      child: Text(foodModels[index].Price),
    );
  }

  Widget showText(int index) {
    return Expanded(
      child: Column(
        children: <Widget>[
          nameFood(index),
          showDetail(index),
          showPrice(index),
        ],
      ),
    );
  }

  Widget showListview() {
    return ListView.builder(
      itemCount: foodModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[showPic(index), showText(index)],
            ),
          ),
          onTap: () {
            var detailRoute = MaterialPageRoute(
                builder: (BuildContext context) => DetailFood(
                      foodModel: foodModels[index],
                    ));
            Navigator.of(context).push(detailRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleAppbar(),
      ),
      body: showListview(),
    );
  }
}
