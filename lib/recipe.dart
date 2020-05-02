import 'package:path_provider/path_provider.dart';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final String imageURI;
  final int prepTime;
  final int cookTime;
  final int servingSize;
  var cookSteps;
  var prepSteps;

  Recipe(
      @required this.name,
      @required this.imageURI,
      @required this.prepTime,
      @required this.cookTime,
      @required this.servingSize,
      @required this.prepSteps,
      @required this.cookSteps)
      : assert(name != null),
        assert(prepTime != null),
        assert(cookTime != null),
        assert(servingSize != null),
        assert(imageURI != null);

  Recipe.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        prepTime = json['prepTime'],
        cookTime = json['cookTime'],
        servingSize = json['servingSize'],
        imageURI = json['imageURI'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'prepTime': prepTime,
        'cookTime': cookTime,
        'servingSize': servingSize,
        'imageURI': imageURI
      };

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/recipes.json');
  }

  Future<File> addRecipe(Recipe recipe) async {
    final file = await _localFile;
    //TODO: write to json file
    return file;
  }

  static getRecipes() {
    var recipes;
    //TODO get recipes from JSON
    return recipes;
  }

  static final tempRecipes = <Recipe>[
    Recipe(
        "Rotisserie Chicken",
        'https://gbc-cdn-public-media.azureedge.net/img83669.768x512.jpg',
        20,
        45,
        6, <String>[
      "prepare spice mix using salt, sugar, and tears",
      "fetch string for tying of the chicken",
      "set aside a bowl of rice",
      "add chicken flavoring and garlic salt into rice bowl"
          "let chickem soak in rub for one day"
    ], <String>[
      "once chicken has soaked in rub, take it out of the fridge and give it a lil smooch",
      "pre heat the oven to 350F",
      "as the oven preheats prepare rice pot with two cups of water and a splash of olive oil"
          "bring the water to a bowl and then add rice mix to the water",
      "after 10 minutes, lid the rice and put the heat on low. let simmer until coooked",
      "once oven is ready, place chicken in oven and let cook for 30 minutes"
          "to serve place rice on dish and then place chicken on rice. Enjoy!"
    ]),
    Recipe(
        "Fluffy Pancakes",
        'https://images.media-allrecipes.com/userphotos/720x405/5079227.jpg',
        10,
        15,
        4,
        null,
        null),
    Recipe(
        "Mangoyada",
        'https://tucsonfoodie.com/wp-content/uploads/2016/06/Sonoran-Sno-Cones.jpg',
        10,
        3,
        1,
        null,
        null),
    Recipe(
        "Dragon Roll Sushi",
        'https://www.justonecookbook.com/wp-content/uploads/2016/04/Dragon-Roll-New-500x400.jpg',
        25,
        30,
        4,
        null,
        null),
    Recipe(
        "Rotisserie Chicken",
        'https://gbc-cdn-public-media.azureedge.net/img83669.768x512.jpg',
        10,
        12,
        3,
        null,
        null),
    Recipe(
        "Fluffy Pancakes",
        'https://images.media-allrecipes.com/userphotos/720x405/5079227.jpg',
        10,
        15,
        4,
        null,
        null),
    Recipe(
        "Mangoyada",
        'https://tucsonfoodie.com/wp-content/uploads/2016/06/Sonoran-Sno-Cones.jpg',
        10,
        3,
        1,
        null,
        null),
    Recipe(
        "Dragon Roll Sushi",
        'https://www.justonecookbook.com/wp-content/uploads/2016/04/Dragon-Roll-New-500x400.jpg',
        25,
        30,
        4,
        null,
        null),
  ];
}
