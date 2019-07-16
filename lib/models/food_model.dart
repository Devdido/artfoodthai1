class FoodModel {
  // Field
  String id,
      Category,
      NameFood,
      Price,
      Detail,
      ImagePath,
      NameReview,
      DetailReview,
      ScoreReview;

  FoodModel(this.id, this.Category, this.NameFood, this.Price, this.Detail,
      this.ImagePath, this.NameReview, this.DetailReview, this.ScoreReview);

  FoodModel.formJson(Map<String, dynamic> parseJson) {
    id = parseJson['id'];
    Category = parseJson['Category'];
    NameFood = parseJson['NameFood'];
    Price = parseJson['Price'];
    Detail = parseJson['Detail'];
    ImagePath = parseJson['ImagePath'];
    NameReview = parseJson['NameReview'];
    DetailReview = parseJson['DetailReview'];
    ScoreReview = parseJson['ScoreReview'];
  }
}
