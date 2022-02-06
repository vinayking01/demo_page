import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(Tracking());
}

class Tracking extends StatelessWidget {
  final List<Transaction> my_transaction_list = [
    Transaction(
        id: 't1', amount: 69.099, date: DateTime.now(), title: "New shoes"),
    Transaction(
        id: 't2', amount: 63.099, date: DateTime.now(), title: "New bag"),
    Transaction(
        id: 't3', amount: 16.099, date: DateTime.now(), title: "New phone"),
    Transaction(
        id: 't4',
        amount: 89.099,
        date: DateTime.now(),
        title: "New Grocceries"),
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
              height: 40,
              margin: EdgeInsets.only(top: 100,bottom: 100),
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
            Column(
                children: my_transaction_list.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$${tx.amount}", // beacuse when we use $ in dart it means it trying to manipulate the string but i want to act that as symbol so this is simple concept to use it
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.purple),), //need to convert because inside in text
                    ),
              Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                              "${tx.title.toString()}",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),), //need to convert because inside in text
                        ),
                        Container(
                          child: Text(
                              "${tx.date.toString()}",style: TextStyle(fontSize: 11,color: Colors.grey),), //need to convert because inside in text
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}
