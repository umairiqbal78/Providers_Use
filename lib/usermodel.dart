import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String? _username;
  String? _email;
  String? _age;
  User(this._username, this._email, this._age);
  String? get username => _username;
  String? get email => _email;
  String? get age => _age;

  void updateAge(String? age) {
    _age = age;
    notifyListeners();
  }

  void updateName(String? name) {
    _username = name;
    notifyListeners();
  }

  void updateEmail(String? email) {
    _email = email;
    notifyListeners();
  }
}
