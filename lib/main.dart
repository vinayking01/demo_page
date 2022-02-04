import 'package:flutter/material.dart';

void main() {
  runApp(tracking());
}

class tracking extends StatelessWidget {
  @override
Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
     home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
       body: Column(children: <Widget>[
         Card(child: Text("For CHART")),//A card in Flutter is in rounded corner shape and has a shadow. We mainly used it to store the content and action of a single object.
         Card(child: Text("For the LIST"),)
       ],),
     ),
    );
  }

}