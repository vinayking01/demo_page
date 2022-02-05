import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(tracking());
}

class tracking extends StatelessWidget {
  final List<Transaction> my_transaction_list = [
    Transaction(
        id: 't1', amount: 69.099, date: DateTime.now(), title: "New shoes"),
    Transaction(
        id: 't2', amount: 639.099, date: DateTime.now(), title: "New bag"),
    Transaction(
        id: 't3', amount: 169.099, date: DateTime.now(), title: "New phone"),
    Transaction(
        id: 't4', amount: 89.099, date: DateTime.now(), title: "New Grocceries"),

  ];

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
              width: double.infinity, // as much as he can take
              child: Card(
                // card by default depends upon the size of child unless they itself having a parent
                color: Colors.indigoAccent,
                child: Text(
                  "For CHART",
                  style: TextStyle(fontSize: 30),
                ),
                elevation: 20, //this is used for the shadow of the card
              ),
            ),
            //A card in Flutter is in rounded corner shape and has a shadow. We mainly used it to store the content and action of a single object.
           Column(
             children: my_transaction_list.map((tx){
               return Card(child: Text(tx.title),);
             }).toList()
           )
          ],
        ),
      ),
    );
  }
}
