import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project117/Widget/user_transaction.dart';



void main() {
  runApp(Tracking());
}

class Tracking extends StatelessWidget {

  // String titleInput;
  // String amountInput;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(bottom: 100),
              width: double.infinity, // as much as he can take
              child: Card(
                // card by default depends upon the size of child unless they itself having a parent
                color: Colors.indigoAccent,
                child: Text(
                  "For CHART",
                  style: TextStyle(fontSize: 20),
                ),
                elevation: 20, //this is used for the shadow of the card
              ),
            ),
            //A card in Flutter is in rounded corner shape and has a shadow. We mainly used it to store the content and action of a single object.
          UserTransaction(),
          ],
        ),
      ),
    );
  }
}

