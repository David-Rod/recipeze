import 'package:flutter/material.dart';
import 'package:recipeze/recipe.dart';

class MealDetailScreen extends StatelessWidget {
  final Recipe recipe;
  MealDetailScreen(@required this.recipe) : assert(recipe != null);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainerPrep(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 500,
      child: child,
    );
  }

  Widget buildContainerSteps(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 400,
      width: 500,
      child: child,
    );
  }

  Widget imageContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 150,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.name),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.mode_edit), onPressed: () => {}),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  recipe.imageURI,
                )),
            buildSectionTitle(context, 'Preparation'),
            buildContainerPrep(
              ListView.builder(
                //itemCount: selectedMeal.ingredients.length
                itemCount: (recipe.prepSteps).length,
                itemBuilder: (ctx, index) {
                  final prepSteps = recipe.prepSteps;

                  return Card(
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        child: Text(prepSteps[index],
                            style: TextStyle(color: Colors.black),
                            textDirection: TextDirection.ltr)),
                  );
                },
              ),
            ),
            buildSectionTitle(context, 'Recipe Steps'),
            buildContainerSteps(
              ListView.builder(
                itemCount: recipe.cookSteps.length,
                itemBuilder: (ctx, index) {
                  final cookSteps = recipe.cookSteps;
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(cookSteps[index]),
                        //meal.step[index]
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        )));
  }
}
