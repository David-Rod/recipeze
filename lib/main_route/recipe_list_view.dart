import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../recipe.dart';
import '../recipe_info_page.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    Key key,
    @required this.recipes,
  }) : super(key: key);

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
            height: 580,
            child: ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard(recipe: recipe, color: Colors.white);
                }))
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final Color color;
  final TextStyle headerStyle = TextStyle(
    fontFamily: 'SourceSansPro-Light',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );
  final TextStyle bodyStyle =
      TextStyle(fontFamily: 'SourceSansPro-Light', fontSize: 16.0);

  RecipeCard({@required this.recipe, @required this.color})
      : assert(recipe != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Material(
            color: Colors.transparent,
            child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(recipe.imageURI),
                    fit: BoxFit.cover,
                  ),
                ),
                child: InkWell(
                    highlightColor: Colors.black38,
                    splashColor: Colors.black12,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailScreen(recipe),
                        ),
                      );
                    },
                    onLongPress: null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6.0),
                                  child: Text(
                                    recipe.name,
                                    style: headerStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    "Prep Time: " +
                                        (recipe.prepTime).toString() +
                                        "min",
                                    style: bodyStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    "Cook Time: " +
                                        (recipe.cookTime).toString() +
                                        "min",
                                    style: bodyStyle,
                                  ),
                                ),
                                Text(
                                  "Serves: " + (recipe.servingSize).toString(),
                                  style: bodyStyle,
                                ),
                              ],
                            ),
                          ),
                          //TODO add icon in top left corner to indicate special status of recipe
                          SizedBox(
                            height: 128,
                            width: 0,
                          ),
                        ],
                      ),
                    )))));
  }
}
