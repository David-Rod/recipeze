import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

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
        title: Text('Chiken Boi Recipe'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => { }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.mode_edit), onPressed: () => { }),
        ],
      ),

      body: SingleChildScrollView(
       child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              'https://gbc-cdn-public-media.azureedge.net/img83669.768x512.jpg',
            )
          ),

          buildSectionTitle(context, 'Preparation'),
          buildContainerPrep(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                  child: Text("Maybe you add something here",
                      style: TextStyle(color: Colors.black),
                      textDirection: TextDirection.ltr)),
              ),

              //itemCount: selectedMeal.ingredients.length
              itemCount: 10,
            ),
          ),
          buildSectionTitle(context, 'Recipe Steps'),
          buildContainerSteps(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text('# ${(index + 1)}'),),
                  title: Text('First you eat everything'),
                    //meal.step[index]


                  ),
                  Divider()
                ],
              ),
              itemCount: 10,
              //itemCount: selectedMeal.steps.length,
            ),
          ),
        ],
       )
      )
    );
  }
}
