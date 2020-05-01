import 'dart:core';

import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final String imageURI;
  final int prepTime;
  final int cookTime;
  final int servingSize;
  var ingredients;
  var prepSteps;

  Recipe(
      @required this.name,
      @required this.imageURI,
      @required this.prepTime,
      @required this.cookTime,
      @required this.servingSize,
      @required this.ingredients,
      @required this.prepSteps)
      : assert(name != null),
        assert(prepTime != null),
        assert(cookTime != null),
        assert(servingSize != null),
        assert(imageURI != null);

  static getRecipes() {
    var recipes;
    return recipes;
  }

  static final tempRecipes = <Recipe>[
    Recipe(
        "Rotisserie Chicken",
        'https://gbc-cdn-public-media.azureedge.net/img83669.768x512.jpg',
        20,
        45,
        6,
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
