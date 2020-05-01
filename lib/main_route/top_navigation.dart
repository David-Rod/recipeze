import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({
    Key key,
    @required this.bodyStyle,
  }) : super(key: key);

  final TextStyle bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 42,
          width: 42,
          child: Image.asset('images/search.png', fit: BoxFit.contain),
        ),
        Expanded(
          child: TextField(
            style: bodyStyle,
            decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 10.0),
                hintText: "Find your next meal",
                hintStyle: TextStyle(color: Colors.black38),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                )),
          ),
        ),
        SizedBox(
          height: 64,
          width: 64,
          child: IconButton(
              padding: EdgeInsets.all(0),
              iconSize: 64,
              splashColor: Colors.pinkAccent,
              icon: Icon(
                Icons.add_circle,
                color: Theme.of(context).accentColor,
              ),
              onPressed: null //TODO add navigation to add_recipe_page,
              ),
        ),
      ],
    );
  }
}
