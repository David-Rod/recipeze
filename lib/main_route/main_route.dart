import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../recipe.dart';
import 'recipe_list_view.dart';
import 'top_navigation.dart';

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  TextStyle bodyStyle = TextStyle(
      fontFamily: 'SourceSansPro-Light',
      fontSize: 20.0,
      color: Colors.lightGreen);

  TextStyle headerStyle = TextStyle(
      fontFamily: 'SourceSansPro-Light',
      fontSize: 52.0,
      color: Colors.lightGreen);

  Widget TitleText() {
    return RichText(
      text: TextSpan(style: headerStyle, children: <TextSpan>[
        TextSpan(text: 'RECIPI'),
        TextSpan(text: 'EZ', style: TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }

  //TODO make sure that this is list of recipe objects
  final recipes = Recipe.tempRecipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 36, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TitleText(),
              TopNavigation(bodyStyle: bodyStyle),
              RecipeListView(recipes: recipes)
            ],
          ),
        ),
      ),
    );
  }
}
