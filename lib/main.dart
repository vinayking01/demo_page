

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project117/Widget/transaction_list.dart';
import 'model/transaction.dart';
import 'package:project117/Widget/new_transaction.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: Tracking(),
    );
  }
}

class Tracking extends StatefulWidget {
  @override
  TrackingState createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
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

  void addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        title: txtitle,
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      my_transaction_list.add(newTx);
    });
  }

  void MyBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (MyContext) {
          return GestureDetector(
            onTap: () => {},
            // height: 200,
            child: NewTransaction(addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: <Widget>[
          //actions - a row of list of widget to showcase the icon button
          // Text("data"),
          IconButton(
            onPressed: () => {
              showModalBottomSheet(
                  context: context,
                  builder: (MyContext) {
                    return Container(
                      // height: 200,
                      child: NewTransaction(addNewTransaction),
                    );
                  })
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () => {}, icon: Icon(Icons.add_a_photo_outlined))
        ],
      ),
      body: SingleChildScrollView(
        // added to add the scrolling
        // function and overcoming the problem of overflowed pixels
        // single child scrollview can be added in while page or at any small peice of page eg ;- in some container of list .
        child: Column(
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
            ourtransactions_list(my_transaction_list),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => {
          MyBottomSheet(context),
        },
      ),
    );
  }
}
