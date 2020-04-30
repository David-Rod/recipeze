import 'package:flutter/material.dart';
import 'login_page.dart';
import 'recipe_info_page.dart';
import 'package:recipeze/create_account.dart';

void main() => runApp(Recipeze());

class Recipeze extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipeze',
      theme: ThemeData(
        //Can use .copyWith() to copy a set of custom accents and colors to a theme
        primaryColor:
            Color(0xFF0A0E21), //Replace the hex with 0xFF to get desired color
        accentColor: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: TextTheme(
            body1: TextStyle(
          color: Colors.white,
        )),
      ),
      ////home: LoginPage(title: 'Recipeze Login'),
      initialRoute: 'login_page',
      routes:
      {
        'login_page': (context) => LoginPage(),
        'create_account': (context) => CreateAccount(),
        'recipe_info_page': (context) => MealDetailScreen(),
      },
    );
  }
}
