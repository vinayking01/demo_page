import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project117/model/transaction.dart';

class ourtransactions_list extends StatelessWidget {
  final List<Transaction> transactions;

  ourtransactions_list(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // make a container with some fixed height where list will be scrollable only on that part not in whole screen
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: Image.asset('assets/images/waiting.png'),
                  )
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                //depends upon the length of the string
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                      title: Text(transactions[index].title,style: Theme.of(context).textTheme.title,),
                      subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)), // always comes below the title even you write in any order
                    ),
                    
                  );
                },
              ));
  }
}
