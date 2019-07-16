import 'package:art_foodthai/models/food_model.dart';
import 'package:flutter/material.dart';

class DetailFood extends StatefulWidget {
  final FoodModel foodModel;
  DetailFood({Key key, this.foodModel}) : super(key: key);

  @override
  _DetailFoodState createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  FoodModel foodModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodModel = widget.foodModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodModel.NameFood),
      ),
      body: Center(
        child: Container(
          height: 350.0,
          width: 450.0,
          child: Image.network(foodModel.ImagePath),
        ),
      ),
    );
  }
}
