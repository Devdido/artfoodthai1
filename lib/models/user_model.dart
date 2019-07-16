class UserModel {
  // Field

  String id, Name, User, Password;

  // Constructor
  UserModel(this.id, this.Name, this.User, this.Password);
  UserModel.parseJson(Map<String, dynamic> parseJson) {
    id = parseJson['id'];
    Name = parseJson['Name'];
    User = parseJson['User'];
    Password = parseJson['Password'];
  }
}
