import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project117/Widget/chart.dart';
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
      theme: ThemeData(
          // no need to manually add the theme color below anywhere
          // primaryColor: Colors.green,
          primarySwatch: Colors.red,
          accentColor: Colors.amberAccent,
          fontFamily: 'OpenSans',
          appBarTheme: AppBarTheme( // by using this we have not to change in every page of same app in the appvar
              textTheme: ThemeData.light().textTheme.copyWith(  // copying the theme to every page connected
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 15)))),
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
  //   Transaction(
  //       id: 't1', amount: 69.099, date: DateTime.now(), title: "New shoes"),
  //   Transaction(
  //       id: 't2', amount: 63.099, date: DateTime.now(), title: "New bag"),
  //   Transaction(
  //       id: 't3', amount: 16.099, date: DateTime.now(), title: "New phone"),
  //   Transaction(
  //       id: 't4',
  //       amount: 89.099,
  //       date: DateTime.now(),
  //       title: "New Grocceries"),
  ];
List<Transaction> get recenttransaction{
  return my_transaction_list.where((tx){
    return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
  }).toList();
}
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
        // backgroundColor: Colors.red,
        title: Text("Personal Expenses"),
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
            chart(recenttransaction),
            //A card in Flutter is in rounded corner shape and has a shadow. We mainly used it to store the content and action of a single object.
            ourtransactions_list(my_transaction_list),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // this is added just to center at the bottom no need to do it manually
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // backgroundColor: Colors.red, // take color from theme
        onPressed: () => {
          MyBottomSheet(context),
        },
      ),
    );
  }
}
