import 'package:flutter/cupertino.dart';

class LoginLogic {
  bool confirmEmail(String value) {
    RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
      caseSensitive: false,
      multiLine: false,
    );
    if (emailRegex.hasMatch(value) == true) {
      print('Email successful');
      return true;
    } else {
      print("Please provide a valid email address.");
      return false;
    }
  }

  bool confirmPassword(String value) {
    RegExp passwordRegex = new RegExp(
      r"(^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,32}$)?(^(?=.*\d)(?=.*[a-z])(?=.*[@#$%^&+=]).{8,32}$)?(^(?=.*\d)(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,32}$)?(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,32}$)?",
      caseSensitive: false,
      multiLine: false,
    );
    if (passwordRegex.hasMatch(value) == true) {
      print('password successful');
      return true;
    } else {
      print(
          "Minimum eight characters, at least one uppercase letter, one lowercase letter and one number.");
      return false;
    }
  }
}
