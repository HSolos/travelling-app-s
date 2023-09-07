import 'package:flutter/material.dart';

class AccountUserProvider extends ChangeNotifier {
  //
  String _email = "";
  String _password = "";
  String _name = "";
  String _lastName = "";

  Map _users = {
    'demo@gmail.com': '12345',
    'test@gmail.com': 'test1',
  };

  void addUser(String? email, String? pass) {
    _users[email] = pass;
  }

  //
  get getUsers => _users;

  get getEmail => _email;
  void setEmail(email) {
    _email = email;
    notifyListeners();
  }

  get getPassword => _password;

  void setPassword(pass) {
    _password = pass;
    notifyListeners();
  }

  get getName => _name;

  void setName(str) {
    _name = str;
    notifyListeners();
  }

  get getLastName => _lastName;

  void setLastName(str) {
    _lastName = str;
    notifyListeners();
  }

  void signIn(String emailTxt, String pwdTxt) {
    _email = emailTxt;
    _password = pwdTxt;
    notifyListeners();
  }

  String getAccountName() {
    return "$_name $_lastName";
  }
}
